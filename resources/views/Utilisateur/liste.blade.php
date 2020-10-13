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


        @if(Gate::check('modifier-utilisateurs') || Gate::check('effacer-utilisateurs'))
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
                @foreach($utilisateur->roles as $roles)
                    {{__('db.' . $roles->type)}}
                    @if(!$loop->last)
                        ,
                    @endif
                @endforeach
            </td>
            @can('modifier-utilisateurs') <td class="text-right"><a class="btn-sm btn-primary" href="{{route('modifier', ['id'=>$utilisateur->id])}}">@lang('app.edit')</a>@endcan
                @can('effacer-utilisateurs')<a class="btn-sm btn-secondary">@lang('app.erase')</a> @endcan </td>

        </tr>
        @empty
            @endforelse
    </tbody>
</table>





@endsection

