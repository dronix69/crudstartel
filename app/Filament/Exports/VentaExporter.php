<?php

namespace App\Filament\Exports;

use App\Models\Venta;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class VentaExporter extends Exporter
{
    protected static ?string $model = Venta::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nombre'),
            ExportColumn::make('apellido'),
            ExportColumn::make('boleta'),
            ExportColumn::make('forma_pago'),
            ExportColumn::make('fecha_pago'),
            ExportColumn::make('cuota'),
            ExportColumn::make('valor'),
            ExportColumn::make('total'),
            
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your venta export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
