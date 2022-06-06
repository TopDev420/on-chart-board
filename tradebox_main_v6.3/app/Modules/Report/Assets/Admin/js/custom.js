$(document).ready(function() {
    "use strict";

    var inputdata = {};
        inputdata[BDTASK.csrf_token()] = BDTASK.csrf_hash();

    $.extend({
	    getValues: function(url) {
	        var result = null;
	        $.ajax({
	            url: BDTASK.getSiteAction('backend/get-company-info'),
		        type: "post",
		        data: inputdata,
		        dataType: "JSON",
	            async: false,
	            success: function(data) {
	                result = data;
	            }
	        });
	       return result;
	    }
	});

    var results = $.getValues();

    var companyName = results.title;
    var address 	= results.description;
    var email 		= results.email;
    var phone 		= results.phone;
    var logo 		= BDTASK.baseUrl() +"/public/"+results.logo;

    if($('#tradeajaxtable').length){

	    var mydatatableunpaid = $('#tradeajaxtable').DataTable({
	        responsive: true,
	        dom: "<'row'<'col-md-6'B><'col-md-6'f>>rt<'bottom'ip><'clear'>",
	        "aaSorting": [
	            [1, "desc"]
	        ],
	        "columnDefs": [{
	                "bSortable": false,
	                "aTargets": [0, 2, 3, 4, 5, 6, 7, 8, 9]
	            },

	        ],
	        'processing': true,
	        'serverSide': true,
	        'bPaginate' :false,


	        'lengthMenu': false,

	        buttons: [{
	                extend: 'copyHtml5',
	                text: '<i class="far fa-copy"></i>',
	                titleAttr: 'Copy',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	                },
	                title: "Trade History",
	                className: 'btn btn-success'
	            },
	            {
	                extend: 'excelHtml5',
	                text: '<i class="far fa-file-excel"></i>',
	                titleAttr: 'Excel',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	                },
	                title: "Trade History",
	                className: ' btn btn-primary'
	            },
	            {
	                extend: 'csvHtml5',
	                text: '<i class="far fa-file-alt"></i>',
	                titleAttr: 'CSV',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	                },
	                title: "Trade History",
	                className: 'btn btn-warning'
	            },
	            {
	                extend: 'pdfHtml5',
	                text: '<i class="far fa-file-pdf"></i>',
	                titleAttr: 'PDF',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
	                },
	                title: "Trade History",
	                className: 'btn btn-danger'
	            },
	            {
	                extend: 'print',
	                text: '<i class="fa fa-print" aria-hidden="true"></i>',
	                titleAttr: 'Print',
	                title: "<div style='display: flex;align-items: top;justify-content: space-between; color:#000;'><span style='font-size:12px;margin-top: 15px; text-align:left; width:50%;'><b>Name: </b>"+companyName+"<br> <b>Phone: </b>"+phone+"<br> <b>Email:</b> "+email+"<br> <b>Address: </b>"+address+"</span>"+"<span style='font-size:20px; margin: 0; text-align:right; top:0; width:50%;'><b>Trade History</b><br>"+"From : "+$('#from_date').val()+" <b>To</b> "+$('#to_date').val()+"</span></div>",
	                className: 'btn-success',
	                customize: function ( win ) {
	                    $(win.document.body)
	                        .css( 'font-size', '10pt' )
	                        .prepend(
	                            '<img src='+logo+' style="position:absolute; top:0; left:0; width:150px;" /><br>'
	                        );
	 
	                    $(win.document.body).find( 'table' )
	                        .addClass( 'compact' )
	                        .css( 'font-size', 'inherit' );
	                }
	            },
	        ],
	        'serverMethod': 'post',
	        'ajax': {
	            'url':BDTASK.getSiteAction('backend/report/getreport-data'),
	            "data": function(data) {
	                data.from_date = $('#from_date').val();
	                data.to_date   = $('#to_date').val();
	                data.csrf_test_name = BDTASK.csrf_hash();
	                data.trade_type = $('#trade_type option:selected').val();
	                data.bid_type = $('#bid_type option:selected').val();
	            },
	        },
	        'columns': [{
	                data: 'sl', class: 'text-center'
	            },
	            {
	                data: 'bid_type'
	            },
	            {
	                data: 'market_symbol'
	            },
	            {
	                data: 'bid_price',  class: 'text-right'
	            },
	            {
	                data: 'bid_qty',  class: 'text-right'
	            },
	             {
	                data: 'bid_qty_available',  class: 'text-right'
	            },
	            {
	                data: 'total_amount',  class: 'text-right'
	            },
	            {
	                data: 'amount_available',  class: 'text-right'
	            },
	            {
	                data: 'open_order'
	            },
	            {
	                data: 'status'
	            },
	        ],

	    });

	    $("#submitButton").on('click', function(e) {
	        mydatatableunpaid.ajax.reload();
	    });
	}

 	if($('#depositreportajaxtable').length)
 	{

	    var depositreportajaxtable = $('#depositreportajaxtable').DataTable({
	        responsive: true,
	        dom: "<'row'<'col-md-6'B><'col-md-6'f>>rt<'bottom'ip><'clear'>",
	        "aaSorting": [
	            [1, "desc"]
	        ],
	        "columnDefs": [{
	                "bSortable": false,
	                "aTargets": [0, 2, 3, 4, 5, 6, 7]
	            },

	        ],
	        'processing': true,
	        'serverSide': true,
	        'bPaginate' :false,


	        'lengthMenu': false,

	        buttons: [{
	                extend: 'copyHtml5',
	                text: '<i class="far fa-copy"></i>',
	                titleAttr: 'Copy',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7]
	                },
	                title: "Deposit History",
	                className: 'btn btn-success'
	            },
	            {
	                extend: 'excelHtml5',
	                text: '<i class="far fa-file-excel"></i>',
	                titleAttr: 'Excel',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7]
	                },
	                title: "Deposit History",
	                className: ' btn btn-primary'
	            },
	            {
	                extend: 'csvHtml5',
	                text: '<i class="far fa-file-alt"></i>',
	                titleAttr: 'CSV',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7]
	                },
	                title: "Deposit History",
	                className: 'btn btn-warning'
	            },
	            {
	                extend: 'pdfHtml5',
	                text: '<i class="far fa-file-pdf"></i>',
	                titleAttr: 'PDF',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7]
	                },
	                title: "Deposit History",
	                className: 'btn btn-danger'
	            },
	            {
	                extend: 'print',
	                text: '<i class="fa fa-print" aria-hidden="true"></i>',
	                titleAttr: 'Print',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6, 7]
	                },
	                title: "<div style='display: flex;align-items: top;justify-content: space-between; color:#000;'><span style='font-size:12px;margin-top: 15px; text-align:left; width:50%;'><b>Name: </b>"+companyName+"<br> <b>Phone: </b>"+phone+"<br> <b>Email:</b> "+email+"<br> <b>Address: </b>"+address+"</span>"+"<span style='font-size:20px; margin: 0; text-align:right; top:0; width:50%;'><b>Deposit History</b><br>"+"From : "+$('#from_date').val()+" <b>To</b> "+$('#to_date').val()+"</span></div>",
	                className: 'btn-success',
	                customize: function ( win ) {
	                    $(win.document.body)
	                        .css( 'font-size', '10pt' )
	                        .prepend(
	                            '<img src='+logo+' style="position:absolute; top:0; left:0; width:150px;" /><br>'
	                        );
	 
	                    $(win.document.body).find( 'table' )
	                        .addClass( 'compact' )
	                        .css( 'font-size', 'inherit' );
	                }
	            },
	        ],
	        'serverMethod': 'post',
	        'ajax': {
	            'url':BDTASK.getSiteAction('backend/report/getdeposit-data'),
	            "data": function(data) {
	                data.from_date 		= $('#from_date').val();
	                data.to_date   		= $('#to_date').val();
	                data.csrf_test_name = BDTASK.csrf_hash();
	                data.coin_symbol 	= $('#coin_symbol option:selected').val();
	                data.statusVal 		= $('#status option:selected').val();
	            },
	        },
	        'columns': [{
	                data: 'sl', class: 'text-center'
	            },
	            {
	                data: 'deposit_date'
	            },
	            {
	                data: 'user_id'
	            },
	            {
	                data: 'method_id'
	            },
	            {
	                data: 'currency_symbol'
	            },
	            {
	                data: 'amount', class: 'total_amount text-right'
	            },
	            {
	                data: 'fees_amount', class: 'total_fees text-right'
	            },
	            {
	                data: 'status', class: 'text-center'
	            },

	        ],

	        "footerCallback": function(row, data, start, end, display) {
	            var api = this.api();
	            api.columns('.total_amount', {
	                page: 'current'
	            }).every(function() {
	                var sum = this
	                    .data()
	                    .reduce(function(a, b) {
	                        var x = parseFloat(a);
	                        var y = parseFloat(b);
	                        return x + y;
	                    }, 0);
	                $(this.footer()).html(sum.toLocaleString(undefined, {
	                    minimumFractionDigits: 8,
	                    maximumFractionDigits: 8
	                }));
	            });

	            api.columns('.total_fees', {
	                page: 'current'
	            }).every(function() {
	                var sum = this
	                    .data()
	                    .reduce(function(a, b) {
	                        var x = parseFloat(a);
	                        var y = parseFloat(b);
	                        return x + y;
	                    }, 0);
	                $(this.footer()).html(sum.toLocaleString(undefined, {
	                    minimumFractionDigits: 8,
	                    maximumFractionDigits: 8
	                }));
	            });
	        },


	    });

	    $("#submitDeposit").on('click', function(e) {
	        depositreportajaxtable.ajax.reload();
	    });
	}

	if($('#withdrawreportajaxtable').length)
 	{
	    var withdrawreportajaxtable = $('#withdrawreportajaxtable').DataTable({
	        responsive: true,
	        dom: "<'row'<'col-md-6'B><'col-md-6'f>>rt<'bottom'ip><'clear'>",
	        "aaSorting": [
	            [1, "desc"]
	        ],
	        "columnDefs": [{
	                "bSortable": false,
	                "aTargets": [0, 2, 3, 4, 5, 6, 7, 8]
	            },

	        ],
	        'processing': true,
	        'serverSide': true,
	        'bPaginate' :false,


	        'lengthMenu': false,

	        buttons: [{
	                extend: 'copyHtml5',
	                text: '<i class="far fa-copy"></i>',
	                titleAttr: 'Copy',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6]
	                },
	                title: "Withdraw History",
	                className: 'btn btn-success'
	            },
	            {
	                extend: 'excelHtml5',
	                text: '<i class="far fa-file-excel"></i>',
	                titleAttr: 'Excel',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6]
	                },
	                title: "Withdraw History",
	                className: ' btn btn-primary'
	            },
	            {
	                extend: 'csvHtml5',
	                text: '<i class="far fa-file-alt"></i>',
	                titleAttr: 'CSV',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6]
	                },
	                title: "Withdraw History",
	                className: 'btn btn-warning'
	            },
	            {
	                extend: 'pdfHtml5',
	                text: '<i class="far fa-file-pdf"></i>',
	                titleAttr: 'PDF',
	                exportOptions: {
	                    columns: [0, 1, 2, 3, 4, 5, 6]
	                },
	                title: "Withdraw History",
	                className: 'btn btn-danger'
	            },
	            {
	                extend: 'print',
	                text: '<i class="fa fa-print" aria-hidden="true"></i>',
	                titleAttr: 'Print',
	                title: "<div style='display: flex;align-items: top;justify-content: space-between; color:#000;'><span style='font-size:12px;margin-top: 15px; text-align:left; width:50%;'><b>Name: </b>"+companyName+"<br> <b>Phone: </b>"+phone+"<br> <b>Email:</b> "+email+"<br> <b>Address: </b>"+address+"</span>"+"<span style='font-size:20px; margin: 0; text-align:right; top:0; width:50%;'><b>Withdraw History</b><br>"+"From : "+$('#from_date').val()+" <b>To</b> "+$('#to_date').val()+"</span></div>",
	                className: 'btn-success',
	                customize: function ( win ) {
	                    $(win.document.body)
	                        .css( 'font-size', '10pt' )
	                        .prepend(
	                            '<img src='+logo+' style="position:absolute; top:0; left:0; width:150px;" /><br>'
	                        );
	 
	                    $(win.document.body).find( 'table' )
	                        .addClass( 'compact' )
	                        .css( 'font-size', 'inherit' );
	                }
	            },
	        ],
	        'serverMethod': 'post',
	        'ajax': {
	            'url':BDTASK.getSiteAction('backend/report/getwithdraw-data'),
	            "data": function(data) {
	                data.from_date 		= $('#from_date').val();
	                data.to_date   		= $('#to_date').val();
	                data.csrf_test_name = BDTASK.csrf_hash();
	                data.coin_symbol 	= $('#coin_symbol option:selected').val();
	                data.statusVal 		= $('#status option:selected').val();
	            },
	        },
	        'columns': [{
	                data: 'sl', class: 'text-center'
	            },
	            {
	                data: 'success_date'
	            },
	            {
	                data: 'user_id'
	            },
	            {
	                data: 'wallet_id'
	            },
	            {
	                data: 'comment'
	            },
	            {
	                data: 'method'
	            },
	            {
	                data: 'currency_symbol'
	            },
	            {
	                data: 'amount', class: 'total_amount text-right'
	            },
	            {
	                data: 'fees_amount',  class: 'total_fees text-right'
	            },
	            {
	                data: 'status', class: 'text-center'
	            },

	        ],

	        "footerCallback": function(row, data, start, end, display) {
	            var api = this.api();
	            api.columns('.total_amount', {
	                page: 'current'
	            }).every(function() {
	                var sum = this
	                    .data()
	                    .reduce(function(a, b) {
	                        var x = parseFloat(a);
	                        var y = parseFloat(b);
	                        return x + y;
	                    }, 0);
	                $(this.footer()).html(sum.toLocaleString(undefined, {
	                    minimumFractionDigits: 8,
	                    maximumFractionDigits: 8
	                }));
	            });

	            api.columns('.total_fees', {
	                page: 'current'
	            }).every(function() {
	                var sum = this
	                    .data()
	                    .reduce(function(a, b) {
	                        var x = parseFloat(a);
	                        var y = parseFloat(b);
	                        return x + y;
	                    }, 0);
	                $(this.footer()).html(sum.toLocaleString(undefined, {
	                    minimumFractionDigits: 8,
	                    maximumFractionDigits: 8
	                }));
	            });
	        },


	    });

	    $("#submitWithdraw").on('click', function(e) {
	        withdrawreportajaxtable.ajax.reload();
	    });
	}

});
