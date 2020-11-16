<?php

namespace App\Http\Resources;

use Illuminate\Http\Resources\Json\JsonResource;

class Compte extends JsonResource
{
    /**
     * Transform the resource into an array.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return array
     */
    public function toArray($request)
    {
        return [
            'id'=>$this->id,
            'nom'=>$this->nom,
            'type_compte_id'=>$this->type_compte_id,
            'utilisateur_id'=>$this->utilisateur_id,
            'utilisateur'=>$this->utilisateur,
            'type_compte'=>$this->type_compte,
            'type_compte_nom'=>__('types_compte.'.$this->type_compte->type),
            'montant'=>$this->getMontant(),
        ];
    }
}
