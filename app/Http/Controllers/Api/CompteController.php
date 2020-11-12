<?php

namespace App\Http\Controllers\Api;

use App\Models\Compte;
use App\Models\RefTypeCompte;
use App\Models\Utilisateur;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Http\Resources\Compte as CompteResource;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Gate;

class CompteController extends BaseController
{
    public function __construct()
    {
        //$this->middleware('auth');
    }
    public function index(){
        return $this->sendResponse(CompteResource::collection(Compte::all()), 'Comptes correctement récupérés');
    }
    public function store(Request $request){

        $typeCompte =  RefTypeCompte::where('id',$request->input('type'))->firstOrFail();
        $nomType = $typeCompte->type;
        $nbCompteType = Utilisateur::find($request->input('utilisateur_id'))->comptes->where('type_compte_id', $request->input('type'))->count();
        if( empty($request->input('nom'))) {
            $nomCompte = __('types_compte.'.$nomType) . " " . $nbCompteType;
        }else {
            $nomCompte = $request->input('nom');
        }
        $compte = Compte::create([
            'type_compte_id'=> $request->input('type'),
            'utilisateur_id'=> $request->input('utilisateur_id'),
            'nom'=>$nomCompte,
        ]);

        return $this->sendResponse(new CompteResource($compte), 'Compte correctement créé');
    }
    public function show($id){
        $compte = Compte::find($id);
        if(is_null($compte)){
            return $this->sendError(__('app.bad_id'));
        }
        return $this->sendResponse(new CompteResource($compte), 'Compte correctement récupéré');
    }

    public function update(Request $request, $id){
        $compte = Compte::find($id);
        $compte->update($request->all());
        return response()->json($compte, 200);
    }
    public function destroy(Request $request){
        $compte = Compte::where('id',$request->input('id'))->first();
        if(!Auth::user()->hasCompte($request->input('id')) && Gate::denies('gerer-tous-comptes'))return $this->sendError(__('app.unauthorized'));
        Compte::find($request->input('id'))->delete();
        return $this->sendResponse([],  __('app.delete_success'));
    }
}
