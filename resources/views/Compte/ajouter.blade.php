@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') @lang('app.new_account') <span class="float-right h5" style="padding-top: 7px;"></span>@endsection
@section('content_page')


    @if(Auth::user()->confirme)

    <form action="{{route('ajouterCompte')}}" method="post">
        {{csrf_field()}}
        <label>@lang('app.type') : </label>
        @foreach($typesCompte as $typeCompte)
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" class="custom-control-input" id="input-{{$typeCompte->type}}" name="type" value="{{$typeCompte->id}}">
                    <label class="custom-control-label" for="input-{{$typeCompte->type}}">{{__('db.'.$typeCompte->type)}}</label>
                </div>
        @endforeach
        <div class="form-group">
            <label for="nomCompte">@lang('app.account_name') :</label>
            <input type="text" class="form-control" id="nomCompte" placeholder="@lang('app.account_name')" name="nom">
        </div>
        <button type="submit" class="btn btn-primary">@lang('app.submit')</button>
    </form>
    </div>
    @else
        <h6>Pour créer un compte, vous devez préalablement confirmer votre courriel</h6>
        <a class="text-danger" href="{{route('utilisateur.confirmer')}}">Confirmer l'adresse courriel</a>
    @endif




@endsection

