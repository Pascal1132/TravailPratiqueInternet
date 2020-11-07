<a class="menu-item @stack('accueil') w-100" href="{{route('utilisateur.accueil')}}" >@lang('app.home')</a>
<a class="menu-item @stack('comptes') w-100" href="{{route('comptes')}}" >@lang('app.your_accounts')</a>
@can('gerer-toutes-transactions')
    <a class="menu-item w-100 @stack('transactions')" href="{{route('transaction.index')}}" >@lang('app.transactions')</a>
@endcan
@can('afficher-utilisateurs')
    <a class="menu-item w-100 @stack('utilisateurs')" href="{{route('utilisateur.index')}}" >@lang('app.users')</a>
@endcan
@can('gerer-tous-comptes')
    <a class="menu-item w-100 @stack('admin.comptes')" href="{{route('admin.comptes')}}" >@lang('app.accounts')</a>
@endcan
