@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('comptes', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') {{$compte->nom}} <span class="float-right h5 mt-2 " style="padding-top: 17px; font-size: medium"><a href="{{route('compte.modifier',['id'=>$compte->id])}}" class="text-dark " >
        @lang('app.modify_account') <span class="iconify" data-icon="ant-design:edit-outlined" data-inline="false"></span></a> | <a href="{{route('ajouterTransaction',['id'=>$compte->id])}}" class="text-dark" >
        @lang('app.new_operation') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a> | <a class="text-danger" href="{{route('compte.supprimer',['id'=>$compte->id])}}" class="text-dark" >
        @lang('app.delete_account') <span class="iconify " data-icon="carbon:delete" data-inline="false"></span></a></span>@endsection
@section('content_page')


    <a href="{{route('compte.pdf', ['id'=>$compte->id])}}">Télécharger le sommaire du compte [PDF]</a>
    <br><br>
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
            <td>{{__('types_transaction.'.$transaction->type_transaction->type)}}</td>
            <td>{{$transaction->description}}</td>
            <td>@money($transaction->montant) $</td>
        </tr>
        @empty
            <tr><td class="text-center" colspan="4"><span  style="font-size: smaller; color:gray"> @lang('app.no_transaction')</span></td></tr>
        @endforelse
        </tbody>
    </table>






@endsection

