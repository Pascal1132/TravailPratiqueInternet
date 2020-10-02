@extends('layouts.base_menus')
@section('sidebar_contenu')

<a class="menu-item w-100" href="{{route('utilisateur.index')}}">@lang('app.home')</a>
<a class="menu-item w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>

<a class="menu-item menu-item-selected w-100" href="{{route('listeUtilisateurs')}}" >@lang('app.users')</a>

@endsection
@section('navbar_droite', Auth::user()->nom)
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

