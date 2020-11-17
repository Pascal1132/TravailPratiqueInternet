 @extends('layouts.app')
@section('content')
    <style>
        footer {
            position: fixed;
            left: 0;
            bottom: 0;
            padding: 5px;
            width: 100%;
            background-color: darkgray;

            text-align: center;
        }

    </style>
        <label style="top: 0; left: 0px"> {{config('app.name', 'TheBankOfShawinigan')}}</label>
        <br>
        <h1>Sommaire du compte : {{$compte->nom}} ({{$compte->id}})</h1>
        <hr>
        <ul style="list-style-type:none; margin: 0px; padding: 0px;font-size: 20px">
            <li>Nom du compte : {{$compte->nom}}</li>
            <li>Montant du compte : @money($compte->getMontant()) $</li>
            <li>Utilisateur du compte : {{$compte->utilisateur->nom}}</li>
            <li>Type de compte : @lang('types_compte.'.$compte->type_compte->type)</li>
        </ul>
        <h2>Transactions du compte</h2>
        <hr>
        <table class="" style="width: 100%">

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
                    <td>{{$transaction->description}} </td>
                    <td>@money($transaction->montant) $</td>
                </tr>
            @empty
                <tr><td class="text-center" colspan="4"><span  style="font-size: smaller; color:gray"> @lang('app.no_transaction')</span></td></tr>
            @endforelse

            </tbody>
        </table>
    <footer style="">{{ config('app.name', 'TheBankOfShawinigan')}} | {{$titre}}</footer>
@endsection
@section('title', $titre)
