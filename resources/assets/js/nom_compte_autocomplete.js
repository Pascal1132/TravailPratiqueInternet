$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
$(function () {
    var autoCompleteSource = APP_URL+"/api/autocomplete_nomCompte"
    $('#nomCompte').autocomplete({
        source: autoCompleteSource,
        minLength: 1,
        cache: false,
        select:function(event, ui){
            $("input[type=radio]").attr('checked', false);
            $('#input-'+ui.item.type).attr('checked', 'checked');
            console.log('SELECT');
        }
    })
});