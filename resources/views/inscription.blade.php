@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item w-100" href="{{route('vueConnexion')}}">Connexion</a>
    <a class="menu-item menu-item-selected w-100" >Inscription</a>
@endsection
@section('navbar_droite', 'Non connecté')
@section('titre_page', 'Inscription')
@section('content_page')


            <form action="{{route('inscription')}}" method="post">
                {{csrf_field()}}
                <div class="form-group">
                    <label for="no_carte">Numéro de carte : </label>
                    <input type="text" id="no_carte" name="no_carte" placeholder="No de carte"/>
                </div>
                <div class="form-group">
                    <label for="nom">Nom : </label>
                    <input type="text" id="nom" name="nom" placeholder="Nom"/>
                </div>
                <div class="form-group">
                    <label for="courriel">Courriel : </label>
                    <input type="email" id="courriel" name="courriel" placeholder="Courriel"/>
                </div>
                <div class="form-group">
                    <label for="pwd">Mot de passe : </label>
                    <input type="password" id="pwd" name="mot_de_passe" placeholder="Mot de passe"/>
                </div>
                <div class="text-danger mb-1">
                    @foreach ($errors->all() as $error)
                        {{ $error }} <br>
                    @endforeach
                </div>


                <button type="submit" class="btn btn-primary">Submit</button>
            </form>






    </div>



@endsection
