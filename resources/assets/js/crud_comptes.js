$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
$(function () {

    $(".btn-add").click(function(){
        changeConteneur("#div-add-edit", "#table-comptes", " > Ajouter le compte");
        listeUtilisateurs();
        addCompte();
    });

    $(".btn-edit").click(function(){
        var id = $(this).attr('compteId');
        editCompte(id);
        changeConteneur("#div-add-edit", "#table-comptes", " > Modifier le compte");

        $("#idCompte").val();

    });
    $(".btn-erase").click(function(){
        $("#deleteConfirmationModal").modal('show');
    });

    $(".btn-back").click(function(){
       changeConteneur("#table-comptes", "#div-add-edit");
    });

    function changeConteneur(nouvelElement, ancienElement, titreAction=""){
        $(ancienElement).toggle("drop", 500, function(){
            $(nouvelElement).toggle("slide",{}, 500);
        });
        $("#titre-action").text(titreAction);
        $(".btn-add").fadeToggle();
    }

    //Remplir les données de la modification du compte
    function editCompte(id){
        listeUtilisateurs();
        $.ajax({
            type: 'GET',
            url: APP_URL+'/api/comptes/'+id,
            dataType: "JSON",

            data: {_token: $('meta[name="csrf-token"]').attr('content'), 'id':id},
            success: function (data) {
                $("#nomCompte").val(data.data.nom);
                $("#input-"+data.data.type_compte).prop('checked', true);
                $("#utilisateur-"+data.data.utilisateur_id).prop('selected', true);
            }
        });
    }

    function addCompte(){
        $("#form-add-edit").trigger("reset");
    }

    function listeUtilisateurs(){
        $.ajax({
            type: 'GET',
            url: APP_URL+'/api/utilisateurs',
            dataType: "JSON",

            data: {_token: $('meta[name="csrf-token"]').attr('content')},
            success: function (data) {
                $("#choixUtilisateur").html("");
                data.data.forEach(function(item){
                    console.debug(item);
                    $("#choixUtilisateur").append("<option id='utilisateur-"+item.id+"' value='"+item.id+"'>"+item.nom+"</option>");
                });
            }

        });
    }


});

