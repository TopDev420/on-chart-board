<link href="<?php echo base_url("app/Modules/Report/Assets/Customer/daterangepicker/daterangepicker.css?v=r") ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/dataTables.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/responsive.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/buttons.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo base_url("app/Modules/Report/Assets/Customer/css/custom.css?v=r") ?>" rel="stylesheet">
<div class="ballance-content mt-4">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <div class="row align-items-end mb-4">
                    <div class="col-sm-12 content-title"><h4><?php echo display('trade') ?> <?php echo display('report') ?></h4></div>
                   <div class="col-md-2">
                        <label class="font-weight-600" for="from_date"><?php echo display('from_date'); ?> <i class="text-danger">*</i></label> 
                          <div class="start_date input-group">
                            <input class="form-control" type="text" name="from_date" id="from_date" placeholder="From Date" required="required" />
                            <div class="input-group-append">
                                <label for="from_date" class="mb-0">
                                  <span for="from_date" class="fa fa-calendar input-group-text start_date_calendar p-2 datePicker-icon" aria-hidden="true "></span>
                              </label>
                            </div>
                          </div>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="to_date"><?php echo display('to_date'); ?> <i class="text-danger">*</i></label>
                        <div class="end_date input-group">
                            <input class="form-control end_date" type="text" name="to_date" id="to_date" placeholder="To Date" required="required">
                            <div class="input-group-append">
                               <label for="to_date" class="mb-0">
                                    <span class="fa fa-calendar input-group-text end_date_calendar p-2 datePicker-icon" aria-hidden="true"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="trade_type"><?php echo display('trade_type'); ?></label>
                        <select name="trade_type" id="trade_type" class="form-control">
                            <option value=""><?php echo display('select_trade_type'); ?></option>
                            <option value="2"><?php echo display('open_trade'); ?></option>
                            <option value="1"><?php echo display('complete_trade'); ?></option>
                            <option value="0"><?php echo display('canceled_trade'); ?></option>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="to_date"><?php echo display('bid_type'); ?></label>
                        <select name="bid_type" id="bid_type" class="form-control">
                            <option value=""><?php echo display('select_bid_type'); ?></option>
                            <option value="BUY"><?php echo display('buy'); ?></option>
                            <option value="SELL"><?php echo display('sell'); ?></option>
                        </select>
                    </div>                    
                    <div class="col-md-2">
                        <label class="font-weight-600">&nbsp;</label>
                        <button class="btn btn-lg btn-success" id="submitButton"><?php echo display('submit'); ?></button>
                    </div>
                </div>
                
                <div class="table-responsive">
                   <div class="table-responsive">
                        <table id="tradeajaxtablehome" class="table table-bordered table-hover">
                            <thead>
                                <tr class="table-bg">
                                    <th><?php echo display('sl_no');?></th>
                                    <th><?php echo display('trade');?></th>
                                    <th><?php echo display('market');?></th>
                                    <th class="text-right"><?php echo display('rate');?></th>
                                    <th class="text-right"><?php echo display('required');?> <?php echo display('quantity');?></th>
                                    <th class="text-right"><?php echo display('available');?> <?php echo display('quantity');?></th>
                                    <th class="text-right"><?php echo display('required');?> <?php echo display('amount');?></th>
                                    <th class="text-right"><?php echo display('available');?> <?php echo display('amount');?></th>
                                    <th><?php echo display('open');?></th>
                                    <th><?php echo display('status');?></th>
                                </tr>
                            </thead>    
                            <tbody>

                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script type="text/javascript" src="https://unpkg.com/default-passive-events"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Customer/moment/moment.min.js?v=1") ?>" type="text/javascript"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Customer/daterangepicker/daterangepicker.js?v=1.0") ?>" type="text/javascript"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Customer/daterangepicker/daterangepicker.active.js?v=a") ?>" type="text/javascript"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/dataTables.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/dataTables.bootstrap4.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/dataTables.responsive.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/responsive.bootstrap4.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/dataTables.buttons.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/buttons.bootstrap4.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/jszip.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/pdfmake.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/vfs_fonts.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/buttons.html5.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/buttons.print.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/buttons.colVis.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/bootstrap4-toggle/js/bootstrap4-toggle.min.js' ?>"></script>
<!--Page Active Scripts(used by this page)-->

<script src="<?php echo BASEPATH.'/assets/plugins/datatables/data-bootstrap4.active.js?v=1' ?>"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Customer/js/custom.js?v=a") ?>" type="text/javascript"></script>
