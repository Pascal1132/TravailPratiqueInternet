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
        <li>Installations des paquets nécéssaires</li>
        <ul>
        <li>Récupérer le dossier du projet et le déposer dans le répertoire du serveur web</li>
        <li>Dézipper le répertoire</li>
        <li>Exécuter la commande <code>composer install</code> afin d'installer les dépendances de composer</li>
        <li>Exécuter la commande <code>npm install</code> afin d'installer les dépendances de npm</li>
        <li>Exécuter la commande <code>cp .env.example .env</code> afin de créer le fichier d'environnement</li>
            <li>À noter que vous pouvez executer la commande <code>composer update</code> si il y a une erreur concernant la </li>
        </ul>
        <li>Génerer la clé d'encryption</li>
        <ul><li>Exécuter la commande <code>php artisan key:generate</code></li></ul>
        <li>Modifier les variables d'environnement dans le fichier .env</li>
        <ul>
            <li>Remplir le champs DB_HOST dans le fichier par l'adresse de la base de données (naturellement en local : 127.0.0.1) </li>
            <li>Remplir le champs DB_PORT dans le fichier par le port utilisé pour la base de données </li>
            <li>Remplir le champs DB_DATABASE dans le fichier par le nom de la base de données que vous aller importer </li>
            <li>Remplir le champs DB_USERNAME et le champs DB_PASSWORD dans le fichier par l'identifiant et le mot de passe pour la base de données (respectivement) </li>
        </ul>

        </ol>
    </p>



@endsection
