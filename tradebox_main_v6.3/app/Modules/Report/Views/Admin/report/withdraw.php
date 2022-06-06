<link href="<?php echo base_url("app/Modules/Report/Assets/Admin/daterangepicker/daterangepicker.css?v=r") ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/dataTables.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/responsive.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo BASEPATH.'assets/plugins/datatables/buttons.bootstrap4.min.css' ?>" rel="stylesheet">
<link href="<?php echo base_url("app/Modules/Report/Assets/Admin/css/custom.css?v=r") ?>" rel="stylesheet">
<div class="row">
    <div class="col-sm-12 col-md-12">
        <div class="card">
            <div class="card-header">
                <div class="row align-items-end">
                    <div class="col-md-2">
                        <label class="font-weight-600" for="from_date"><?php echo display('from_date'); ?> <i class="text-danger">*</i></label> 
                          <div class="start_date input-group">
                            <input class="form-control" type="text" name="from_date" id="from_date" placeholder="From Date" required="required"/>
                            <div class="input-group-append">
                                <label for="from_date"  class="mb-0">
                                  <span class="fa fa-calendar input-group-text start_date_calendar sapnP11" aria-hidden="true"></span>
                              </label>
                            </div>
                          </div>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="to_date"><?php echo display('to_date'); ?> <i class="text-danger">*</i></label>
                        <div class="end_date input-group">
                            <input class="form-control end_date" type="text" name="to_date" id="to_date" placeholder="To Date" required="required">
                            <div class="input-group-append">
                                <label for="to_date"  class="mb-0">
                                    <span class="fa fa-calendar input-group-text end_date_calendar sapnP11" aria-hidden="true"></span>
                                </label>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2">
                        <label class="font-weight-600" for="coin_symbol"><?php echo display('coins'); ?></label>
                       
                        <select name="coin_symbol" id="coin_symbol" class="form-control basic-single">
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
                        <select name="status" id="status" class="form-control basic-single">
                            <option value=""><?php echo display('select_status'); ?>Sele</option>
                            <option value="1"><?php echo display('success'); ?></option>
                            <option value="2"><?php echo display('pending'); ?></option>
                            <option value="0"><?php echo display('canceled'); ?></option>
                        </select>
                    </div> 
                    <div class="col-md-2">
                        <button class="btn btn-lg btn-success" id="submitWithdraw"><?php echo display('submit'); ?></button>
                    </div>
                </div>
            </div>

            <div class="card-body">
                <div class="table-responsive">
                    <table id="withdrawreportajaxtable" class="table table-bordered table-hover">
                        <thead>
                            <tr>
                                <th><?php echo display('sl_no') ?></th>
                                <th><?php echo display('date') ?></th>
                                <th><?php echo display('user_id') ?></th>
                                <th><?php echo display('wallet_id') ?></th>
                                <th><?php echo display('comment'); ?></th>
                                <th><?php echo display('payment_method') ?></th>
                                <th><?php echo display('symbol') ?></th>
                                <th><?php echo display('amount') ?></th>
                                <th><?php echo display('fees') ?></th>
                                <th class="text-center"><?php echo display('status') ?></th>
                            </tr>
                        </thead>    
                        <tbody>

                        </tbody>
                        <tfoot>
                            <th colspan="7" class="text-right"><?php echo display('total') ?></th>
                            <th></th>
                            <th></th>
                            <th></th>
                        </tfoot>
                    </table>
                </div>
            </div> 
        </div>
    </div>
</div>
<script src="<?php echo base_url("app/Modules/Report/Assets/Admin/moment/moment.min.js?v=r") ?>" type="text/javascript"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Admin/daterangepicker/daterangepicker.js?v=a") ?>" type="text/javascript"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Admin/daterangepicker/daterangepicker.active.js?v=a") ?>" type="text/javascript"></script>
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

<script src="<?php echo BASEPATH.'/assets/plugins/select2/dist/js/select2.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/dist/js/pages/demo.select2.js' ?>"></script>
<!--Page Active Scripts(used by this page)-->
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/data-bootstrap4.active.js' ?>"></script>
<script src="<?php echo base_url("app/Modules/Report/Assets/Admin/js/custom.js?v=r") ?>" type="text/javascript"></script>