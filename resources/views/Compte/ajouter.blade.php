@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('comptes', 'menu-item-selected')
    @endcomponent
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
                    <label class="custom-control-label" for="input-{{$typeCompte->type}}">{{__('types_compte.'.$typeCompte->type)}}</label>
                </div>
        @endforeach
        <div class="form-group">
            <label for="nomCompte">@lang('app.account_name') :</label>
            <input type="text" class="form-control" autocomplete="off" class="ui-autocomplete-input" id="nomCompte" placeholder="@lang('app.account_name')" name="nom">
        </div>
        <button type="submit" class="btn btn-primary">@lang('app.submit')</button>
    </form>
    </div>
    @else
        <h6>Pour créer un compte, vous devez préalablement confirmer votre courriel</h6>
        <a class="text-danger" href="{{route('utilisateur.confirmer')}}">Confirmer l'adresse courriel</a>
    @endif




@endsection

