@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') @lang('app.new_operation')| <a href="{{ URL::previous() }}">@lang('app.back')</a>@endsection
@section('content_page')
    <script>
        $( document ).ready(function() {
            $("#type_operation").change(function(){
                $(".input-cheque").toggle();
                $(".input-virement").toggle();
            });
        });

    </script>

    <form id="formulaireAjoutOperation">
        <label for="type_operation">Type d'opération : </label>
        <br>
        <select form="formulaireAjoutOperation" class="form-control" id="type_operation">
            <option value="1">Virement entre comptes</option>
            <option value="2">Dépot par chèque</option>
        </select>
        <br>
        <label>@lang('app.account_name') : </label>
        <input class="form-control" type="text" disabled value="{{$compte->nom}}"/><br>
        <label class="input-virement" style="display: none">@lang('app.destination_account') : </label>
        <select form="formulaireAjoutOperation" style="display: none" class="form-control input-virement" id="compte_destination">
            @forelse($comptesDestination as $compteDestination)
                <option value="{{$compteDestination->id}}">{{$compteDestination->nom}} </option>
            @empty
                <option selected hidden disabled>@lang('app.no_account_destination')</option>
            @endforelse

        </select>
        <br style="display: none" class="input-virement">
        <label class="input-cheque">@lang('app.check') : </label>
        <div class="input-cheque input-group">
            <div class="input-group-prepend">
                <span class="input-group-text" id="inputGroupFileAddon01">@lang('app.upload')</span>
            </div>
            <div class="custom-file">
                <input type="file" class="custom-file-input" id="inputGroupFile01"
                       aria-describedby="inputGroupFileAddon01" value="@lang('app.browse')">
                <label class="custom-file-label" for="inputGroupFile01">@lang('app.choose_file')</label>
            </div>
        </div>
    </form>






@endsection

