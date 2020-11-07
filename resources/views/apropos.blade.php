@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item w-100" href="{{route('vueConnexion')}}" >@lang('app.login')</a>
    <a class="menu-item w-100" href="{{route('vueInscription')}}" >@lang('app.signin')</a>
    <a class="menu-item w-100 menu-item-selected" href="{{route('apropos')}}" >@lang('app.about')</a>
@endsection

@section('titre_page', __('app.about'))
@section('content_page')
    <style>
        [data-toggle="collapse"] .fa:before {
            content: "\f139";
        }

        [data-toggle="collapse"].collapsed .fa:before {
            content: "\f13a";
        }
    </style>

    <h1>Pascal Parent</h1>
    <h3>420-5B7 MO Applications internet</h3>
    <h3>Automne 2020, College Montmorency</h3>
    <h5>À noter que le site internet est fait avec laravel 8 <span class="text-danger">Mise à jour récente</span></h5>
    <br>







    <div class="accordion" id="accordionExample">
        <div class="card">
            <div class="card-header" id="headingOne">
                <h5 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
                        Différentes fonctionnalités sommaires de l'application
                    </button>
                </h5>
            </div>

            <div id="collapseOne" class="collapse" aria-labelledby="headingOne" data-parent="#accordionExample">
                <div class="card-body">
                    <p><br>
                    <dl class="row">
                        <dt class="col-sm-3">Accueil</dt>
                        <dd class="col-sm-9">Affiche le sommaire bancaire de l'utilisateur.</dd>
                        <dt class="col-sm-3 text-truncate">Vos comptes</dt>
                        <dd class="col-sm-9">Affiche les différents comptes bancaires, permets la création d'un compte, sa modification et sa suppression.</dd>
                        <dt class="col-sm-3">Transactions</dt>
                        <dd class="col-sm-9">Permets d'afficher les dernières transactions du compte ainsi que la modification de ses transactions et la suppression. </dd>
                        <dt class="col-sm-3 text-truncate">Utilisateurs</dt>
                        <dd class="col-sm-9">Affiche les différents utilisateurs, permets la création d'un utilisateur, sa modification et sa suppression.</dd>
                    </dl>
                    </p>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingTwo">
                <h5 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                        Différents rôles de l'application
                    </button>
                </h5>
            </div>
            <div id="collapseTwo" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionExample">
                <div class="card-body">
                    <p><br>
                    <dl class="row">
                        <dt class="col-sm-3">Client</dt>
                        <dd class="col-sm-9">
                            <ul>
                                <li>Peut accéder à la page d'accueil</li>
                                <li>Peut voir ses comptes, en créer un, les modifier et les supprimer</li>
                                <li>Peut voir et ajouter une transaction sur son compte uniquement (seulement virement et dépôt par chèque)</li>
                            </ul>

                        </dd>
                        <dt class="col-sm-3 text-truncate">Caissier</dt>
                        <dd class="col-sm-9">Possède les mêmes privilèges que le client, mais aussi il
                            <ul>
                                <li>Peut accéder à la liste des utilisateurs</li>
                                <li>Peut ajouter une transaction sur n'importe quel compte, sa modification et sa suppression</li>
                            </ul>
                        </dd>
                        <dt class="col-sm-3 mb-2">Admin</dt>
                        <dd class="col-sm-9">Possède tous les droits </dd>
                        <dt class="col-sm-3">Tout utilisateur avec courriel non confirmé</dt>
                        <dd class="col-sm-9">Ne peut créer un compte personnel.</dd>

                    </dl>
                    </p>
                </div>
            </div>
        </div>
        
        <div class="card">
            <div class="card-header" id="headingThree">
                <h5 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                        Étapes pour la mise en place du projet avec le dépôt github
                    </button>
                </h5>
            </div>
            <div id="collapseThree" class="collapse" aria-labelledby="headingThree" data-parent="#accordionExample">
                <div class="card-body">
                    <p>

                        <br>
                    <ol>
                        <li>Installations des paquets nécessaires.</li>
                        <ul>
                            <li>Récupérer le dossier du projet et le déposer dans le répertoire du serveur web.</li>
                            <li>Dézipper le répertoire.</li>
                            <li>Exécuter la commande <code>composer install</code> afin d'installer les dépendances de composer.</li>
                            <li>Dupliquer .env.example avec comme nom .env afin de créer le fichier d'environnement.</li>
                        </ul>
                        <li>Générer la clé de cryptage.</li>
                        <ul><li>Exécuter la commande <code>php artisan key:generate</code>.</li></ul>
                        <li>Modifier les variables d'environnement dans le fichier .env.</li>
                        <ul>
                            <li>Remplir le champ DB_HOST dans le fichier par l'adresse de la base de données (naturellement en local : 127.0.0.1). </li>
                            <li>Remplir le champ DB_PORT dans le fichier par le port utilisé pour la base de données. </li>
                            <li>Remplir le champ DB_DATABASE dans le fichier par le nom de la base de données que vous aller importer. </li>
                            <li>Remplir le champ DB_USERNAME et le champ DB_PASSWORD dans le fichier par l'identifiant et le mot de passe pour la base de données (respectivement) .</li>
                            <li>Il est nécessaire de remplir les champs débutants par MAIL afin de permettre l'envoi de courriels</li>
                        </ul>
                        <li>Importer la base de données.</li>
                        <li>Vérifier si la page de connexion s'affiche correctement.</li>



                    </ol>
                    </p>
                </div>
            </div>
        </div>
        <div class="card">
            <div class="card-header" id="headingFour">
                <h5 class="mb-0">
                    <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                        Structure générale d'un projet avec Laravel
                    </button>
                </h5>
            </div>
            <div id="collapseFour" class="collapse" aria-labelledby="headingFour" data-parent="#accordionExample">
                <div class="card-body">
                    <p><br>
                    <dl class="row">
                        <dt class="col-sm-3">Contrôleurs</dt>
                        <dd class="col-sm-9">
                            App\Http\Controllers\
                        </dd>
                        <dt class="col-sm-3 text-truncate">Modèles</dt>
                        <dd class="col-sm-9">
                            App\Http\Models\
                        </dd>
                        <dt class="col-sm-3 mb-2">Vues</dt>
                        <dd class="col-sm-9">Resources\Views\ </dd>
                        <dt class="col-sm-3">Routes</dt>
                        <dd class="col-sm-9">Routes\web.php</dd>
                        <dt class="col-sm-3">Migrations</dt>
                        <dd class="col-sm-9">Database\migrations</dd>
                        <dt class="col-sm-3">Seeds</dt>
                        <dd class="col-sm-9">Database\seeds</dd>
                        <dt class="col-sm-3">Docs</dt>
                        <dd class="col-sm-9">Contient la sauvegarde de la base de données</dd>
                        <dt class="col-sm-3">Autres questions ?</dt>
                        <dd class="col-sm-9"><a href="https://laravel.com/docs/5.8/structure">https://laravel.com/docs/5.8/structure</a></dd>

                    </dl>
                    </p>
                </div>
            </div>
        </div>
            <div class="card">
                <div class="card-header" id="headingFive">
                    <h5 class="mb-0">
                        <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseFive" aria-expanded="false" aria-controls="collapseFive">
                           Derniers commits
                        </button>
                    </h5>
                </div>
                <div id="collapseFive" class="collapse" aria-labelledby="headingFive" data-parent="#accordionExample">
                    <div class="card-body">
                        <?php
                        $gitRev = '<p>';
                        $gitRev .= shell_exec("git log -10 --pretty=format:'- <span style=\"font-size: 20px;\"> %s </span> <em> [%h]</em>  <br>' --abbrev-commit `git merge-base local-dev dev`");


                        $gitRev .= '</p>';
                        echo $gitRev;
                        ?>
                    </div>
                </div>
        </div>
            <div class="card">
                <div class="card-header" id="headingSix">
                    <h5 class="mb-0">
                        <button class="btn collapsed" type="button" data-toggle="collapse" data-target="#collapseSix" aria-expanded="false" aria-controls="collapseFive">
                            Diagrammes de la bd
                        </button>
                    </h5>
                </div>
                <div id="collapseSix" class="collapse" aria-labelledby="headingSix" data-parent="#accordionExample">
                    <div class="card-body">
                        <h5>Diagramme de provenance</h5>
                        <a href="http://www.databaseanswers.org/data_models/online_banking/index.htm"><img width="550px" src="{{asset('/storage/app/public/online_banking_model.gif')}}" ></a>
                        <h5>Diagramme actuel</h5>
                        <img width="850px" src="{{asset('/storage/app/public/banque.png')}}" >
                    </div>
                </div>
            </div>
    </div>
    <br>
    <h5>Si vous êtes en local, notez que ce site est disponible à l'adresse suivante : <a href="http://internet.pascalparent.ca">internet.pascalparent.ca</a></h5>
    <h5>Pour des questions ou pour des critères que vous jugez non atteints avec cette application Web, veuillez m'en informer avec le formulaire ci-dessous, merci.</h5>
        <form id="formCommentaire" method="post" action="{{route('commentaire')}}">
            {{csrf_field()}}
            <textarea class="form-control" cols="25" rows="8" form="formCommentaire" name="commentaire" required></textarea>
            <br>
            <input class="form-control btn-outline-primary" type="submit" />
        </form>
@endsection
