@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('transactions', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.modify_transactions')@endsection
@section('content_page')

    <form id="formulaireModification" method="post" action="{{route('transaction.modifier')}}" enctype="multipart/form-data">
        {{csrf_field()}}
        <label >@lang('app.user') / @lang('app.account_name'): </label>
        <select form="formulaireModification" name="compte_id" class="form-control" id="compte_destination">
            @foreach($comptes as $compte)
                <option value="{{$compte->id}}">{{$compte->utilisateur->nom}} ({{$compte->utilisateur->id}}) / {{$compte->nom}} </option>
            @endforeach

        </select><br>
        <label class="">@lang('app.amount') : </label>
        <div class="input-group">
            <input class="form-control" type="text" name="montant" value="{{$transaction->montant}}"/>
        </div>
        <input type="hidden" name="id" value="{{$transaction->id}}"/>
        <br>

        <label class="input-cheque">@lang('app.update_check_picture') : </label>

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
        <textarea form="formulaireModification" class="form-control" name="description" id="description_textarea" cols="10" rows="2">{{$transaction->description}}</textarea>
        <br>

        <input type="submit" class="btn btn-primary" value="@lang('app.submit')" />
    </form>





@endsection

