$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
$(function () {
    $("#utilisateur_liste_dependante").on('change', function(){

        $.ajax({
            /* the route pointing to the post function */
            url: APP_URL+"/api/getCompteByUtilisateur",
            type: 'POST',
            /* send the csrf-token and the input to the controller */
            data: {_token: $('meta[name="csrf-token"]').attr('content'), id:$("#utilisateur_liste_dependante").val()},
            dataType: 'JSON',
            /* remind that 'data' is the response of the AjaxController */
            success: function (data) {
                console.debug(data);
                $("#compte_liste_dependante").html("");
                data.forEach(function(item, index){

                    $("#compte_liste_dependante").append(new Option(item['nom'], item['id']));

                });
            }
        });
    });
});