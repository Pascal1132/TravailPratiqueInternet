@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item menu-item-selected w-100" >@lang('app.login')</a>
    <a class="menu-item w-100" href="{{route('vueInscription')}}" >@lang('app.signin')</a>
@endsection
@section('navbar_droite', __('app.not_logged'))
@section('titre_page', __('app.login'))
@section('content_page')


            <form action="{{route('connexion')}}" method="post">
                {{csrf_field()}}

                <div class="form-group">
                    <label for="courriel">@lang('app.email') : </label>
                    <input type="email" id="courriel" name="courriel" placeholder="@lang('app.email')"/>
                </div>
                <div class="form-group">
                    <label for="pwd">@lang('app.password') : </label>
                    <input type="password" id="pwd" name="password" placeholder="@lang('app.password')"/>
                </div>

                <div class="text-danger mb-1">
                    @foreach ($errors->all() as $error)
                        {{ $error }} <br>
                    @endforeach
                </div>


                <button type="submit" class="btn btn-primary">Submit</button>
            </form>






    </div>



@endsection