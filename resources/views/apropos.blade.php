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
    <p><h5>Voici les différentes fonctionnalités sommaires de l'application:</h5><br>
    <dl class="row">
        <dt class="col-sm-3">Accueil</dt>
        <dd class="col-sm-9">Affiche le sommaire bancaires de l'utilisateur.</dd>
        <dt class="col-sm-3 text-truncate">Vos comptes</dt>
        <dd class="col-sm-9">Affiche les différents comptes bancaires, permet la création d'un compte, sa modification et sa supression.</dd>
        <dt class="col-sm-3">Transactions</dt>
        <dd class="col-sm-9">Permet d'afficher les dernières transactions du compte ainsi que la modification de ses transaction et la supression. </dd>
        <dt class="col-sm-3 text-truncate">Utilisateurs</dt>
        <dd class="col-sm-9">Affiche les différents utilisateurs, permet la création d'un utilisateur, sa modification et sa supression.</dd>
    </dl>
    </p>
    <p><h5>Voici les différents rôles de l'application:</h5><br>
    <dl class="row">
        <dt class="col-sm-3">Client</dt>
        <dd class="col-sm-9">
            <ul>
                <li>Peut accèder à la page d'accueil</li>
                <li>Peut voir ses comptes, en créer un, les modifier et les supprimer</li>
                <li>Peut voir et ajouter une transaction sur son compte uniquement (seulement virement et dépôt par chèque)</li>
            </ul>

        </dd>
        <dt class="col-sm-3 text-truncate">Caissier</dt>
        <dd class="col-sm-9">Possède les mêmes privilèges que le client, mais aussi il
            <ul>
                <li>Peut accèder à la liste des utilisateurs</li>
                <li>Peut ajouter une transaction sur n'importe quel compte, sa modification et sa supression</li>
            </ul>
        </dd>
        <dt class="col-sm-3 mb-2">Admin</dt>
        <dd class="col-sm-9">Possède tous les droits </dd>
        <dt class="col-sm-3">Tout utilisateur avec courriel non confirmé</dt>
        <dd class="col-sm-9">Ne peut créer un compte personnel.</dd>

    </dl>
    </p>


    <p>
        <h5>Voici les étapes pour la mise en place du projet avec le dépot github:</h5>
    <br>
        <ol>
        <li>Installations des paquets nécéssaires.</li>
        <ul>
        <li>Récupérer le dossier du projet et le déposer dans le répertoire du serveur web.</li>
        <li>Dézipper le répertoire.</li>
        <li>Exécuter la commande <code>composer install</code> afin d'installer les dépendances de composer.</li>
        <li>Dupliquer .env.example avec comme nom .env afin de créer le fichier d'environnement.</li>
        </ul>
        <li>Génerer la clé d'encryption.</li>
        <ul><li>Exécuter la commande <code>php artisan key:generate</code>.</li></ul>
        <li>Modifier les variables d'environnement dans le fichier .env.</li>
        <ul>
            <li>Remplir le champs DB_HOST dans le fichier par l'adresse de la base de données (naturellement en local : 127.0.0.1). </li>
            <li>Remplir le champs DB_PORT dans le fichier par le port utilisé pour la base de données. </li>
            <li>Remplir le champs DB_DATABASE dans le fichier par le nom de la base de données que vous aller importer. </li>
            <li>Remplir le champs DB_USERNAME et le champs DB_PASSWORD dans le fichier par l'identifiant et le mot de passe pour la base de données (respectivement) .</li>
        </ul>
        <li>Importer la base de données.</li>
        <li>Vérifier si la page de connexion s'affiche correctement.</li>



        </ol>
    </p>



@endsection
