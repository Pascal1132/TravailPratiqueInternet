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

    $(document).on("click",".btn-edit", function(){
        var id = $(this).attr('compteId');
        editCompte(id);
        changeConteneur("#div-add-edit", "#table-comptes", " > Modifier le compte");

        $(".btn-send").attr('action', 'edit');
        $("#idCompte").val(id);

    });
    $(document).on("click",".btn-erase",function(){
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
                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $(".messages").html(errorMessage("Erreur dans l'ajout du compte!"));
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
                        getComptes();
                        $(".messages").html("<div class='pl-2'>"+successMessage("Données supprimées!")+"</div>");
                        $(".messages").fadeIn(500);

                    },
                    error: function (XMLHttpRequest, textStatus, errorThrown) {
                        $(".messages").html(errorMessage("Erreur dans la suppression du compte. "));
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
        getComptes();
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
                $("#input-"+data.data.type_compte.type).prop('checked', true);
                $("#utilisateur-"+data.data.utilisateur_id).prop('selected', true);
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(".messages").html(errorMessage("Erreur dans la récupération des informations du compte. "));
                $(".messages").fadeIn(500);
            }
        });
    }

    function addCompte(){
        $(".custom-control").trigger("reset");
        $(".form-control").trigger("reset");


    }
    function getComptes(){
        $.ajax({
            type: 'GET',
            url: APP_URL+'/api/comptes',
            dataType: "JSON",

            data: {_token: $('meta[name="csrf-token"]').attr('content')},
            success: function (data) {
                $("#liste-compte-tbody").html("");
                data.data.forEach(function(item){
                    console.debug(remplirLigneTableau(item.utilisateur,item,item.montant));

                    $("#liste-compte-tbody").append(remplirLigneTableau(item.utilisateur,item,item.montant));
                });
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(".messages").html(errorMessage("Erreur dans la récupération des comptes. "));
                $(".messages").fadeIn(500);
            }

        });
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
            },
            error: function (XMLHttpRequest, textStatus, errorThrown) {
                $(".messages").html(errorMessage("Erreur dans la récupération des utilisateurs. "));
                $(".messages").fadeIn(500);
            }

        });
    }

    function remplirLigneTableau(utilisateur,compte, montant,){
        str = "<tr>\n" +
            "                <td> <a class=\"\"\n" +
            "                                                     href=\""+APP_URL+'/modifier?id='+utilisateur.id+"\">"+utilisateur.nom+" ("+ utilisateur.id+") </a></td>\n" +
            "                <td>"+compte.nom+"</td>\n" +
            "                <td>"+compte.type_compte_nom+"</td>\n" +
            "                <td>"+compte.montant+"</td>\n" +
            "\n" +
            "                    <td class=\"text-right\">\n" +
            "                         <button compteId=\""+compte.id+"\" class=\"btn btn-sm btn-primary btn-edit\"\n" +
            "                                                         >Modifier</button>\n" +
            "                        <button compteId=\""+compte.id+"\" onclick='btnErase' class=\"btn btn-sm btn-secondary btn-erase\"\n" +
            "                                                       >Supprimer</button>\n" +
            "                    </td>\n" +
            "            ";


        str+="</tr>";
        return str;
    }

    function successMessage(str){
        return "<div style=\"margin-left: -16px; margin-right: -24px;\">\n" +
        "                            <div class=\"main__content notice-flash\">\n" +
        "                                <div class=\"notification green\">\n" +
        "                                    <b>Note: </b> "+str+"</div>\n" +
        "                            </div>\n" +
        "                        </div>";
    }
    function errorMessage(str){
        return "<div style=\"margin-left: -16px; margin-right: -24px;\">\n" +
            "                            <div class=\"main__content notice-flash\">\n" +
            "                                <div class=\"notification red\">\n" +
            "                                    <b>Note: </b> "+str+"</div>\n" +
            "                            </div>\n" +
            "                        </div>";
    }


});

