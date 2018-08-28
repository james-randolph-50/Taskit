$(function(){
    $("a.load_notes").on("click", function(e){

    $.get(this.href).success(function(response){
        $("div.notes").html(response)
             })

        e.preventDefault();
    })
})

// Submit note via AJAX

$(function(){
    $("new_note").on("submit", function(e){

        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize();
            success: function(response){
                $("#task_note").val("");
                var $ul = $("div.notes ul")
                $ul.append(response);
            }
        });

        e.preventDefault();
    })
});