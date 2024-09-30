<?php

namespace App\Filament\Resources\InstructivoResource\Pages;

use App\Filament\Resources\InstructivoResource;
use Filament\Actions;
use Filament\Resources\Pages\EditRecord;

class EditInstructivo extends EditRecord
{
    protected static string $resource = InstructivoResource::class;

    protected function getHeaderActions(): array
    {
        return [
            Actions\DeleteAction::make(),
        ];
    }
}
