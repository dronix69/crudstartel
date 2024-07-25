<?php

namespace App\Filament\Resources;

use App\Filament\Exports\MatriculaExporter;
use App\Filament\Resources\MatriculaResource\Pages;
use App\Filament\Resources\MatriculaResource\RelationManagers;
use App\Models\Matricula;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;
use Filament\Tables\Columns\ImageColumn;
use Filament\Tables\Filters\SelectFilter;
use Filament\Forms\Components\DatePicker;
use Filament\Tables\Actions\ExportAction;
use Filament\Tables\Actions\ExportBulkAction;
use Filament\Tables\Filters\Filter;
use Barryvdh\DomPDF\Facade\Pdf;
use Carbon\Carbon;
use Filament\Tables\Actions\Action;

class MatriculaResource extends Resource
{
    protected static ?string $model = Matricula::class;

    protected static ?string $navigationIcon = 'heroicon-o-trophy';

    protected static ?string $navigationGroup = 'School';

    protected static ?int $navigationSort = 0;

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
                                Forms\Components\TextInput::make('codigo')
                                ->disabled()
                                ->dehydrated(false)
                                ->columnSpan('full')
                                ->label('Código de Matricula')
                                ->helperText('Este código se generará automáticamente al guardar.'),
                                Forms\Components\TextInput::make('nombre')
                                    ->required()
                                    ->maxValue(50),
                                Forms\Components\TextInput::make('apellido')
                                    ->required()
                                    ->maxValue(50),
                                Forms\Components\TextInput::make('rut')
                                    ->unique(
                                        table: 'matriculas', 
                                        ignoreRecord: true
                                    )
                                    ->required()
                                    ->maxValue(12),
                                Forms\Components\TextInput::make('correo')
                                    ->prefixIcon('heroicon-m-envelope-open')
                                    ->required()
                                    ->email()
                                    ->unique(ignoreRecord: true),
                                Forms\Components\TextInput::make('telefono')
                                    ->prefixIcon('heroicon-m-device-phone-mobile')
                                    ->label('Telefono')
                                    ->tel()
                                    ->required()
                                    ->maxValue(15),
                                Forms\Components\TextInput::make('edad')
                                    ->required()
                                    ->maxValue(3),
                                Forms\Components\TextInput::make('direccion')
                                    ->required()
                                    ->maxValue(255),
                                Forms\Components\TextInput::make('comuna')
                                    ->required()
                                    ->maxValue(50),
                                Forms\Components\Select::make('nivel')
                                    ->label('Nivel de Escolaridad')
                                    ->required()
                                    ->options([
                                        'Basica Incompleta' => 'Basica Incompleta',
                                        'Basica Completa' => 'Basica Completa',
                                        'Media Incompleta' => 'Media Incompleta',
                                        'Media Completa' => 'Media Completa',
                                        'Tecnico' => 'Tecnico',
                                        'Universitario' => 'Universitario',
                                    ]),
                                Forms\Components\Select::make('licencia_actual')
                                    ->required()
                                    ->options([
                                        'B' => 'B',
                                        'A2' => 'A2',
                                        'A3' => 'A3',
                                        'A4' => 'A4',
                                        'A5' => 'A5',
                                    ]),    
                                Forms\Components\Select::make('cursos_id')
                                    ->relationship('curso', 'codigo')
                                    ->required()
                                    ->searchable()
                                    ->preload()
                                    ->columnSpan('full'),
                            ])->columns('2')
                    ]),

                Forms\Components\Group::make()
                    ->schema([
                        Forms\Components\Section::make('Fechas')
                            ->schema([
                                Forms\Components\DatePicker::make('fecha_matricula')
                                    ->date()
                                    ->default(Carbon::now()->toDateString()),
                                Forms\Components\DatePicker::make('fecha_nacimiento')
                                    ->date()
                                    ->required(),
                                Forms\Components\FileUpload::make('image_url')
                                    ->label('Sube una Imagen')
                                    ->disk('public')
                                    ->directory('image-filament')
                                    ->image()
                                    ->preserveFilenames()
                                    ->imageEditor()
                                    ->columnSpan('full')
                            ])->columns('2')
                    ])

                    

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\ImageColumn::make('image_url')
                    ->square(),
                Tables\Columns\TextColumn::make('codigo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('nombre')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('apellido')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('rut')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('correo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('telefono')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('edad')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('fecha_matricula')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('fecha_nacimiento')
                    ->date()
                    ->sortable(),
                Tables\Columns\TextColumn::make('direccion')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('comuna')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('nivel')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('licencia_actual')
                    ->sortable()
                    ->searchable(),    
                Tables\Columns\TextColumn::make('curso.codigo')
                    ->label('Curso')
                    ->sortable()
                    ->toggleable(),
                
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
                
                Filter::make('fecha_matricula')
                    ->form([
                        DatePicker::make('fecha_inicio'),
                        DatePicker::make('fecha_termino'),
                    ])
                    ->query(function (Builder $query, array $data): Builder {
                        return $query
                            ->when(
                                $data['fecha_inicio'],
                                fn (Builder $query, $date): Builder => $query->whereDate('fecha_matricula', '>=', $date),
                            )
                            ->when(
                                $data['fecha_termino'],
                                fn (Builder $query, $date): Builder => $query->whereDate('fecha_matricula', '<=', $date),
                            );
                    })
            ])
            ->actions([
                Tables\Actions\ViewAction::make(),
                Tables\Actions\EditAction::make(),
            
                // Boton para imprimir contrato del alumno
                Action::make('imprimir_contrato')
                    ->label('Imprimir Contrato')
                    ->icon('heroicon-o-printer')
                    ->action(function (Matricula $record) {
                        $matricula = $record->load('venta');
                        $pdf = Pdf::loadView('contratos.matricula', ['matricula' => $matricula]);
                        return response()->streamDownload(function () use ($pdf) {
                            echo $pdf->output();
                        }, 'contrato_' . $record->rut . '.pdf');
                    })
            ])
            ->headerActions([
                ExportAction::make()->exporter(MatriculaExporter::class)
            ])
            ->bulkActions([
                Tables\Actions\BulkActionGroup::make([
                    Tables\Actions\DeleteBulkAction::make(),


                    // Boton para exportar en excel
                ExportBulkAction::make()->exporter(MatriculaExporter::class)    
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
            'index' => Pages\ListMatriculas::route('/'),
            'create' => Pages\CreateMatricula::route('/create'),
            'edit' => Pages\EditMatricula::route('/{record}/edit'),
        ];
    }

       
}
