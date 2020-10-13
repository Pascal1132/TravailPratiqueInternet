@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('comptes', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.new_operation') | <a href="{{ route('afficherCompte', ['id'=>$compte->id]) }}">@lang('app.back')</a>@endsection
@section('content_page')
    <script>
        $( document ).ready(function() {
            $("#type_operation").change(function(){
                $(".input-cheque").toggle();
                $(".input-virement").toggle();
                $("#description_textarea").val($("#type_operation option:selected").text());
            });
        });

    </script>

    <form id="formulaireAjoutOperation" method="post" action="{{route('validationAjouterTransaction')}}" enctype="multipart/form-data">
        {{csrf_field()}}
        <label for="type_operation">@lang('app.operation_type') : </label>
        <br>
        <select form="formulaireAjoutOperation" name="type_operation" class="form-control" id="type_operation">
            <option value="depot_cheque">@lang('app.check_deposit')</option>
            <option value="virement_entre_comptes">@lang('app.account_transfer')</option>
        </select>
        <br>
        <label>@lang('app.account_name') : </label>
        <input class="form-control" type="text" disabled value="{{$compte->nom}}"/><br>
        <label class="">@lang('app.amount') : </label>
        <div class="input-group">
            <input class="form-control" type="text" name="montant"/>
        </div>
        <input type="hidden" value="{{$compte->id}}" name="compte_id" />
        <br>
        <label class="input-virement" style="display: none">@lang('app.destination_account') : </label>
        <select form="formulaireAjoutOperation" name="compte_destination" style="display: none" class="form-control input-virement" id="compte_destination">
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
                <input name="image_cheque" type="file" class="custom-file-input" id="inputGroupFile01"
                       aria-describedby="inputGroupFileAddon01" value="@lang('app.browse')">
                <label class="custom-file-label" for="inputGroupFile01">@lang('app.choose_file')</label>
            </div>
            <br>
        </div>
        <br class="input-cheque">
        <label >Description : </label>
        <textarea form="formulaireAjoutOperation" class="form-control" name="description" id="description_textarea" cols="10" rows="2">@lang('app.check_deposit')</textarea>
        <br>

        <input type="submit" class="btn btn-primary" value="@lang('app.submit')" />
    </form>






@endsection

