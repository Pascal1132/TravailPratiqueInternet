@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item menu-item-selected w-100" >Accueil</a>
@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page')Bienvenue {{ Auth::user()->nom }} @endsection
@section('content_page')
    <h6 style="text-color:gray; font-weight: normal">Voici ce que nous avons réservé pour vous aujourd'hui... </h6>

    <div>

        {{Auth::user()->compte}}




    </div>



@endsection

