@extends('layouts.base_menus')
@section('sidebar_contenu')

<a class="menu-item w-100" href="{{route('home')}}">Accueil</a>
<a class="menu-item w-100" href="{{route('comptes')}}" >Vos comptes</a>

<a class="menu-item menu-item-selected w-100" href="{{route('listeUtilisateurs')}}" >Utilisateurs</a>

@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page')Liste des utilisateurs <span class="float-right h5" style="padding-top: 7px;">
       </span>@endsection
@section('content_page')

<table class="table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">Nom</th>
        <th scope="col">Courriel</th>

        <th scope="col">Rôles</th>


        @if(Gate::check('modifier-utilisateurs') || Gate::check('effacer-utilisateurs'))
            <th scope="col"></th>
        @endif

    </tr>
    </thead>
    <tbody>
    @forelse($utilisateurs as $utilisateur)
        <tr>
            <td>{{$utilisateur->nom}}</td>
            <td>{{$utilisateur->courriel}}</td>
            <td>
                @foreach($utilisateur->roles as $roles)
                    {{$roles->type}}
                    @if(!$loop->last)
                        ,
                    @endif
                @endforeach
            </td>
            @can('modifier-utilisateurs') <td class="text-right"><a class="btn-sm btn-primary">Modifier</a>@endcan @can('effacer-utilisateurs')<a class="btn-sm btn-secondary">Effacer</a> @endcan </td>

        </tr>
        @empty
            @endforelse
    </tbody>
</table>





@endsection

