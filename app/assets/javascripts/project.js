$(document).ready(function(){
    $("a.load_tasks").on("click", function(e){
            e.preventDefault();
    $.get(this.href).success(function(response){
        var html = ``
       response.forEach(function(element) {
        html += `<h2>${element.notes}</h2> <p>${element.status}</p>`
        
       })
       $("div.tasks").html(html)
             })

    })
})


// Submit task via AJAX

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
