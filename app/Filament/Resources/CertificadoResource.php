<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CertificadoResource\Pages;
use App\Filament\Resources\CertificadoResource\RelationManagers;
use App\Models\Certificado;
use App\Models\Curso;
use App\Models\Matricula;
use App\Models\Venta;
use Carbon\Carbon;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Support\Facades\FilamentIcon;
use Filament\Tables\Filters\SelectFilter;

class CertificadoResource extends Resource
{
    protected static ?string $model = Certificado::class;

    protected static ?string $navigationIcon = 'heroicon-o-computer-desktop';

    protected static ?string $navigationGroup = 'School';

    protected static ?int $navigationSort = 3;


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
                                Forms\Components\Select::make('venta_id')
                                    ->label('Boleta de Venta')
                                    ->options(Venta::pluck('boleta', 'id'))
                                    ->searchable()
                                    ->live()
                                    ->afterStateUpdated(function ($state, Forms\Set $set) {  //Esta funcion me coloca el nombre y el apellido cuando seleciono el Boleta.
                                        if ($state) {
                                            $venta = Venta::find($state);
                                            if ($venta) {
                                                $set('nombre', $venta->nombre);
                                                $set('apellido', $venta->apellido);
                                            }
                                        }
                                    })
                                    ->unique(Certificado::class, 'venta_id')
                                    ->rules([
                                        function () {
                                            return function (string $attribute, $value, \Closure $fail) {
                                                $venta = Venta::find($value);

                                                if (!$venta) {
                                                    $fail("No se encontró una venta asociada a este Boleta.");
                                                } elseif (!$venta->cancelado) {
                                                    $fail("El alumno tiene una deuda pendiente.");
                                                }
                                            };
                                        },
                                    ]),

                                Forms\Components\TextInput::make('nombre')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('apellido')
                                    ->dehydrated(true),
                                Forms\Components\Select::make('rut')
                                    ->label('RUT')
                                    ->options(Matricula::pluck('rut', 'rut'))
                                    ->searchable()
                                    ->preload()
                                    ->required()
                                    ->live()
                                    ->afterStateUpdated(function ($state, Forms\Set $set) {
                                        if ($state) {
                                            $matricula = Matricula::where('rut', $state)->first();
                                            if ($matricula) {
                                                $set('matricula_id', $matricula->id);
                                            }
                                        }
                                    }),
                                Forms\Components\Hidden::make('matricula_id'),  //Es un campo oculto

                                Forms\Components\Select::make('codigo_curso')
                                    ->label('Código Curso')
                                    ->options(Curso::pluck('codigo', 'codigo'))
                                    ->searchable()
                                    ->live()
                                    ->afterStateUpdated(function ($state, Forms\Set $set) {
                                        if ($state) {
                                            $curso = Curso::where('codigo', $state)->first();
                                            if ($curso) {
                                                $set('curso_id', $curso->id);
                                                $set('curso', $curso->curso);
                                                $set('tipo', $curso->tipo);
                                            }
                                        }
                                    }),
                                Forms\Components\Hidden::make('curso_id'),  //Es un campo oculto
                                Forms\Components\TextInput::make('curso')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('tipo')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('certificado')
                                    ->unique()
                                    ->required()
                                    ->maxValue(50),
                            ])->columns('2')
                    ]),
                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make('Fechas')
                            ->schema([
                                Forms\Components\DatePicker::make('fecha_ini')
                                    ->date()
                                    ->required(),
                                Forms\Components\DatePicker::make('fecha_fin')
                                    ->date()
                                    ->required(),

                                Forms\Components\DatePicker::make('fecha_otorgado')
                                    ->date()
                                    ->required()
                                    ->default(Carbon::now()->toDateString()),

                            ])->columns('2')
                    ])

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('venta.boleta')
                    ->sortable()
                    ->searchable(),
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
                Tables\Columns\TextColumn::make('codigo_curso')
                    ->label('Codigo Curso')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('curso')
                    ->label('Curso')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('tipo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('fecha_ini')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('fecha_fin')
                    ->date()
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('certificado')
                    ->searchable(),
                Tables\Columns\TextColumn::make('fecha_otorgado')
                    ->date()
                    ->sortable()
                    ->searchable(),
                Tables\Columns\IconColumn::make('venta_id')
                    ->label('cancelado')
                    ->boolean(),
                Tables\Columns\TextColumn::make('venta.total')
                    ->label('Total Cancelado'),
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
                SelectFilter::make('codigo_curso')
                    ->relationship('curso', 'codigo')
                    ->searchable()
                    ->preload()
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),
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
            'index' => Pages\ListCertificados::route('/'),
            'create' => Pages\CreateCertificado::route('/create'),
            'edit' => Pages\EditCertificado::route('/{record}/edit'),
        ];
    }
}