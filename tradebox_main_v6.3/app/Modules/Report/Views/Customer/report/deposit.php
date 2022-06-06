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
                    <div class="col-sm-12 content-title"><h4><?php echo display('deposit') ?> <?php echo display('report') ?></h4></div>
                   <div class="col-md-2">
                        <label class="font-weight-600" for="from_date"><?php echo display('from_date'); ?> <i class="text-danger">*</i></label> 
                          <div class="start_date input-group">
                            <input class="form-control" type="text" name="from_date" id="from_date" placeholder="From Date" required="required"/>
                            <div class="input-group-append">
                                <label for="from_date" class="mb-0">
                                  <span class="fa fa-calendar input-group-text start_date_calendar p-2 datePicker-icon" aria-hidden="true"></span>
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
                        <label class="font-weight-600" for="coin_symbol"><?php echo display('coins'); ?></label>
                        <select name="coin_symbol" id="coin_symbol" class="form-control basic-single cheight">
                            <option value=""><?php echo display('select_coin'); ?></option>
                            <?php 
                                if($coin_pairs) {
                                    foreach ($coin_pairs as $key => $v) {
                            ?>

                                <option value="<?php echo $v->symbol; ?>"><?php echo $v->coin_name ?> (<?php echo $v->symbol; ?>)</option>

                            <?php } } ?>
                        </select>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="status"><?php echo display('status'); ?></label>
                        <select name="status" id="status" class="form-control cheight">
                            <option value=""><?php echo display('select_status'); ?></option>
                            <option value="1"><?php echo display('success'); ?></option>
                            <option value="0"><?php echo display('pending'); ?></option>
                            <option value="2"><?php echo display('canceled'); ?></option>
                        </select>
                    </div> 
                    <div class="col-md-2">
                        <label class="font-weight-600">&nbsp;</label>
                        <button class="btn btn-lg btn-success" id="submitDeposit"><?php echo display('submit'); ?></button>
                    </div>
                </div>
                <!-- /.end of alert message -->
                <div class="table-responsive">
                   <div class="table-responsive">
                        <table id="depositreportajaxtablehome" class="table table-bordered table-hover">
                        <thead>
                            <tr> 
                                <th><?php echo display('sl_no') ?></th>
                                <th><?php echo display('date') ?></th>
                                <th><?php echo display('payment_method') ?></th>
                                <th><?php echo display('currency') ?>/<?php echo display('coin') ?></th>
                                <th class="text-right"><?php echo display('amount') ?></th>
                                <th class="text-right"><?php echo display('fees') ?></th>
                                <th class="text-center"><?php echo display('status'); ?></th>
                            </tr>
                        </thead>    
                        <tbody>

                        </tbody>
                        <tfoot>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th></th>
                            <th><?php echo display('total'); ?></th>
                            <th></th>
                            <th></th>
                        </tfoot>
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