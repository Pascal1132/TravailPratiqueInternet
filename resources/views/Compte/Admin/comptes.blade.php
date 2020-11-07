@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('admin.comptes', 'menu-item-selected')
    @endcomponent

@endsection
@push('script')
    <script src="{{asset('resources/assets/js/crud_comptes.js')}}"></script>
@endpush

@section('titre_page')@lang('app.accounts') <span id="titre-action"></span> <span class="float-right h5" style="padding-top: 7px;"><a class="btn-add mb-1" >
        @lang('app.new_operation') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')

    <div id="table-comptes" >
    <table class="table" >
        <thead class="thead-dark">
        <tr>
            <th scope="col">@lang('app.user')</th>
            <th scope="col">@lang('app.account_name')</th>
            <th scope="col">@lang('app.type')</th>

            <th scope="col">@lang('app.amount')</th>



            @if(Gate::check('afficher-tous-comptes')||Gate::check('modifier-utilisateurs') || Gate::check('effacer-utilisateurs'))
                <th scope="col"></th>
            @endif

        </tr>
        </thead>
        <tbody>
        @forelse($comptes as $compte)
            <tr>
                <td>@can('modifier-utilisateurs') <a class=""
                                                     href="{{route('modifier', ['id'=>$compte->utilisateur->id])}}">@endcan{{$compte->utilisateur->nom}} ({{$compte->utilisateur->id}})@can('modifier-utilisateurs') </a> @endcan</td>
                <td>{{$compte->nom}}</td>
                <td>{{__('types_compte.' .$compte->type_compte->type)}}</td>
                <td>@money($compte->getMontant())</td>

                @if(Gate::check('modifier-tous-comptes')|| Gate::check('effacer-tous-comptes'))
                    <td class="text-right">
                        @can('modifier-tous-comptes') <button class="btn btn-sm btn-primary btn-edit"
                                                         >@lang('app.edit')</button>@endcan
                        @can('effacer-tous-comptes')<button class="btn btn-sm btn-secondary btn-erase"
                                                       >@lang('app.erase')</button> @endcan
                    </td>@endif
            </tr>

        @empty
        @endforelse
        </tbody>
    </table>
    </div>
    <div style="display: none" id="div-add-edit">
        <a class="btn btn-sm btn-outline-success btn-back" > @lang('app.back') <span class="iconify " style="padding-bottom: 2px" data-icon="ri:arrow-go-back-line" data-inline="false"></span></a>

        <form class="pt-3" action="{{route('compte.modifier')}}" method="post">
            {{csrf_field()}}
            <label>@lang('app.type') : </label>
            @foreach($typesCompte as $typeCompte)
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" class="custom-control-input" id="input-{{$typeCompte->type}}" name="type" value="{{$typeCompte->id}}" >
                    <label class="custom-control-label" for="input-{{$typeCompte->type}}">{{__('types_compte.'.$typeCompte->type)}}</label>
                </div>
            @endforeach
            <input type="hidden" value="{{$compte->id}}" name="id">
            <div class="form-group">
                <label for="nomCompte">@lang('app.account_name') :</label>
                <input type="text" class="form-control" id="nomCompte" placeholder="@lang('app.account_name')" name="nom" value="">
            </div>
            <button type="submit" class="btn btn-primary">@lang('translation::translation.save')</button>
        </form>
    </div>
    </div>




@endsection

