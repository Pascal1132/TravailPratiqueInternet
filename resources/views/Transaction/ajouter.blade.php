@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') @lang('app.new_operation')| <a href="{{ URL::previous() }}">Retour</a>@endsection
@section('content_page')
    <script>

    </script>

    <form>
        <label for="type_operation">Type d'opération : </label>
        <br>
        <select class="form-control" id="type_operation">
            <option>Virement entre comptes</option>
            <option>Retrait</option>
            <option>Dépot</option>
        </select>
        <br>
        <label>Compte:</label>
        <input class="form-control" type="text" disabled value="{{$compte->nom}}"/>
    </form>






@endsection

