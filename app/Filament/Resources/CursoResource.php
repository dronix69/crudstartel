<?php

namespace App\Filament\Resources;

use App\Filament\Resources\CursoResource\Pages;
use App\Filament\Resources\CursoResource\RelationManagers;
use App\Filament\Resources\CursoResource\RelationManagers\MatriculaRelationManager;
use App\Models\Curso;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class CursoResource extends Resource
{
    protected static ?string $model = Curso::class;

    protected static ?string $navigationIcon = 'heroicon-o-academic-cap';

    protected static ?string $navigationGroup = 'School';

    protected static ?int $navigationSort = 2;

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
                                    Forms\Components\Select::make('curso')
                                        ->required()
                                        ->options([
                                            'B' => 'B',
                                            'A-2' => 'A-2',
                                            'A-3' => 'A-3',
                                            'A-4' => 'A-4',
                                            'A-5' => 'A-5',
                                            'A-2yA-4' => 'A-2 & A-4',
                                            'A-3yA-5' => 'A-3 & A-5',
                                        ]),
                                    Forms\Components\TextInput::make('codigo')
                                        ->unique()
                                        ->required()
                                        ->maxValue(50),
                                    Forms\Components\Select::make('tipo')
                                        ->options([
                                        'presencial' => 'Presencial',
                                        'elearning' => 'E-learning',
                                        ])
                                        ->columnSpan('full'),
                                ])->columns('2')
                            ]),
                Forms\Components\Group::make()
                        ->schema([
                            Forms\Components\Section::make('Fechas')
                                ->schema([
                                    Forms\Components\DatePicker::make('fecha_in')
                                        ->date()
                                        ->required(),
                                    Forms\Components\DatePicker::make('fecha_fin')
                                        ->date()
                                        ->required(),
                                ])->columns('2')
                             ])
                
                
                 ]);
    }

    public static function table(Table $table): Table
    {
        return $table
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
                Tables\Columns\TextColumn::make('fecha_in')
                    ->date()
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('fecha_fin')
                    ->date()
                    ->sortable()
                    ->searchable(),
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
                //
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
           
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListCursos::route('/'),
            'create' => Pages\CreateCurso::route('/create'),
            'edit' => Pages\EditCurso::route('/{record}/edit'),
        ];
    }
}
