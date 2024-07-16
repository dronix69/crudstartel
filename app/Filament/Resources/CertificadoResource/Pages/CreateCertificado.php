<?php

namespace App\Filament\Resources\CertificadoResource\Pages;

use App\Filament\Resources\CertificadoResource;
use Filament\Actions;
use Filament\Resources\Pages\CreateRecord;

class CreateCertificado extends CreateRecord
{
    protected static string $resource = CertificadoResource::class;

    protected function getRedirectUrl(): string
    {
        return $this->getResource()::getUrl('index');
    }
}
