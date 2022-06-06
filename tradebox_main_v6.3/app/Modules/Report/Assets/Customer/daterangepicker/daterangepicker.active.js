$(document).ready(function () {
    "use strict"; // Start of use strict

//Single Date Picker
    $('input[name="from_date"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'), 10),
        locale: {
            format: 'YYYY-MM-DD',
        }
    });
    
    $('input[name="to_date"]').daterangepicker({
        singleDatePicker: true,
        showDropdowns: true,
        minYear: 1901,
        maxYear: parseInt(moment().format('YYYY'), 10),
        locale: {
            format: 'YYYY-MM-DD',
        }
    });

//Predefined Date Ranges


//Input Initially Empty


});