@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item menu-item-selected w-100" >Accueil</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >Vos comptes</a>
@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page')Bienvenue {{ Auth::user()->nom }} @endsection
@section('content_page')
    <h6 style="text-color:gray; font-weight: normal">Voici ce que nous avons réservé pour vous aujourd'hui... </h6>
    <br>


    <div class="row">
        <div class="col-sm col-md text-center">

            <ul class="list-group p-0 ">
                <li class="list-group-item bg-dark text-light titre-liste"><h4>Apercu de vos comptes</h4></li>

                <li class="list-group-item bg-dark titre-liste">

                    @forelse(Auth::user()->compte as $compte)

                        <div class="card" style="width: 18rem;">
                            <div class=""> <a href="">{{$compte->nom}}</a></div>
                            <div class="">Type de compte : {{$compte->type_compte->type}}</div>

                            <div class="">Montant : {{$compte->getMontant()}}$</div>
                        </div>

                    @empty
                                <span style="font-size: smaller; color:gray"> Vous n'avez aucun compte ...</span
                    @endforelse
                </li>
            </ul>
        </div>


@endsection

