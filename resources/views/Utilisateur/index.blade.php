@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item menu-item-selected w-100" >@lang('app.home')</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection
@section('navbar_droite', Auth::user()->nom)
@section('titre_page') @lang('app.welcome') {{ Auth::user()->nom }} @endsection
@section('content_page')
    <h6 style="text-color:gray; font-weight: normal">@lang('app.home_welcome_message')</h6>
    <br>


    <div class="row">
        <div class="col-sm col-md text-center">

            <ul class="list-group p-0 ">
                <li class="list-group-item bg-dark text-light titre-liste"><h4>@lang('app.overview_accounts')</h4></li>

                <li class="list-group-item bg-dark titre-liste">

                    @forelse(Auth::user()->compte as $compte)

                        <div class="card" style="width: 18rem;">
                            <div class=""> <a href="">{{$compte->nom}}</a></div>
                            <div class="">@lang('app.type') : {{$compte->type_compte->type}}</div>

                            <div class="">@lang('app.amount') : {{$compte->getMontant()}}$</div>
                        </div>

                    @empty
                                <span style="font-size: smaller; color:gray"> @lang('app.no_account')</span
                    @endforelse
                </li>
            </ul>
        </div>


@endsection
