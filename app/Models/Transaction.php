<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Transaction extends Model
{
    public $table="transactions";
    protected $fillable = [
        'compte_id',
        'type_transaction_id',
        'description',
        'montant',
    ];
    public function type_transaction(){
        return $this->belongsTo('App\Models\RefTypeTransaction','type_transaction_id');
    }
    public function compte(){
        return $this->belongsTo('App\Models\Compte', 'compte_id');
    }
    public function image(){
        return $this->hasOne(Image::class, 'transaction_id', 'id');
    }

}
