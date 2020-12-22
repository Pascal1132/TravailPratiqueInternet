<?php


namespace App\Http\Controllers\Api;


use App\Http\Resources\RefTypeCompteRessource;
use App\Models\RefTypeCompte;

class RefTypeCompteController extends BaseController
{
    function index(){
        return $this->sendResponse(RefTypeCompteRessource::collection(RefTypeCompte::all()), 'Types comptes correctement récupérés');

    }
    function show(){

    }

}