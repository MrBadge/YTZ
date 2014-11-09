$(document).ready(function() {
	var task = {};
	var step = 1;

	$('#hint').editable({
        url: '',
        mode: 'popup',
        title: 'Enter hint',
        rows: 5
    });

    $(document).keydown(function(evt) {
        if (evt.keyCode == 32) {
            evt.preventDefault();
            var tmp = $('.editable-input textarea').val()
            $('.editable-input textarea').val(tmp + " ");
        }
    });

	$('#step2').click(function(event) {
		event.preventDefault();
		var tmp = $('#task')[0].contentEditable;
		if ($('#task')[0].textContent != ""){
			$('#task')[0].contentEditable = false;
			$(this).text('Done');
			step = 2;
		}
	});

    $('.editable').on('selectstart', function() {
        $(document).one('mouseup', function() {
        	if (this.getSelection() != "" && step == 2)
            	console.log(this.getSelection());
            	
        });
    });
});
