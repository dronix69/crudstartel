<?php

namespace App\Policies;

use App\Models\Certificado;
use App\Models\User;
use Illuminate\Auth\Access\Response;

class CertificadoPolicy
{
    /**
     * Determine whether the user can view any models.
     */
    public function viewAny(User $user): bool
    {
        return $user->hasRole(['Editor']);
    }

    /**
     * Determine whether the user can view the model.
     */
    public function view(User $user, Certificado $certificado): bool
    {
        return $user->hasRole(['Editor']);
    }

    /**
     * Determine whether the user can create models.
     */
    public function create(User $user): bool
    {
        return $user->hasRole(['Editor']);
    }

    /**
     * Determine whether the user can update the model.
     */
    public function update(User $user, Certificado $certificado): bool
    {
        return $user->hasRole(['Admin']);
    }

    /**
     * Determine whether the user can delete the model.
     */
    public function delete(User $user, Certificado $certificado): bool
    {
        return $user->hasRole(['Admin']);
    }

    public function deleteAny(User $user,): bool
    {
        return $user->hasRole(['Admin']);
    }

    /**
     * Determine whether the user can restore the model.
     */
    public function restore(User $user, Certificado $certificado): bool
    {
        return $user->hasRole(['Admin']);
    }

    /**
     * Determine whether the user can permanently delete the model.
     */
    public function forceDelete(User $user, Certificado $certificado): bool
    {
        return $user->hasRole(['Admin']);
    }
}
