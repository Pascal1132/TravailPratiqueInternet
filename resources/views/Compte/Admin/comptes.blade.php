@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('admin.comptes', 'menu-item-selected')
    @endcomponent

@endsection

@section('titre_page')@lang('app.users_list') <span class="float-right h5" style="padding-top: 7px;">
       </span><span class="float-right h5" style="padding-top: 7px;"><a href="" class=" mb-1" >
        @lang('app.new_operation') <span class="iconify" data-icon="ant-design:file-add-outlined" data-inline="false"></span></a></span>@endsection
@section('content_page')
    <table class="table">
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
                        @can('modifier-tous-comptes') <a class="btn-sm btn-primary" href=""
                                                         >@lang('app.edit')</a>@endcan
                        @can('effacer-tous-comptes')<a class="btn-sm btn-secondary"
                                                       href="">@lang('app.erase')</a> @endcan
                    </td>@endif
            </tr>

        @empty
        @endforelse
        </tbody>
    </table>





@endsection

