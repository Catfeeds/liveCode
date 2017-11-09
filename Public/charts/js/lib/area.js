$(function(){
    $(".nav li:eq(2)").addClass("active");

    $('tbody a').click(function(){
        var tds = $(this).parents('tr').find('td');
        var parms = '/pv/' + tds[1].innerHTML+'/uv/' + tds[2].innerHTML;
        $(this).attr('href' , $(this).attr('href') + parms);
    });
});