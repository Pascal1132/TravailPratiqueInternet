<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\Controller;
use App\Models\Utilisateur;
use Hamcrest\Util;
use Illuminate\Foundation\Auth\AuthenticatesUsers;
use Illuminate\Http\Request;

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;


use Illuminate\Support\Facades\Validator;
use Psy\Util\Json;
use Tymon\JWTAuth\Facades\JWTAuth;


class AuthController extends Controller
{

    /**
     * Create a new AuthController instance.
     *
     * @return void
     */
    public function __construct() {
        $this->middleware('auth:api', ['except' => ['login', 'register']]);
    }

    /**
     * Get a JWT via given credentials.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function login(Request $request){
       /*$mot_de_passe= $request->input('mot_de_passe');
       $courriel = $request->input('courriel');

       $utilisateur = Utilisateur::where('courriel', $courriel)->firstOrFail();

       $utilisateur->courriel = $courriel;
        $validator = Validator::make($request->all(), [
            'courriel' => 'required|email',
            'mot_de_passe' => 'required|string',
        ]);

      if($validator->fails()) {
            return response()->json($validator->errors(), 422);
        }




        if(Hash::check($mot_de_passe, $utilisateur->mot_de_passe)){
            //Si le mot de passe correspond à celui dans la bd
            return $this->createNewToken($utilisateur);
        }



        return response()->json(['error' => 'Unauthorized', 'courriel '=>$courriel, 'mot_de_passe'=>$mot_de_passe], 401);
*/
        $credentials = $request->only(['courriel', 'password']);

        if (! $token = auth('api')->attempt($credentials)) {
            return response()->json(['error' => 'Unauthorized'], 401);
        }

        return $this->createNewToken($token);
    }

    /**
     * Register a User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function register(Request $request) {

        return response()->json(['message' => "L'enregistrement ne peut être effectué par l'api actuellement."]);
    }


    /**
     * Log the user out (Invalidate the token).
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function logout() {
        auth()->logout();

        return response()->json(['message' => 'User successfully signed out']);
    }

    /**
     * Refresh a token.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function refresh() {
        return $this->createNewToken(auth()->refresh());
    }

    /**
     * Get the authenticated User.
     *
     * @return \Illuminate\Http\JsonResponse
     */
    public function userProfile() {
        return response()->json(auth()->user());
    }

    /**
     * Get the token array structure.
     *
     * @param  string $token
     *
     * @return \Illuminate\Http\JsonResponse
     */
    protected function createNewToken($token){
        $myTTL = 30; //minutes
        return response()->json([
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth('api')->factory()->getTTL() * 60,
            'user' => auth()->user()
        ]);
    }

}
