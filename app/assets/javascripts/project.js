$(function(){
    $("a.load_notes").on("click", function(e){

    $.get(this.href).success(function(response){
        $("div.notes").html(response)
             })

        e.preventDefault();
    })
})