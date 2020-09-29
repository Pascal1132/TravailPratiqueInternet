<?php

namespace App\Models;


use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;

class Utilisateur extends Authenticatable
{
    use Notifiable;
    public $table="utilisateurs";
    /**
     * Les attributs pouvants être assignés en masse
     *
     * @var array
     *
     */
    protected $fillable=[
        'no_carte',
        'nom',
        'mot_de_passe',
        'courriel',
        'role_id'
    ];

    /**
     * Les attributs devant être masqués des tableaux(arrays)
     *
     * @var array
     */
    protected $hidden=[
        'mot_de_passe', 'remember_token'
    ];

    public function compte(){
        return $this->hasMany('App\Models\Compte', 'utilisateur_id');
    }
    public function compte_trier_type(){
        $this->compte()->groupBy('type');
    }
    public function role(){
        return $this->belongsTo('App\Models\RefRoleUtilisateur', 'role_id');
    }
    public function getAuthPassword()
    {
        return $this->mot_de_passe;
    }
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }
    public function roles(){
        return $this->belongsToMany('App\Models\RefRoleUtilisateur', 'roles_assignations');
    }
    public function hasAnyRoles($roles){
        return $this->roles()->whereIn('type', $roles)->first();
    }
    public function hasRole($roles){
        return $this->roles()->where('type', $roles)->first();
    }
}
