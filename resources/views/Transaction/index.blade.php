@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('transactions', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.transactions')@endsection
@section('content_page')

    <table class="table w-100">

        <thead class="thead-dark">
        <tr class=" font-weight-bold">
            <th>Nom client</th>
            <th>No. compte / type</th>
            <th>Date</th>
            <th>@lang('app.type')</th>
            <th>Description</th>
            <th>@lang('app.amount')</th>
            <th>Photo cheque</th>
        </tr>
        </thead>
        <tbody>
        @forelse($transactions as $transaction)
            <tr>
                <td>{{$transaction->compte->utilisateur->nom}}</td>
                <td>{{$transaction->compte->id}}, {{$transaction->compte->type_compte->type}}</td>
                <td>{{$transaction->created_at}}</td>
                <td>{{$transaction->type_transaction->type}}</td>
                <td>{{$transaction->description}}</td>
                <td>@money($transaction->montant) $</td>
                @if($transaction->type_transaction->type == "DépotChèque")
                    <td><img width="200px" src="{{asset('storage/app/cheques/'.$transaction->image->fichier)}}" alt="Chèque" /></td>
                @else
                    <td>Non applicable</td>
                @endif
            </tr>
        @empty
            <tr><td class="text-center" colspan="4"><span  style="font-size: smaller; color:gray"> @lang('app.no_transaction')</span></td></tr>
        @endforelse
        </tbody>
    </table>





@endsection

