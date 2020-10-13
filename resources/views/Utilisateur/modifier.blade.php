@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('utilisateurs', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page'){{$utilisateur->nom}}
 <span class="float-right h5" style="padding-top: 7px;">
       </span>


@endsection
@section('content_page')

    <form action="{{route('valModifierUtilisateur')}}" method="post">
        {{csrf_field()}}
        <div class="form-group">
            <label class="align-right" for="no_carte">@lang('app.card_no') : </label>
            <input type="text" id="no_carte" name="no_carte" value="{{$utilisateur->no_carte}}" placeholder="@lang('app.card_no')"/>
        </div>
        <div class="form-group">
            <label class="align-right" for="nom">@lang('app.name') : </label>
            <input type="text" id="nom" name="nom" value="{{$utilisateur->nom}}" placeholder="@lang('app.name')"/>
        </div>
        <input id="username" style="opacity: 0;position: absolute;" type="text" name="fakeusernameremembered">
        <input id="password" style="opacity: 0;position: absolute;" class="cp-password_stub" type="password" name="fakepasswordremembered">
        <div class="form-group">
            <label class="align-right" for="courriel">@lang('app.email') : </label>
            <input type="email" id="courriel" name="courriel" value="{{$utilisateur->courriel}}" placeholder="@lang('app.email')"/>
        </div>
        <div class="form-group">
            <label class="align-right" for="pwd">@lang('app.password') : </label>
            <input type="password" id="pwd" name="mot_de_passe" autocomplete="disabled" placeholder="@lang('app.leave_empty')"/>
        </div>


        @can('modifier-utilisateurs')
            <label class="align-right">@lang('app.role') <span class="text-danger">*</span> : </label>
                @foreach($listeRoles as $role)
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" class="custom-control-input" @if($utilisateur->hasRole($role->type)) checked @endif id="input-{{$role->type}}" name="role" value="{{$role->id}}">
                    <label class="custom-control-label" for="input-{{$role->type}}">{{__('db.'.$role->type)}}</label>
                </div>
                @endforeach
                @if($utilisateur->nom === Auth::user()->nom) <br>
            <span class="mt-0 text-danger" style="font-size: 13px">
                * Si vous modifier votre rôle, vous ne pourrez plus le modifier par la suite.
            </span><br>@endif
        @endcan

        <br>
        <button type="submit" class="btn btn-primary">@lang('app.update')</button>
    </form>






@endsection

