@extends('layouts.app')
@section('content')
    <div>

    </div>
    
    <form action="{{route('inscription')}}" method="post">
        {{csrf_field()}}
        <div class="form-group">
            <label for="courriel">Numéro de carte :</label>
            <input type="text" name="no_carte" placeholder="No de carte"/>
        </div>
        <div class="form-group">
            <label for="courriel">Nom :</label>
            <input type="text" name="nom" placeholder="Nom"/>
        </div>
        <div class="form-group">
            <label for="courriel">Courriel :</label>
            <input type="email" name="courriel" placeholder="Courriel"/>
        </div>
        <div class="form-group">
            <label for="pwd">Mot de passe:</label>
            <input type="password" name="mot_de_passe" placeholder="Mot de passe"/>
        </div>

        <button type="submit" class="btn btn-primary">Submit</button>
    </form>
                    @foreach ($errors->all() as $error)
                        <li>{{ $error }}</li>
                    @endforeach

@endsection
