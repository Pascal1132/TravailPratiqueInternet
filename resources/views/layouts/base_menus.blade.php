@extends('layouts.app')
@section('content')

    <style>

        html, body{
            overflow: auto;
            width: 100%;
        }
        .sidebar-row {
            height:calc(100vh - 2.8em);

        }

        .title-sidebar {
            position: relative;
            padding: 0.8rem 10px;
            margin-right: -10px;
            margin-left: -10px;
            border-bottom: 1px solid rgba(0,0,0,.05);
            text-align: center;

        }
        table{
            font-size: 14px;
        }
        a{
            text-decoration: none!important;
        }
        @media only screen and (max-width: 845px) {
            #navbar-menu-left{
                display: none;
            }

        }

    </style>
    <!-- Style pour la sidebar -->
    <style>
        .menu-item{
            text-decoration: none;
            font-size: 15px;
            color: black;
            background: #dfdfdf;
            cursor: pointer;
            padding-top: 7px;
            padding-bottom: 7px;
            display: block;
            margin-left: 0px;
            border-left: 4px solid gray;

        }
        .menu-item:hover{
            background: lightgray;
            text-decoration: none;
            color: black;
            border-color: black;
            border-left-color: cornflowerblue;

        }
        .menu-item-selected{
            background: darkgray;
            color: black;
            font-weight: bold;
            border-color: black;
            border-left-color: cornflowerblue;
            -webkit-box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);
            -moz-box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);
            box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);
        }
        .menu-item-selected:hover{
            background: darkgray;
            color: black;
            border-color: black;
            border-left-color: cornflowerblue;
            -webkit-box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);
            -moz-box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);
            box-shadow: inset 0px 0px 9px 0px rgba(0,0,0,0.25);

        }
        @media only screen and (max-width: 845px) {
            .menu-item{
                border-radius: 15px;
                margin-bottom: 5px;
                border-left: 0px ;
                -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);
                -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);
                box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);

            }
            .menu-item-selected:hover{
                -webkit-box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);
                -moz-box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);
                box-shadow: 0px 0px 5px 0px rgba(0,0,255,0.75);
            }

        }

    </style>


    <nav class="navbar navbar-fixed-top navbar-dark bg-dark text-light position-relative"  style="border-bottom: 2px solid lightgray">


        <span><button class="ml-0 pb-0 btn text-light d-inline d-md-none" id="btn-collapse-menu"><span class="iconify mb-1" data-icon="radix-icons:hamburger-menu" data-width="25" data-height="25" data-inline="false"></span></button><span class="iconify d-none d-md-inline" style="margin-bottom: 1px" data-icon="mdi:bank" data-inline="true"></span> <a class="text-light d-none d-md-inline" href="{{route("apropos")}}">{{ config('app.name', 'TheBankOfShawinigan') }}</a></span>
        <span>@if(Auth::check() && !Auth::user()->confirme) <a class="btn btn-sm btn-danger font-weight-bold pl-2 pr-2" href="{{route('utilisateur.confirmer')}}"> @lang('email.confirm_needed')</a> @endif</span>
        <div class="dropdown">
            <a class="text-light text-decoration-none" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                @if(Auth::check())
                {{__('types_role.'.Auth::user()->getFirstRole()->type) . " : ". Auth::user()->nom}} <svg class="svg-icon " style="width: 1.5em; fill: cornflowerblue; margin-top: -4px" viewBox="0 0 20 20">
                    <path d="M8.749,9.934c0,0.247-0.202,0.449-0.449,0.449H4.257c-0.247,0-0.449-0.202-0.449-0.449S4.01,
                    9.484,4.257,9.484H8.3C8.547,9.484,8.749,9.687,8.749,9.934 M7.402,12.627H4.257c-0.247,0-0.449,
                    0.202-0.449,0.449s0.202,0.449,0.449,0.449h3.145c0.247,0,0.449-0.202,0.449-0.449S7.648,12.627,
                    7.402,12.627 M8.3,6.339H4.257c-0.247,0-0.449,0.202-0.449,0.449c0,0.247,0.202,0.449,0.449,
                    0.449H8.3c0.247,0,0.449-0.202,0.449-0.449C8.749,6.541,8.547,6.339,8.3,6.339 M18.631,4.543v10.78c0,
                    0.248-0.202,0.45-0.449,0.45H2.011c-0.247,0-0.449-0.202-0.449-0.45V4.543c0-0.247,0.202-0.449,
                    0.449-0.449h16.17C18.429,4.094,18.631,4.296,18.631,4.543 M17.732,4.993H2.46v9.882h15.272V4.993z
                    M16.371,13.078c0,0.247-0.202,0.449-0.449,0.449H9.646c-0.247,0-0.449-0.202-0.449-0.449c0-1.479,
                    0.883-2.747,2.162-3.299c-0.434-0.418-0.714-1.008-0.714-1.642c0-1.197,0.997-2.246,2.133-2.246s2.134,
                    1.049,2.134,2.246c0,0.634-0.28,1.224-0.714,1.642C15.475,10.331,16.371,11.6,16.371,13.078M11.542,
                    8.137c0,0.622,0.539,1.348,1.235,1.348s1.235-0.726,1.235-1.348c0-0.622-0.539-1.348-1.235-1.348S11.542,
                    7.515,11.542,8.137 M15.435,12.629c-0.214-1.273-1.323-2.246-2.657-2.246s-2.431,0.973-2.644
                    ,2.246H15.435z"></path></svg>
                @else
                    Non connecté
                @endif
            </a>
            <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                <a class="dropdown-item" href="{{route('changer_langue')}}">@lang('app.nextLanguage')
                    <span class="iconify" data-icon="ion:language" data-inline="false"></span></a>
            @if(Auth::check())

                <a class="dropdown-item" href="{{route('modifier')}}">@lang('app.edit_user') <span class="iconify" data-icon="ant-design:edit-outlined" data-inline="false"></span></a>
                <a class="dropdown-item" href="@yield('lien_deconnexion', route('deconnexion'))">@lang('app.logout') <span class="iconify" data-icon="icomoon-free:exit" data-inline="false"></span></a>


            @else

                    <a class="dropdown-item" href="@yield('lien_connexion',  route('vueConnexion'))">@lang('app.login') <span class="iconify" data-icon="icomoon-free:enter" data-inline="false"></span></a>
                    <a class="dropdown-item" href="@yield('lien_inscription', route('vueInscription'))">@lang('app.signin') <span class="iconify" data-icon="ic:outline-create" data-inline="false"></span></a>


            @endif

            </div>
        </div>


    </nav>
    <div class="container-fluid">
        <div class="row flex-xl-nowrap sidebar-row">
            <div class="col-12 col-md-2 col-xl-2 bd-sidebar text-center p-md-0 d-md-block" id="navbar-menu-left" style="border-right: 1px solid lightgray; overflow:hidden;overflow-y: auto">
                <span class="d-flex title-sidebar justify-content-center" style="font-weight: bold">@yield('sidebar_titre', 'Menu')</span>
                <div >
                    @yield('sidebar_contenu')
                </div>




            </div>
            <div class="col-12 col-md-10 col-xl-10 py-md-3 pl-md-5 pr-md-5 bd-content" style="overflow-y: auto">
                @foreach ($errors->all() as $error)


                    <div style="margin-left: -16px; margin-right: -24px;">
                        <div class="main__content notice-flash">
                            <div class="notification red">
                                <b>Erreur : </b>{{ $error }}</div>
                        </div>
                    </div>
                @endforeach
                    @if (\Session::has('succes'))

                        <div style="margin-left: -16px; margin-right: -24px;">
                            <div class="main__content notice-flash">
                                <div class="notification green">
                                    <b>Note: </b> {!! \Session::get('succes') !!}</div>
                            </div>
                        </div>
                    @endif
                <h3 style="margin-top: 15px;">@yield('titre_page', 'Titre de la page')</h3>
                <hr>
                @yield('content_page', 'content_page')

            </div>
        </div>

    </div>
    <script>
        $(document).ready(function(){
           $("#btn-collapse-menu").on('click', function(){
                $("#navbar-menu-left").fadeToggle(400);
           });
        });
    </script>



@endsection