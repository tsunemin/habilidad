$(function () {
    $('#clients_nav').addClass('active');
});

$(function () {
    $('#created_at_gteq').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:SS'
    });
    $('#created_at_lteq').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:SS'
    });
    $('#updated_at_gteq').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:SS'
    });
    $('#updated_at_lteq').datetimepicker({
        format: 'YYYY-MM-DD HH:mm:SS'
    });
});

$('.btn-clear').click(function () {
    $('input').val('');
});