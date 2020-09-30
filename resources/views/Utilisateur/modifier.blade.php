@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>

    @can('afficher-utilisateurs')
    <a class="menu-item menu-item-selected w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page'){{$utilisateur->nom}}
 <span class="float-right h5" style="padding-top: 7px;">
       </span>@endsection
@section('content_page')
    <form action="{{route('inscription')}}" method="post">
        {{csrf_field()}}
        <div class="form-group">
            <label for="no_carte">@lang('app.card_no') : </label>
            <input type="text" id="no_carte" name="no_carte" value="{{$utilisateur->no_carte}}" placeholder="@lang('app.card_no')"/>
        </div>
        <div class="form-group">
            <label for="nom">@lang('app.name') : </label>
            <input type="text" id="nom" name="nom" value="{{$utilisateur->nom}}" placeholder="@lang('app.name')"/>
        </div>
        <input id="username" style="opacity: 0;position: absolute;" type="text" name="fakeusernameremembered">
        <input id="password" style="opacity: 0;position: absolute;" class="cp-password_stub" type="password" name="fakepasswordremembered">
        <div class="form-group">
            <label for="courriel">@lang('app.email') : </label>
            <input type="email" id="courriel" name="courriel" value="{{$utilisateur->courriel}}" placeholder="@lang('app.email')"/>
        </div>
        <div class="form-group">
            <label for="pwd">@lang('app.password') : </label>
            <input type="password" id="pwd" name="mot_de_passe" autocomplete="disabled" placeholder="@lang('app.leave_empty')"/>
        </div>

        @can('modifier-utilisateurs')
            @forelse($utilisateur->roles as $role)
                {{$role->type}}
            @empty

            @endforelse
        @endcan
                <div class="text-danger mb-1">
                    @foreach ($errors->all() as $error)
                        {{ $error }} <br>
                    @endforeach
                </div>

        <button type="submit" class="btn btn-primary">@lang('app.update')</button>
    </form>






@endsection

