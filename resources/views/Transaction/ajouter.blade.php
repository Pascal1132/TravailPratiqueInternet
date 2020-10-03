@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') Nouvelle opération | <a href="{{ URL::previous() }}">Retour</a>@endsection
@section('content_page')








@endsection

