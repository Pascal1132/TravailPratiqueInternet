<?php


namespace App\Http\Controllers;



use App\Mail\CommentaireCourriel;
use App\Mail\ConfirmationCourriel;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Mail;

class CommentaireController extends Controller
{
    public function index(Request $request){
        $courriel = new CommentaireCourriel($request->input('commentaire'), $request->ip());
        Mail::to('pas.parent@outlook.com')->send($courriel);
        return back()->with('succes','Le courriel a bien été envoyé!');
    }
}