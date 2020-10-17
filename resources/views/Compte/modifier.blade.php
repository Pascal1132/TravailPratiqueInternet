@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('comptes', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.modify_account') <span class="float-right h5" style="padding-top: 7px;"></span>@endsection
@section('content_page')



        <form action="{{route('compte.modifier')}}" method="post">
            {{csrf_field()}}
            <label>@lang('app.type') : </label>
            @foreach($typesCompte as $typeCompte)
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" class="custom-control-input" id="input-{{$typeCompte->type}}" name="type" value="{{$typeCompte->id}}" @if($typeCompte->id == $compte->type_compte->id) checked="checked"@endif>
                    <label class="custom-control-label" for="input-{{$typeCompte->type}}">{{__('types_compte.'.$typeCompte->type)}}</label>
                </div>
            @endforeach
            <input type="hidden" value="{{$compte->id}}" name="id">
            <div class="form-group">
                <label for="nomCompte">@lang('app.account_name') :</label>
                <input type="text" class="form-control" id="nomCompte" placeholder="@lang('app.account_name')" name="nom" value="{{$compte->nom}}">
            </div>
            <button type="submit" class="btn btn-primary">@lang('translation::translation.save')</button>
        </form>
        </div>




@endsection

