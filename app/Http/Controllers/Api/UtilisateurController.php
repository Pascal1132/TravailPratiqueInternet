<?php

namespace App\Http\Controllers\Api;

use App\Models\Compte;
use App\Models\RefTypeCompte;
use App\Models\Utilisateur;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Utilisateur as UtilisateurResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class UtilisateurController extends BaseController
{
    public function __construct()
    {
        $this->middleware('auth:api')->only (['store', 'update', 'destroy']);
    }
    public function index(){
        return $this->sendResponse(UtilisateurResource::collection(Utilisateur::all()), 'Utilisateurs correctement récupérés');
    }
    public function store(Request $request){

        return null;
    }
    public function show($id){
        $utilisateur = Utilisateur::find($id);
        if(is_null($utilisateur)){
            return $this->sendError(__('app.bad_id'));
        }
        return $this->sendResponse(new UtilisateurResource($utilisateur), 'Compte correctement récupéré');
    }

    public function update(Request $request, Compte $compte){
        $user =auth('api')->user();
        $user->mot_de_passe = bcrypt($request->input ('mot_de_passe'));
        $user->save();
        return response()->json($user, 200);

    }
    public function destroy(Request $request){

        return null;
    }


}
