<?php

namespace App\Filament\Resources;

use App\Filament\Resources\InstructivoResource\Pages;
use App\Filament\Resources\InstructivoResource\RelationManagers;
use App\Models\Instructivo;
use Filament\Forms;
use Filament\Forms\Form;
use Filament\Resources\Resource;
use Filament\Tables;
use Filament\Tables\Table;
use Illuminate\Database\Eloquent\Builder;
use Illuminate\Database\Eloquent\SoftDeletingScope;

class InstructivoResource extends Resource
{
    protected static ?string $model = Instructivo::class;

    protected static ?string $navigationIcon = 'heroicon-o-chat-bubble-bottom-center';

    protected static ?string $navigationGroup = 'Manuales';

    protected static ?int $navigationSort = 6;

    public static function form(Form $form): Form
    {
        return $form
            ->schema([
                Forms\Components\TextInput::make('titulo')
                    ->required()
                    ->maxValue(50),
                Forms\Components\Select::make('categoria')
                    ->required()
                    ->options([
                        'administrativo' => 'Administrativo',
                        'instructor' => 'Instructor',
                        'profesor' => 'Profesor',
                    ]),
                Forms\Components\RichEditor::make('contenido')
                    ->required()
                    ->columnSpan('full')

            ]);
    }

    public static function table(Table $table): Table
    {
        return $table
            ->columns([
                Tables\Columns\TextColumn::make('id')
                    ->label('Numero'),
                Tables\Columns\TextColumn::make('titulo')
                    ->sortable()
                    ->searchable(),
                Tables\Columns\TextColumn::make('categoria')
                    ->sortable()
                    ->searchable(),
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
            //
        ];
    }

    public static function getPages(): array
    {
        return [
            'index' => Pages\ListInstructivos::route('/'),
            'create' => Pages\CreateInstructivo::route('/create'),
            'edit' => Pages\EditInstructivo::route('/{record}/edit'),
        ];
    }
}
