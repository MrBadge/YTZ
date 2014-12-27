$(document).ready(function() {

    var el = document.getElementById('rows');
    var sortable = Sortable.create(el, {
        draggable: ".drag"
    });

    $(document).on('click', '#task_done', function() {
        var rows = $("#rows tr");
        //var counter = 1;
        var json = {};
        images = [];
        for (var i = 0; i < rows.length; ++i) {
            var cells = rows[i].cells;
            images.push(cells[0].firstChild.getAttribute('id'));
        }
        json.answer = images;
        /*$.ajax({
            type: "POST",
            url: "/text_correction_utz/" + $('#utz_id').val() + "/check_answer",
            data: json,
            success: function(msg) {
                alert(msg);
            }
        });*/
    });

});
