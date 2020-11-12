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
        $(".btn-send").attr('action', 'add');

    });

    $(".btn-edit").click(function(){
        var id = $(this).attr('compteId');
        editCompte(id);
        changeConteneur("#div-add-edit", "#table-comptes", " > Modifier le compte");

        $(".btn-send").attr('action', 'edit');
        $("#idCompte").val(id);

    });
    $(".btn-erase").click(function(){
        $("#deleteConfirmationModal").modal('show');
        var id = $(this).attr('compteId');
        $("#idCompte").val(id);
        $(".btn-send").attr('action', 'delete');
    });

    $(".btn-back").click(function(){
       changeConteneur("#table-comptes", "#div-add-edit");
    });

    $(".btn-send").click(function(){

        switch($(".btn-send").attr('action')){

            case 'add':
                $.ajax({
                    type: 'POST',
                    url: APP_URL+'/api/comptes',
                    dataType: "JSON",
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        'type_compte_id': $("input[name='type']:checked").val(),
                        'utilisateur_id': $("#choixUtilisateur").val(),
                        'nom': $('#nomCompte').val(),

                    },
                    success: function (data) {

                        $(".messages").html(successMessage("Ajout effectué!"));
                        $(".messages").fadeIn(500);
                    }
                });
                break;

            case 'edit':
                $.ajax({
                    type: 'PUT',
                    url: APP_URL+'/api/comptes/'+$("#idCompte").val(),
                    dataType: "JSON",
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                        'type_compte_id': $("input[name='type']:checked").val(),
                        'utilisateur_id': $("#choixUtilisateur").val(),
                        'nom': $('#nomCompte').val(),

                    },
                    success: function (data) {

                        $(".messages").html(successMessage("Mise à jour effectuée!"));
                        $(".messages").fadeIn(500);
                    }
                });
                break;
            case 'delete':
                $.ajax({
                    type: 'DELETE',
                    url: APP_URL+'/api/comptes/'+$("#idCompte").val(),
                    dataType: "JSON",
                    data: {
                        _token: $('meta[name="csrf-token"]').attr('content'),
                    },
                    success: function (data) {

                        $(".messages").html("<div class='pl-2'>"+successMessage("Données supprimées!")+"</div>");
                        $(".messages").fadeIn(500);
                    }
                });
                break;
        }
    });

    function changeConteneur(nouvelElement, ancienElement, titreAction=""){
        $(ancienElement).toggle("drop", 500, function(){
            $(".messages").html("");
            $(".messages").hide();
            $(nouvelElement).toggle("slide",{}, 500, function () {

            });
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
        $(".custom-control").trigger("reset");
        $(".form-control").trigger("reset");


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
    function successMessage(str){
        return "<div style=\"margin-left: -16px; margin-right: -24px;\">\n" +
        "                            <div class=\"main__content notice-flash\">\n" +
        "                                <div class=\"notification green\">\n" +
        "                                    <b>Note: </b> "+str+"</div>\n" +
        "                            </div>\n" +
        "                        </div>";
    }


});

