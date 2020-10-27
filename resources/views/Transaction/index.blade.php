@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('transactions', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.transactions') <span class="float-right h5" style="padding-top: 7px;"><a href="{{route('admin.transaction.ajouter')}}" class=" mb-1" >
        @lang('app.new_operation') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')
    <script>
        $( document ).ready(function() {
            $('.bouton-options').hide();
            $(".transaction-row").hover(function(){
                $(".dropdown-menu").removeClass('show');
                $(this).find('.bouton-options').fadeIn(150);

            }, function(){
                $(".dropdown-menu").removeClass('show');
                $(this).find('.bouton-options').fadeOut(150);
            });
        });

    </script>

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
            <th ></th>
        </tr>
        </thead>
        <tbody>
        @forelse($transactions as $transaction)
            <tr class="transaction-row">
                <td>{{$transaction->compte->utilisateur->nom}}</td>
                <td>{{$transaction->compte->id}}, {{$transaction->compte->type_compte->type}}</td>
                <td>{{$transaction->created_at}}</td>
                <td>{{__('types_transaction.'.$transaction->type_transaction->type)}}</td>
                <td>{{$transaction->description}}</td>
                <td>@money($transaction->montant) $</td>
                @if($transaction->type_transaction->type == "check_deposit")
                    <td><img width="200px" src="{{asset('storage/app/cheques/'.$transaction->image->fichier)}}" alt="Chèque" /></td>
                @else
                    <td>Non applicable</td>
                @endif
                <td style="vertical-align: middle; min-width: 70px">


                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown bouton-options btn-sm " style="display: none" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            ●●●
                        </button>
                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton">
                            <a class="btn dropdown-item" href="{{route('transaction.modifier',['id'=>$transaction->id])}}">Modifier</a>
                            <a class="btn btn-outline-danger dropdown-item" href="{{route('transaction.supprimer',['id'=>$transaction->id])}}">Supprimer</a>

                        </div>
                    </div>

                </td>
            </tr>
        @empty
            <tr><td class="text-center" colspan="8"><span  style="font-size: smaller; color:gray"> @lang('app.no_transaction')</span></td></tr>
        @endforelse
        </tbody>
    </table>






@endsection

