<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Compte extends Model
{
    public $table="comptes";
    protected $fillable=[
        'type_compte_id',
        'nom',
        'utilisateur_id',
    ];
    public function type_compte(){
        return $this->belongsTo('App\Models\RefTypeCompte','type_compte_id');
    }
    public function transactions(){
        return $this->hasMany('App\Models\Transaction','compte_id');
    }
    public function getMontant(){
        $montant = 0;
        $transactions = $this->transactions()->get();



        foreach ($transactions as $transaction){
            if($transaction->type_transaction->estMontantNegatif){
                $montant = ($montant - $transaction->montant) ;

            }else{
                $montant = ($montant + $transaction->montant);

            }
        }
        return $montant;
    }
}
