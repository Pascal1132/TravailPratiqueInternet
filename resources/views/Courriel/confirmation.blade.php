@component('mail::message')
    @lang('email.msg_confirm')

@component('mail::button',['url'=>route('utilisateur.confirmer',['token'=> urlencode(Auth::user()->confirmation_token)])])
    @lang('email.confirm')
@endcomponent
    @lang('email.sincerly'),
    {{config('app.name')}}
@endcomponent