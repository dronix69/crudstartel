<?php

namespace App\Filament\Exports;

use App\Models\Matricula;
use Filament\Actions\Exports\ExportColumn;
use Filament\Actions\Exports\Exporter;
use Filament\Actions\Exports\Models\Export;

class MatriculaExporter extends Exporter
{
    protected static ?string $model = Matricula::class;

    public static function getColumns(): array
    {
        return [
            ExportColumn::make('nombre'),
            ExportColumn::make('apellido'),
            ExportColumn::make('rut'),
            ExportColumn::make('correo'),
            ExportColumn::make('telefono'),
        ];
    }

    public static function getCompletedNotificationBody(Export $export): string
    {
        $body = 'Your matricula export has completed and ' . number_format($export->successful_rows) . ' ' . str('row')->plural($export->successful_rows) . ' exported.';

        if ($failedRowsCount = $export->getFailedRowsCount()) {
            $body .= ' ' . number_format($failedRowsCount) . ' ' . str('row')->plural($failedRowsCount) . ' failed to export.';
        }

        return $body;
    }
}
