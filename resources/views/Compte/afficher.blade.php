@extends('layouts.base_menus')
@section('sidebar_contenu')

    <a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
    <a class="menu-item menu-item-selected w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
    @can('afficher-utilisateurs')
        <a class="menu-item w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>
    @endcan
@endsection

@section('titre_page') {{$compte->nom}} <span class="float-right h5" style="padding-top: 17px; font-size: medium"><a href="" class="text-dark " >
        @lang('app.modify_account') <span class="iconify" data-icon="ant-design:edit-outlined" data-inline="false"></span></a> | <a href="{{route('ajouterTransaction',['id'=>$compte->id])}}" class="text-dark" >
        @lang('app.new_operation') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')

    <br>
    <table class="table w-100">

        <thead>
        <tr class="bg-light font-weight-bold">
            <th>Date</th>
            <th>@lang('app.type')</th>
            <th>Description</th>
            <th>@lang('app.amount')</th>
        </tr>
        </thead>
        <tbody>
        @forelse($compte->transactions as $transaction)
        <tr>
            <td>{{$transaction->created_at}}</td>
            <td>{{$transaction->type_transaction->type}}</td>
            <td>{{$transaction->description}}</td>
            <td>{{$transaction->montant}} $</td>
        </tr>
        @empty
            <tr><td class="text-center" colspan="4"><span  style="font-size: smaller; color:gray"> @lang('app.no_transaction')</span></td></tr>
        @endforelse
        </tbody>
    </table>






@endsection

