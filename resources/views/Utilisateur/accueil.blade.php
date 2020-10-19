@extends('layouts.base_menus')
@section('sidebar_contenu')
    @component('layouts.menu_principal')
        @push('accueil', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.welcome') {{ Auth::user()->nom }}



@endsection
@section('content_page')

    <h6  style="text-color:gray; font-weight: normal">@lang('app.home_welcome_message')</h6>
    <br>



    <div class="row">
        <div class="col-sm col-md text-center">

            <ul class="list-group p-0 ">
                <li class="list-group-item bg-dark text-light titre-liste"><h4>@lang('app.overview_accounts')</h4></li>

                <li class="list-group-item bg-dark titre-liste text-left">

                    @forelse(Auth::user()->comptes as $compte)

                        <div class="card d-inline-block m-1 p-2 comptes-card" style="width: 16rem;line-height: 25px" onclick="window.location='{{route('afficherCompte',['id'=>$compte->id])}}'">

                            <div class=""> <a href="{{route('afficherCompte',['id'=>$compte->id])}}">{{$compte->nom}}</a></div>
                            <div class="float-left">@lang('app.type') : {{__('types_compte.'.$compte->type_compte->type)}}</div>

                            <div class="float-right">@money($compte->getMontant()) $</div>

                        </div>


                    @empty
                                <span style="font-size: smaller; color:gray"> @lang('app.no_account')</span>
                    @endforelse
                </li>
            </ul>
        </div>


@endsection

