$(document).ready(function() {
    $(function () {
        $.datetimeEntry.setDefaults({spinnerImage: 'spinnerDefault.png'});
        $('#defaultEntry').datetimeEntry();
        $('#dateEntry').datetimeEntry({datetimeFormat: 'O/D/Y'});
        $('#timeEntry').datetimeEntry({datetimeFormat: 'H:Ma'});
    });
});