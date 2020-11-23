@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('admin.comptes', 'menu-item-selected')
    @endcomponent

@endsection
@push('script')
    <script src="{{asset('resources/assets/js/crud_comptes.js')}}"></script>
@endpush

@section('titre_page')@lang('app.accounts') <span id="titre-action"></span> <span class="float-right h5" style="padding-top: 7px;"><a role="button" class=" btn-add mb-1" >
        @lang('app.new_account') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')

    <div class="messages" style="display: none"></div>
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
        <tbody id="liste-compte-tbody">
        @forelse($comptes as $compte)
            <tr>
                <td>@can('modifier-utilisateurs') <a class=""
                                                     href="{{route('modifier', ['id'=>$compte->utilisateur->id])}}">@endcan{{$compte->utilisateur->nom}} ({{$compte->utilisateur->id}})@can('modifier-utilisateurs') </a> @endcan</td>
                <td>{{$compte->nom}}</td>
                <td>{{__('types_compte.' .$compte->type_compte->type)}}</td>
                <td>@money($compte->getMontant())</td>

                @if(Gate::check('modifier-tous-comptes')|| Gate::check('effacer-tous-comptes'))
                    <td class="text-right">
                        @can('modifier-tous-comptes') <button compteId="{{$compte->id}}" class="btn btn-sm btn-primary btn-edit"
                                                         >@lang('app.edit')</button>@endcan
                        @can('effacer-tous-comptes')<button compteId="{{$compte->id}}" class="btn btn-sm btn-secondary btn-erase"
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

        <div class="pt-3" id="form-add-edit" >

            <label>@lang('app.type') : </label>
            @foreach($typesCompte as $typeCompte)
                <div class="custom-control custom-radio custom-control-inline">
                    <input type="radio" class="custom-control-input" id="input-{{$typeCompte->type}}" name="type" value="{{$typeCompte->id}}" >
                    <label class="custom-control-label" for="input-{{$typeCompte->type}}">{{__('types_compte.'.$typeCompte->type)}}</label>
                </div>
            @endforeach
            <div class="form-group">
                <label for="choixUtilisateur">@lang('app.user') : </label>
            <select id="choixUtilisateur" class="form-control"></select>
            </div>
            <input type="hidden" value="" name="id" id="idCompte">
            <div class="form-group">
                <label for="nomCompte">@lang('app.account_name') :</label>
                <input type="text" class="form-control" id="nomCompte" placeholder="@lang('app.account_name')" name="nom" value="">
            </div>
            <button type="submit" class="btn-send btn btn-primary" action="">@lang('app.submit')</button>
        </div>
    </div>

    <div id="deleteConfirmationModal" class="modal fade" aria-modal="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <div class="modal-header ">
                    <h4 class="modal-title">Êtes-vous sûr?</h4>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">

                    <p>Voulez-vous vraiment supprimer ce compte ? Les transactions associées à celui-ci seront,
                        à leur tour, effacées.</p>
                </div>
                <div class="modal-footer justify-content-center">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Annuler</button>
                    <button type="button" class="btn-send btn btn-danger " data-dismiss="modal" aria-label="Close" action="delete">Supprimer</button>
                </div>
            </div>
        </div>
    </div>




@endsection

