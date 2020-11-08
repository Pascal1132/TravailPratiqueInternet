$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
$(function () {

    $(".btn-add").click(function(){
        changeConteneur("#div-add-edit", "#table-comptes", " > Ajouter le compte");
    });

    $(".btn-edit").click(function(){
        var id = $(this).attr('compteId');
        editCompte(id);
        changeConteneur("#div-add-edit", "#table-comptes", " > Modifier le compte");

        $("#idCompte").val();

    });

    $(".btn-back").click(function(){
       changeConteneur("#table-comptes", "#div-add-edit");
    });

    function changeConteneur(nouvelElement, ancienElement, titreAction=""){
        $(ancienElement).toggle("slide", 500, function(){
            $(nouvelElement).toggle("slide",{}, 500);
        });
        $("#titre-action").text(titreAction);
    }

    //Remplir les données de la modification du compte
    function editCompte(id){
        $.ajax({
            type: 'GET',
            url: APP_URL+'/api/comptes/'+id,
            dataType: "JSON",

            data: {_token: $('meta[name="csrf-token"]').attr('content'), 'id':id},
            success: function (data) {
                $("#nomCompte").val(data.data.nom);
                $("#input-"+data.data.type_compte).prop('checked', true);
            }

        });
        listeUtilisateurs();

    }

    function listeUtilisateurs(){
        $.ajax({
            type: 'GET',
            url: APP_URL+'/api/utilisateurs',
            dataType: "JSON",

            data: {_token: $('meta[name="csrf-token"]').attr('content')},
            success: function (data) {
                data.data.forEach(function(item){
                    console.debug(item);
                });
            }

        });
    }


});

