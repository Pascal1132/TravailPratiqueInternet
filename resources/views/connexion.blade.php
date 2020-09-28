@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item menu-item-selected w-100" >Connexion</a>
    <a class="menu-item w-100" href="{{route('vueInscription')}}" >Inscription</a>
@endsection
@section('navbar_droite', 'Non connecté')
@section('titre_page', 'Connexion')
@section('content_page')


            <form action="{{route('connexion')}}" method="post">
                {{csrf_field()}}

                <div class="form-group">
                    <label for="courriel">Courriel : </label>
                    <input type="email" id="courriel" name="courriel" placeholder="Courriel"/>
                </div>
                <div class="form-group">
                    <label for="pwd">Mot de passe : </label>
                    <input type="password" id="pwd" name="password" placeholder="Mot de passe"/>
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
