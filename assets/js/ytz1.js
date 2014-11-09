$(document).ready(function() {
    $("button.answer").click(function() {
        $this = $(this);
        if ($("#answers").hasClass('radio_group') && !$this.hasClass('fa-dot-circle-o')) {
            $("#answers").find('i').removeClass('fa-dot-circle-o').removeClass('fa-circle-o').addClass('fa-circle-o');
            //$("#answers").find('button').removeClass('btn-primary').removeClass('active').addClass('btn-default');
            $this.find('i').addClass('fa-dot-circle-o').removeClass('fa-circle-o');
            //$this.addClass('btn-primary').addClass('active');
        } 
        else if ($("#answers").hasClass('check_group')) {
            $i = $this.find('i');
            if ($i.hasClass('fa-circle-o')) {
                $i.removeClass('fa-circle-o').addClass('fa-check-circle-o');
            } else {
                $i.removeClass('fa-check-circle-o').addClass('fa-circle-o');
            }
            //$this.addClass('btn-default');
        }
    })
});
