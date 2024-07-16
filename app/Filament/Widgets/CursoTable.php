<?php

namespace App\Filament\Widgets;

use App\Filament\Resources\CursoResource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Widgets\TableWidget as BaseWidget;

class CursoTable extends BaseWidget
{



    protected static ?int $sort = 6;

    protected int | string | array $columnSpan = 'full';

    protected static ?string $heading = 'Tabla de Cursos';

    public function table(Table $table): Table
    {
        return $table
            ->query(CursoResource::getEloquentQuery())

            ->defaultSort(column:'created_at', direction:'desc')

            ->columns([
                Tables\Columns\TextColumn::make('curso')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('codigo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('tipo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
            ]);
    }
}
