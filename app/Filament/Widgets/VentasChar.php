<?php

namespace App\Filament\Widgets;

use App\Models\Venta;
use Carbon\Carbon;
use Filament\Widgets\ChartWidget;
use Flowframe\Trend\Trend;
use Flowframe\Trend\TrendValue;

class VentasChar extends ChartWidget
{

    protected static ?int $sort = 3;
    protected static ?string $heading = 'Chart Ventas';

    public ?string $filter = 'today';

    protected function getFilters(): ?array
    {
        return [
            'today' => 'Today',
            'week' => 'Last week',
            'month' => 'Last month',
            'year' => 'This year',
        ];
    }

    protected function getData(): array
    {

        $activeFilter = $this->filter;


        $data = Trend::model(Venta::class)
        ->between(
            start: now()->startOfYear(),
            end: now()->endOfYear(),
        )
        ->perMonth()
        ->count();
        return [

            'datasets' => [
                [
                    'label' => 'Ventas realizadas',
                    'data' => $data->map(fn (TrendValue $value) => $value->aggregate),
                    'backgroundColor' => '#4263eb',
                    'borderColor' => '#ff004c',

                ]

            ],

            'labels' => $data->map(fn (TrendValue $value) => $value->date),
        ];
    }

    protected function getType(): string
    {
        return 'line';
    }


    private function getVentasPerMonth(): array
    {

        $now = Carbon::now();
        $ventasPerMonth = [];

        $months = collect(range(start:1, end:12))->map(function($month) use ($now, $ventasPerMonth){
            $count = Venta::whereMonth('created_at', Carbon::parse($now->month($month)->format
            (format:'Y-m')))->count();

            $ventasPerMonth[] = $count;

            return $now->month($month)->format(format: 'M');
        })->toArray();


        return [

            'ventasPerMonth' => $ventasPerMonth,

            'months' => $months
        ];


    } 


}
