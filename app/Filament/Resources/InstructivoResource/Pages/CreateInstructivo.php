<?php

namespace App\Filament\Resources\InstructivoResource\Pages;

use App\Filament\Resources\InstructivoResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateInstructivo extends CreateRecord
{
    protected static string $resource = InstructivoResource::class;


    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
