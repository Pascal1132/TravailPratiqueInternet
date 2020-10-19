@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('utilisateurs', 'menu-item-selected')
    @endcomponent

@endsection

@section('titre_page')@lang('app.users_list') <span class="float-right h5" style="padding-top: 7px;">
       </span>@endsection
@section('content_page')
    <table class="table">
        <thead class="thead-dark">
        <tr>
            <th scope="col">@lang('app.name')</th>
            <th scope="col">@lang('app.email')</th>

            <th scope="col">@lang('app.role')</th>


            @if(Gate::check('afficher-tous-comptes')||Gate::check('modifier-utilisateurs') || Gate::check('effacer-utilisateurs'))
                <th scope="col"></th>
            @endif

        </tr>
        </thead>
        <tbody>
        @forelse($utilisateurs as $utilisateur)
            <tr>
                <td>{{$utilisateur->nom}}</td>
                <td>{{$utilisateur->courriel}}</td>
                <td>

                        {{__('types_role.' . $utilisateur->roles->first()->type)}}

                </td>
                @if(Gate::check('afficher-tous-comptes')|| Gate::check('modifier-utilisateurs'))
                    <td class="text-right">
                        @can('afficher-tous-comptes')<a class="btn-sm btn-info" href=".comptes_liste{{$utilisateur->id}}"
                                                        data-toggle="collapse">@lang('app.accounts')</a>@endcan
                        @can('modifier-utilisateurs') <a class="btn-sm btn-primary"
                                                         href="{{route('modifier', ['id'=>$utilisateur->id])}}">@lang('app.edit')</a>@endcan
                        @can('effacer-utilisateurs')<a class="btn-sm btn-secondary"
                                                       href="{{route('utilisateur.supprimer', ['id'=>$utilisateur->id])}}">@lang('app.erase')</a> @endcan
                    </td>@endif
            </tr>
            @can('afficher-tous-comptes')
                <tr class="collapse comptes_liste{{$utilisateur->id}}">
                    <td colspan="6">
                        <div class="collapse comptes_liste{{$utilisateur->id}}">
                            <div class=" bg-info text-light p-2">
                                <h5>@lang('app.accounts')</h5>
                                <div class="bg-light p-2 text-dark">
                                    <ul class="list-group">


                                        @forelse($utilisateur->comptes as $compte)
                                            <li class="list-group-item">{{$compte->nom}} ,
                                                @lang('types_compte.'.$compte->type_compte->type) , @lang('app.amount') : @money($compte->getMontant()) $
                                                <span class="float-right">@can('gerer-tous-comptes')<a
                                                            href="{{route('afficherCompte', ['id'=>$compte->id])}}">
                                            @lang('app.edit')</a>@endcan </span>
                                            </li>

                                        @empty
                                            <li class="list-group-item disabled"><span
                                                        style="font-size: smaller"> @lang('app.user_no_account')</span>
                                            </li>
                                        @endforelse
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </td>
                </tr>

            @endcan
        @empty
        @endforelse
        </tbody>
    </table>





@endsection

