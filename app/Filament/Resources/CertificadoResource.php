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
use Barryvdh\DomPDF\Facade\Pdf;
use Filament\Forms\Components\Select;
use Filament\Tables\Actions\Action;

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
                                                $set('rut', $venta->rut);
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
                                Forms\Components\TextInput::make('rut')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('nombre')
                                    ->dehydrated(true),
                                Forms\Components\TextInput::make('apellido')
                                    ->dehydrated(true),
                                
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
                Tables\Columns\TextColumn::make('rut')
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

                // Boton para imprimir contrato del alumno
                /*Action::make('imprimir_certificado')
                    ->label('Imprimir Certificado')
                    ->icon('heroicon-o-printer')
                    ->action(function (Certificado $record) {
                        $pdf = Pdf::loadView('certificados.certificado', ['certificado' => $record]);
                        return response()->streamDownload(function () use ($pdf) {
                            echo $pdf->output();
                        }, 'certificado_' . $record->rut . '.pdf');
                    }) */


                     // Boton seleccionar un certificado y poder imprimir un pdf del alumno
                    Action::make('imprimir_certificado')
                    ->label('Imprimir Certificado')
                    ->icon('heroicon-o-printer')
                    ->form([
                        Select::make('tipo_certificado')
                            ->label('Seleciona el Certificado')
                            ->options([
                                'certificado' => 'SIT',
                                'profesional' => 'PROF',
                            ])
                            ->required(),
                    ])
                    ->action(function (Certificado $record, array $data) {
                        $tipoCertificado = $data['tipo_certificado'];
                        $view = $tipoCertificado === 'certificado' ? 'certificado' : 'profesional';
                        
                        $pdf = PDF::loadView("certificados.{$view}", ['certificado' => $record]);
                        return response()->streamDownload(function () use ($pdf) {
                            echo $pdf->output();
                        }, "{$tipoCertificado}_certificado.pdf");
                    }),

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
