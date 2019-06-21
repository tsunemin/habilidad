$(function () {
    var birthed_on;
    if ($('#birthed_on').val() != '') {
        birthed_on = new Date($('#birthed_on').val());
    }
    $('#birthed_on').val('');
    $('#birthed_on').datetimepicker({
        format: 'YYYY-MM-DD'
    });
    if (birthed_on != null) {
        $('#birthed_on').val(dateFormat.format(birthed_on, 'yyyy-MM-dd'));
    }

    $('#last_name_roman').blur(function () {
        $(this).val($(this).val().toUpperCase());
    });
    $('#first_name_roman').blur(function () {
        $(this).val($(this).val().toUpperCase());
    });
});