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
        'courriel'
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
        return $this->hasMany('App\Models\Compte', 'user_id');
    }
    public function getAuthPassword()
    {
        return $this->mot_de_passe;
    }
    public function setPasswordAttribute($value)
    {
        $this->attributes['password'] = bcrypt($value);
    }
}
