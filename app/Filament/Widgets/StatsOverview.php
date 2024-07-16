<?php

namespace App\Filament\Widgets;

use App\Models\Certificado;
use App\Models\Matricula;
use App\Models\Venta;
use Filament\Widgets\StatsOverviewWidget as BaseWidget;
use Filament\Widgets\StatsOverviewWidget\Stat;




class StatsOverview extends BaseWidget
{

    protected static ?int $sort = 2;

    protected static ?string $pollingInterval = '15s';

    protected static bool $islazy = true;


    protected function getStats(): array
    {
        return [
            Stat::make(label:'Total Matriculas', value: Matricula::count())
                ->description('Muestra el total de Matriculados')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7,5,2,4,5,2]),

            Stat::make(label:'Total Ventas', value: Venta::count())
                ->description('Muestra el total de Ventas')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7,5,2,4,5,2]),

            Stat::make(label:'Total Certificados', value: Certificado::count())
                ->description('Total Certificados Emitidos')
                ->descriptionIcon('heroicon-m-arrow-trending-up')
                ->color('success')
                ->chart([7,5,2,4,5,2]),
                
        ];
    }
}
