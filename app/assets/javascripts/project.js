$(function(){
    $("a.load_projects").on("click", function(e){

    $.get(this.href).success(function(response){
        $("div.projects").html(response)
             })

        e.preventDefault();
    })
})

// Submit note via AJAX

$(function(){
    $("new_project").on("submit", function(e){

        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize();
            success: function(response){
                $("#project_name").val("");
                var $ul = $("div.project ul")
                $ul.append(response);
            }
        });

        e.preventDefault();
    })
});