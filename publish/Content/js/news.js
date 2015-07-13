function pad(num, size) {
    var s = num + "";
    while (s.length < size) s = "0" + s;
    return s;
}

var firstClick = false;
function enableSpecificDates(date) {
    if (typeof (valueDays) == "undefined" || valueDays.length <= 0) return false;

    var month = pad(date.getMonth() + 1, 2);
    var day = pad(date.getDate(), 2);
    var year = date.getFullYear();

    for (i = 0; i < valueDays.length; i++) {
        if ($.inArray(day + '.' + month + '.' + year, valueDays) != -1) {
            return [true];
        }
    }
    return [false];
}
function fixCurDay() {
    if(!firstClick) {
        $(".archive .datepicker").find('a').removeClass('ui-state-active');
        $(".archive .datepicker").find('.ui-datepicker-current-day').removeClass('ui-datepicker-current-day');
        $(".archive .datepicker").find('.ui-datepicker-days-cell-over').removeClass('ui-datepicker-days-cell-over');
    }
}

$(function () {

    if (typeof (valueDays) != "undefined" && valueDays.length > 0) {
        $(".archive .datepicker").datepicker({
            beforeShowDay: enableSpecificDates,
            minDate: valueDays[0],
            maxDate: valueDays[valueDays.length - 1],
            dateFormat: 'dd.mm.yy',
            numberOfMonths: 1,
            showOtherMonths: false,
            onSelect: function (dateText, inst) {
                firstClick = true;
                var date = $(this).datepicker("getDate");
                var month = pad(date.getMonth() + 1, 2);
                var day = pad(date.getDate(), 2);
                window.location.href = '/News/Archive/' + date.getFullYear() + '/' + month + '/' + day + '/';
            },
            onChangeMonthYear: function (year, month, inst) {
                fixCurDay();
            }
        });

        fixCurDay();
    }
});