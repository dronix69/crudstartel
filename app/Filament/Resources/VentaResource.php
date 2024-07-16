<?php

namespace App\Filament\Resources;

use App\Filament\Exports\VentaExporter;
use App\Filament\Resources\VentaResource\Pages;
use App\Filament\Resources\VentaResource\RelationManagers;
use App\Models\Matricula;
use App\Models\Venta;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Filament\Infolists\Components\TextEntry;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Forms\Components\Toggle;
use Filament\Support\Facades\FilamentIcon;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\DatePicker;
use Filament\Forms\Get;
use Filament\Forms\Set;
use Filament\Tables\Filters\Filter;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ExportBulkAction;


class VentaResource extends Resource
{
    protected static ?string $model = Venta::class;

    protected static ?string $navigationIcon = 'heroicon-o-credit-card';

    protected static ?string $navigationGroup = 'School';

    protected static ?int $navigationSort = 1;

    public static function getNavigationBadge(): ?string
    {
        return static::getModel()::count();
    }

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make('Datos')
                            ->schema([
                                Forms\Components\Select::make('matricula_id')
                                    ->label('Rut de la Matricula')
                                    ->options(Matricula::pluck('rut', 'id'))
                                    ->searchable()
                                    ->live()
                                    ->afterStateUpdated(function ($state, Forms\Set $set) {  //Esta funcion me coloca el nombre y el apellido cuando seleciono el rut.
                                        if ($state) {
                                            $matricula = Matricula::find($state);
                                            if ($matricula) {
                                                $set('nombre', $matricula->nombre);
                                                $set('apellido', $matricula->apellido);
                                            }
                                        }
                                    }),
                                Forms\Components\TextInput::make('nombre')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('apellido')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('boleta')
                                    ->required()
                                    ->maxValue(20)
                                    ->unique(
                                        table: 'ventas', 
                                        ignoreRecord: true
                                    ),
                                Forms\Components\Select::make('forma_pago')
                                    ->required()
                                    ->options([
                                        'efectivo' => 'Efectivo',
                                        'debito' => 'Debito',
                                        'credito' => 'Credito',
                                        'transferencia' => 'Transferencia',
                                    ])
                                    ->columnSpan('full'),
                            ])->columns('2')
                    ]),
                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make('Fechas')
                            ->schema([
                                Forms\Components\DatePicker::make('fecha_pago')
                                    ->required()
                                    ->default(Carbon::now()->toDateString()),
                                Forms\Components\TextInput::make('valor')
                                    ->label('Valor del Curso')
                                    ->required()
                                    ->numeric()
                                    ->prefix('$')
                                    ->maxValue(42949672.95)

                                    ->live()
                                    ->afterStateUpdated(function (Get $get, Set $set) {   //esta funcion realiza la divicion del valor del curso con las coutas.
                                        $cuota = (int) $get('cuota');
                                        $valor = (float) $get('valor');
                                        if ($cuota > 0) {
                                            $total = $valor / $cuota;
                                            $set('total', number_format($total, 2, '.', ''));
                                        }
                                    }),
                                Forms\Components\Select::make('cuota')
                                    ->required()
                                    ->options([
                                        '1' => '1',
                                        '2' => '2',
                                        '3' => '3',
                                        '4' => '4',
                                        '5' => '5',

                                    ])

                                    ->live()
                                    ->afterStateUpdated(function (Get $get, Set $set) {  //esta funcion realiza la divicion del valor del curso con las coutas.
                                        $cuota = (int) $get('cuota');
                                        $valor = (float) $get('valor');
                                        if ($cuota > 0) {
                                            $total = $valor / $cuota;
                                            $set('total', number_format($total, 2, '.', ''));
                                        }
                                    }),
                                Forms\Components\TextInput::make('total')
                                    ->numeric()
                                    ->prefix('$')
                                    ->maxValue(42949672.95)
                                    ->inputMode('decimal'),

                                Forms\Components\Toggle::make('cancelado')
                                    ->onColor('success')
                                    ->offColor('danger'),
                            ])->columns('2')
                    ])



            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('matricula.rut')
                    ->label('Rut')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('nombre')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('apellido')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('boleta')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('forma_pago')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('fecha_pago')
                    ->date()
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('cuota')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('valor')
                    ->label('Valor del Curso')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('total')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\IconColumn::make('cancelado')
                    ->boolean(),
                Tables\Columns\TextColumn::make('created_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
                Tables\Columns\TextColumn::make('updated_at')
                    ->dateTime()
                    ->sortable()
                    ->toggleable(isToggledHiddenByDefault: true),
            ])
            ->filters([
                Filter::make('fecha_pago')
                    ->form([
                        DatePicker::make('fecha_inicio'),
                        DatePicker::make('fecha_termino'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['fecha_inicio'],
                                fn (Builder $query, $date): Builder => $query->whereDate('fecha_pago', '>=', $date),
                            )
                            ->when(
                                $data['fecha_termino'],
                                fn (Builder $query, $date): Builder => $query->whereDate('fecha_pago', '<=', $date),
                            );
                    })
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),

                    // Boton para exportar en excel
                ExportBulkAction::make()->exporter(VentaExporter::class)  
                ]),
            ]);
    }

    public static function getRelations(): array
    {
        return [
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListVentas::route('/'),
            'create' => Pages\CreateVenta::route('/create'),
            'edit' => Pages\EditVenta::route('/{record}/edit'),
        ];
    }
}
