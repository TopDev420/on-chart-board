<div class="row cryp_wrapper">
    <div class="col-sm-4">&nbsp;</div>
    <div class="col-sm-4 card">
        <div class="card-body">
            <div class="row">
                <div class="col-sm-12">
                    <div class="">
                        <div class="card-header text-center">  
                            <div class="card-header-menu">
                                <i class="fa fa-bars"></i>
                            </div>
                            <div class="user-header">
                                <div class="img-user">
                                     <img class="img-responsive" src="<?php echo $user->image?IMAGEPATH.$user->image:BASEPATH.'assets/images/icons/user.png' ?>" alt="Admin Image" >
                               </div><!-- img-user -->
                               <h6><?php echo esc($user->firstname." ".$user->lastname) ?></h6>
                            </div>
                        </div> 
                        <div class="card-content"> 
                            <div class="card-content-summary">
                                <p><?php echo htmlspecialchars_decode($user->about) ?></p>
                            </div>
                        </div> 
                        <div class="card-content"> 
                            <dl class="dl-horizontal">
                                <dt><?php echo display('email');?> </dt> <dd>: <?php echo esc($user->email) ?></dd>
                                <dt><?php echo display('ip_address');?> </dt> <dd>: <?php echo esc($user->ip_address) ?></dd>
                                <dt><?php echo display('last_login');?> </dt> <dd>: <?php echo esc($user->last_login) ?></dd>
                                <dt><?php echo display('last_logout');?> </dt> <dd>: <?php echo esc($user->last_logout) ?></dd>
                            </dl> 
                        </div> 
                    </div>
                </div>
            </div>
        </div> 
    </div>
    <div class="col-sm-4">&nbsp;</div>
</div>



