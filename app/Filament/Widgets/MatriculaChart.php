<?php

namespace App\Filament\Widgets;

use App\Models\Matricula;
use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;


class MatriculaChart extends ChartWidget
{
    protected static ?int $sort = 4;
    protected static ?string $heading = 'Chart Matriculas';

    protected function getData(): array
    {


        $data = Trend::model(Matricula::class)
        ->between(
            start: now()->startOfYear(),
            end: now()->endOfYear(),
        )
        ->perMonth()
        ->count();
        return [
            'datasets' => [
                [
                    'label' => 'Matriculas Creadas',
                    'data' => $data->map(fn (TrendValue $value) => $value->aggregate),

                ]

            ],

            'labels' => $data->map(fn (TrendValue $value) => $value->date),
        ];
        
    }

    protected function getType(): string
    {
        return 'bar';
    }
}
