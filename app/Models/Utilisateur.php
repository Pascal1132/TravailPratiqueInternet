<?php

namespace App\Models;


use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

use Tymon\JWTAuth\Contracts\JWTSubject;


class Utilisateur extends Authenticatable implements JWTSubject
{
    use HasApiTokens, Notifiable;

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
        'confirmation_token'
    ];

    /**
     * Les attributs devant être masqués des tableaux(arrays)
     *
     * @var array
     */
    protected $hidden=[
        'mot_de_passe', 'remember_token'
    ];

    public function comptes(){
        return $this->hasMany('App\Models\Compte', 'utilisateur_id');
    }
    public function compte_trier_type(){
        $this->compte()->groupBy('type');
    }
    public function hasCompte($id){
        return $this->comptes()->where('id', $id)->exists();
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
    public function getFirstRole(){
        return $this->roles()->first();
    }
    public function hasAnyRoles($roles){
        return $this->roles()->whereIn('type', $roles)->first();
    }
    public function hasRole($roles){
        return $this->roles()->where('type', $roles)->first();
    }
    /**
     * Get the identifier that will be stored in the subject claim of the JWT.
     *
     * @return mixed
     */
    public function getJWTIdentifier() {
        return $this->getKey();
    }

    /**
     * Return a key value array, containing any custom claims to be added to the JWT.
     *
     * @return array
     */
    public function getJWTCustomClaims() {
        return [];
    }
}
