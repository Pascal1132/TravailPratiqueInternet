<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Image extends Model
{
    public $table="images";
    protected $fillable = [
        'transaction_id',
        'fichier',
    ];
    public function transaction(){
        return $this->belongsTo('App\Models\Transaction','transaction_id');
    }


}
