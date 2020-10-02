@extends('layouts.base_menus')
@section('sidebar_contenu')
    <a class="menu-item w-100" href="{{route('vueConnexion')}}">@lang('app.login')</a>
    <a class="menu-item menu-item-selected w-100" >@lang('app.signin')</a>
@endsection

@section('titre_page', __('app.signin'))
@section('content_page')


            <form action="{{route('inscription')}}" method="post">

                {{csrf_field()}}

                <div class="form-group">
                    <label class="align-right" for="nom">@lang('app.name') : </label>
                    <input type="text" id="nom" name="nom" placeholder="@lang('app.name')"/>
                </div>

                <div class="form-group">
                    <label class="align-right" for="courriel">@lang('app.email') : </label>
                    <input type="email" id="courriel" name="courriel" placeholder="@lang('app.email')"/>
                </div>
                <div class="form-group">
                    <label class="align-right" for="pwd">@lang('app.password') : </label>
                    <input type="password" id="pwd" name="mot_de_passe" placeholder="@lang('app.password')"/>
                </div>
                <div class="text-danger mb-1">
                    @foreach ($errors->all() as $error)
                        {{ $error }} <br>
                    @endforeach
                </div>


                <button type="submit" class="btn btn-primary">@lang('app.submit')</button>
            </form>






    </div>



@endsection
