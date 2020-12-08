@extends('layouts.base_menus')
@section('sidebar_contenu')

    @component('layouts.menu_principal')
        @push('transactions', 'menu-item-selected')
    @endcomponent
@endsection

@section('titre_page') @lang('app.new_operation') @endsection
@section('content_page')


    <!-- React root DOM -->
    <div id="listes-liees-react" data-utilisateurs="{{$utilisateurs}}">
    </div>



@endsection

