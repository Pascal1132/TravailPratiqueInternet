@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item menu-item-selected w-100" >@lang('app.home')</a>
    <a class="menu-item w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') @lang('app.welcome') {{ Auth::user()->nom }}



@endsection
@section('content_page')
    @foreach ($errors->all() as $error)


        <div style="margin-left: -16px; margin-right: -24px;">
            <div class="main__content notice-flash">
                <div class="notification green">
                    <b>Note:</b>{{ $error }}</div>
            </div>
        </div>
    @endforeach
    <h6  style="text-color:gray; font-weight: normal">@lang('app.home_welcome_message')</h6>
    <br>



    <div class="row">
        <div class="col-sm col-md text-center">

            <ul class="list-group p-0 ">
                <li class="list-group-item bg-dark text-light titre-liste"><h4>@lang('app.overview_accounts')</h4></li>

                <li class="list-group-item bg-dark titre-liste text-left">

                    @forelse(Auth::user()->comptes as $compte)

                        <div class="card d-inline-block m-1 p-2" style="width: 15rem;line-height: 25px">
                            <div class=""> <a href="">{{$compte->nom}}</a></div>
                            <div class="float-left">@lang('app.type') : {{__('db.'.$compte->type_compte->type)}}</div>

                            <div class="float-right">@lang('app.amount') : {{$compte->getMontant()}}$</div>
                        </div>

                    @empty
                                <span style="font-size: smaller; color:gray"> @lang('app.no_account')</span
                    @endforelse
                </li>
            </ul>
        </div>


@endsection

