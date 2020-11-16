@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('transactions', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.new_operation') @endsection
@section('content_page')


    <form id="formulaireAjoutOperation" method="post" action="{{route('transaction.ajouter.admin')}}" enctype="multipart/form-data">
        {{csrf_field()}}
        <select class="form-control" name="utilisateur" id="utilisateur_liste_dependante" form="formulaireAjoutOperation">
            <option selected hidden disabled>Faites un choix dans la liste</option>
            @foreach($utilisateurs as $utilisateur)
                <option value="{{$utilisateur->id}}">{{$utilisateur->nom}} / {{$utilisateur->courriel}}</option>
            @endforeach

        </select>
        <br>
        <select class="form-control" name="compte_id" id="compte_liste_dependante" form="formulaireAjoutOperation">
        </select><br>

        <input type="text" class="form-control" name="montant" placeholder="@lang('app.amount')" />
        <br>

        <input type="submit" class="btn btn-primary" value="@lang('app.submit')" />
    </form>




@endsection

