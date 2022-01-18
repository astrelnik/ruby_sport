// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require turbolinks
//= require_tree .

$(document).ready(function(){
    $('#pagination .page').click(function(){
        $('.side-article, #pagination .page').removeClass('active');
        $('#article_'+($(this).data('id'))).addClass('active');
        $(this).addClass('active');
    });
    $('#pagination .arrow-left').click(function(){
        let current = parseInt($('#pagination .page.active').text());
        if(current == '1'){
            return;
        }
        $('#pagination .page').eq(current - 2).click();
    });
    $('#pagination .arrow-right').click(function(){
        let current = parseInt($('#pagination .page.active').text());

        if(current == $('#pagination .page').length){
            return;
        }
        $('#pagination .page').eq(current).click();
    });
    $('.filters select').change(function(){
        let route = ''
        if ($(this).val()) {
            route = $(this).val()+'/filter';
        }
        document.location.href = window.location.origin + '/' + $(this).data('locale') + '/articles/' + route;
    });
});
