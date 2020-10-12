@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item w-100" href="{{route('vueConnexion')}}" >@lang('app.login')</a>
    <a class="menu-item w-100" href="{{route('vueInscription')}}" >@lang('app.signin')</a>
@endsection

@section('titre_page', __('app.about'))
@section('content_page')

    <h1>Pascal Parent</h1>
    <h3>420-5B7 MO Applications internet</h3>
    <h3>Automne 2020, College Montmorency</h3>
    <h5>À noter que le site internet est fait avec laravel 5.8.</h5>
    <br>
    <p>
        Voici les étapes pour la mise en place du projet avec le dépot github:
        <ol>
        <li></li>

        </ol>
    </p>



@endsection
