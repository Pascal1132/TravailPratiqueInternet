@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('home')}}">Accueil</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >Vos comptes</a>

    <a class="menu-item menu-item-selected w-100" href="{{route('listeUtilisateurs')}}" >Utilisateurs</a>

@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page')Utilisateur <span class="float-right h5" style="padding-top: 7px;">
       </span>@endsection
@section('content_page')







@endsection
