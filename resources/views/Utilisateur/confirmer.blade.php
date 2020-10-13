@extends('layouts.base_menus')
@section('sidebar_contenu')
    @component('layouts.menu_principal')
    @endcomponent

@section('titre_page') @lang('app.email_confirmation')
@endsection
@section('content_page')
    @if(Auth::check())
    @if(!Auth::user()->confirme)

            <p>Vous devez confirmer votre adresse courriel pour pouvoir créer un nouveau compte.</p>
            <a class="btn btn-secondary" href="{{route('envoiCourrielConfirmation')}}">Réenvoyer le courriel à {{Auth::user()->courriel}} ?</a>


    @endif
    @endif


@endsection

