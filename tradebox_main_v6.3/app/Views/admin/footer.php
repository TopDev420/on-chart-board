</div>
</div>
<footer class="footer-content">
    <div class="footer-text d-flex align-items-center justify-content-between">
        <div class="copy"><?php echo $settings->footer_text; ?></div>
        <div class="credit">Designed by: <a href="www.bdtask.com">Bdtask</a></div>
    </div>
</footer>
<!--/.footer content-->
<div class="overlay"></div>
<!--Global script(used by all pages)-->
<?php 
    $request  = \Config\Services::request();
    $segment3 = $request->uri->setSilent()->getSegment(3);
?>
<!--Global script(used by all pages)-->
<script src="<?php echo BASEPATH.'/assets/plugins/metisMenu/metisMenu.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/dist/js/sidebar.js?v=1.0' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/dist/js/popper.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/bootstrap/js/bootstrap.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/plugins/perfect-scrollbar/dist/perfect-scrollbar.min.js' ?>"></script>

<!-- Third Party Scripts(used by this page)-->
<?php if($segment3 != 'dashboard'){?>
<script src="<?php echo BASEPATH.'/assets/plugins/chartJs/Chart.min.js' ?>"></script>
<script src="<?php echo BASEPATH.'/assets/dist/js/pages/dashboard.js?v=2' ?>"></script>
<?php } ?>

<!--Page Active Scripts(used by this page)-->
<!--Page Scripts(used by all page)-->
<!-- Third Party Scripts(used by this page)-->
<?php if($segment3 != ''){?>
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
<script src="<?php echo BASEPATH.'/assets/plugins/datatables/data-bootstrap4.active.js' ?>"></script>
<?php } ?>
<!--Page Scripts(used by all page)-->
<script src="<?php echo BASEPATH.'/assets/js/custom-new.js' ?>" type="text/javascript"></script>



</div>
</div>
</body>

</html>