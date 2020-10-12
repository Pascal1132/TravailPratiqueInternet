@extends('layouts.base_menus')
@section('sidebar_contenu')
    @if(Auth::check())
    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @endif
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

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

