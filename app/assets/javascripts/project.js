$(function(){
    $("a.load_tasks").on("click", function(e){
            e.preventDefault;
    $.get(this.href).success(function(response){
        $("div.tasks").html(response)
             })

    })
})

// Submit note via AJAX

$(function(){
    $("new_task").on("submit", function(e){

        $.ajax({
            type: "POST",
            url: this.action,
            data: $(this).serialize(),
            success: function(response){
                $("#task_notes").val("");
                var $ul = $("div.task ul")
                $ul.append(response);
            }
        });

        e.preventDefault();
    })
});