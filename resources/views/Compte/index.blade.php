@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('comptes', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.accounts_list') <span class="float-right h5" style="padding-top: 7px;"><a href="{{route('nouveauCompte')}}" class=" mb-1" >
        @lang('app.new_account') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')

<table class="table">
    <thead class="thead-dark">
    <tr>
        <th scope="col">@lang('app.name')</th>
        <th scope="col">@lang('app.type')</th>

        <th scope="col">@lang('app.amount')</th>
        <th scope="col"></th>
    </tr>
    </thead>
    <tbody>
    @forelse(Auth::user()->comptes as $compte)
    <tr class="ligne-milieu" id="compte-{{$compte->id}}" onclick="window.location='{{route('afficherCompte', ['id'=>$compte->id])}}'">

        <td scope="row">{{$compte->nom}}</td>
        <td> {{$compte->type_compte->type}}</td>
        <td>@money($compte->getMontant()) $</td>
        <td ><span class="iconify" data-icon="fa-chevron-right" data-inline="false"></span></td>
    </tr>
    @empty
    <tr>
        <td colspan="6" class="text-center pt-3" style="font-family: Bahnschrift"> @lang('app.no_account') <a style="font-family: Bahnschrift" href="{{route('nouveauCompte')}}">@lang('app.create_new_account')!</a></td>

    </tr>
    @endforelse

    </tbody>
</table>





@endsection

