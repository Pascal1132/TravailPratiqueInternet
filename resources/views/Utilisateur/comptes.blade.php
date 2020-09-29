@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('home')}}">Accueil</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >Vos comptes</a>
@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page')Liste de vos comptes <span class="float-right h5" style="padding-top: 7px;"><a href="" class=" mb-1" >
        Nouveau compte <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')

    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Nom</th>
            <th scope="col">Type</th>

            <th scope="col">Montant</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        @forelse(Auth::user()->compte as $compte)
            <tr class="ligne-milieu" id="compte-{{$compte->id}}" onclick="window.location='{{route('afficherCompte', ['id'=>$compte->id])}}'">
                <td scope="row">{{$compte->nom}}</td>
                <td> {{$compte->type_compte->type}}</td>
                <td>{{$compte->getMontant()}} $</td>
                <td ><span class="iconify" data-icon="fa-chevron-right" data-inline="false"></span></td>
            </tr>
        @empty
            <tr>
                <td colspan="6" class="text-center pt-3" style="font-family: Bahnschrift">Vous n'avez aucun compte d'ouvert...<a style="font-family: Bahnschrift" href="">Créez-en un !</a></td>
            </tr>
        @endforelse

        </tbody>
    </table>





@endsection

