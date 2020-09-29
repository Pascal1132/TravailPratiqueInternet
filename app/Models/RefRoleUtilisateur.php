<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class RefRoleUtilisateur extends Model
{
    public $table="ref_roles_utilisateur";
    public function users(){
        return $this->belongsToMany('App\Models\Utilisateur', 'roles_assignations');
    }
}
