// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//= require jquery_ujs
//= require summernote
//= require_self

$(function() {
    $('.carousel').carousel({
        interval: 5000 //changes the speed
    });

    $('.summernote').summernote({
        height: 400,
        minHeight: null,
        maxHeight: null
       
    });
    $('.activeMenu').click(function() { 
        var location = $(this).attr('href');
        window.location.href = location; return false;
    });

    $(".fancybox").fancybox({
        autoDimensions: true
    });

    $('.datePicker').datetimepicker({
        format: 'YYYY-MM-DD HH:mm'
    });

    $(document).on("click", ".redirectBack", function() {
        alert($(this).data("redirecturl"))
        window.location = $(this).data("redirecturl");
    })
})