$.ajaxSetup({
    headers: {
        'X-CSRF-TOKEN': $('meta[name="csrf-token"]').attr('content')
    }
});
$(function () {


    $(".btn-edit").click(function(){
        changeConteneur("#div-add-edit", "#table-comptes", " > Modifier le compte");
    });
    $(".btn-back").click(function(){
       changeConteneur("#table-comptes", "#div-add-edit");


    });

    function changeConteneur(nouvelElement, ancienElement, titreAction=""){
        $(ancienElement).toggle("fade", 300, function(){
            $(nouvelElement).toggle("fade", 300);
        });

        $("#titre-action").text(titreAction);

    }
});

