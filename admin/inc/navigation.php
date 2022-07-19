</style>
<!-- Main Sidebar Container -->
<aside class="main-sidebar sidebar-dark-primary elevation-4 sidebar-no-expand bg-gradient-dark">
  <!-- Brand Logo -->
  <a href="<?php echo base_url ?>admin" class="brand-link bg-transparent text-sm shadow-sm">
    <img src="<?php echo validate_image($_settings->info('logo')) ?>" alt="Store Logo" class="brand-image img-circle elevation-3 bg-black" style="width: 1.8rem;height: 1.8rem;max-height: unset;object-fit:scale-down;object-position:center center">
    <span class="brand-text font-weight-light"><?php echo $_settings->info('short_name') ?></span>
  </a>
  <!-- Sidebar -->
  <div class="sidebar os-host os-theme-light os-host-overflow os-host-overflow-y os-host-resize-disabled os-host-transition os-host-scrollbar-horizontal-hidden">
    <div class="os-resize-observer-host observed">
      <div class="os-resize-observer" style="left: 0px; right: auto;"></div>
    </div>
    <div class="os-size-auto-observer observed" style="height: calc(100% + 1px); float: left;">
      <div class="os-resize-observer"></div>
    </div>
    <div class="os-content-glue" style="margin: 0px -8px; width: 249px; height: 646px;"></div>
    <div class="os-padding">
      <div class="os-viewport os-viewport-native-scrollbars-invisible" style="overflow-y: scroll;">
        <div class="os-content" style="padding: 0px 8px; height: 100%; width: 100%;">
          <!-- Sidebar user panel (optional) -->
          <div class="clearfix"></div>
          <!-- Sidebar Menu -->
          <nav class="mt-4">
            <ul class="nav nav-pills nav-sidebar flex-column text-sm nav-compact nav-flat nav-child-indent nav-collapse-hide-child" data-widget="treeview" role="menu" data-accordion="false">
              <li class="nav-item dropdown">
                <a href="./" class="nav-link nav-home">
                  <i class="nav-icon fas fa-tachometer-alt"></i>
                  <p>
                    Dashboard
                  </p>
                </a>
              </li>
              <!-- <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=enrollment" class="nav-link nav-enrollment">
                  <i class="nav-icon fas fa-file-alt"></i>
                  <p>
                    Enrollment List
                  </p>
                </a>
              </li> -->


              <!-- <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-item">
                  <a href="<?php echo base_url ?>admin/?page=babysitters" class="nav-link nav-babysitters">
                    <i class="nav-icon fas fa-users"></i>
                    <p>
                      Babysitter List
                    </p>
                  </a>
                </li>
              <?php endif; ?> -->
              <!-----================================ Added By Developer================================----->
              <!-- <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-item">
                  <a href="<?php echo base_url ?>admin/?page=babysitters/assign_enroll" class="nav-link nav-assign_enroll">
                    <i class="nav-icon fas fa-users"></i>
                    <p>
                      Enroll Babysitter
                    </p>
                  </a>
                </li>

              <?php endif; ?>

              <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=babysitters/assign_enroll_list" class="nav-link nav-assign_enroll_list">
                  <i class="nav-icon fas fa-users"></i>
                  <p>
                    Babysitter Enrollment List
                  </p>
                </a>
              </li> -->
              <!-----================================ Added By Developer================================----->
              <?php if ($_settings->userdata('type') == 3) : ?>
                <li class="nav-item">
                  <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_index" class="nav-link nav-attendance">
                    <i class="nav-icon fas fa-users"></i>
                    <p>
                      Add Attendance
                    </p>
                  </a>
                </li>
              <?php endif; ?>
              <!-----================================ Added By Developer================================----->
              <!-- <li class="nav-item">
                <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_list" class="nav-link nav-attendance">
                  <i class="nav-icon fas fa-users"></i>
                  <p>
                    Attendance List
                  </p>
                </a>
              </li> -->
              <!-----================================ Added By Developer Collapsible  Child Management================================----->

              <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-item menu-is-opening menu-open">
                  <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-chart-pie"></i>
                    <p>
                      Child Management
                      <i class="right fas fa-angle-left"></i>
                    </p>
                  </a>
                  <ul class="nav nav-treeview" style="display: block;">
                    <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=enrollment" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Child list</p>
                      </a>
                    </li>

                  </ul>
                </li>
              <?php endif; ?>
              <!-----================================ Added By Developer================================----->


        <!-----================================ Added By Developer Collapsible  Babysitter Management================================----->

              <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-item menu-is-opening menu-open">
                  <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-chart-pie"></i>
                    <p>
                      Babysitter Management
                      <i class="right fas fa-angle-left"></i>
                    </p>
                  </a>
                  <ul class="nav nav-treeview" style="display: block;">
                    <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=babysitters" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Babysitter list</p>
                      </a>
                    </li>

                  </ul>
                </li>
              <?php endif; ?>
              <!-----================================ Added By Developer================================----->


              <!-----================================ Added By Developer Enrollment Management================================----->

              <?php if ($_settings->userdata('type') == 1) : ?>

                <li class="nav-item menu-is-opening menu-open">
                  <a href="#" class="nav-link">
                    <i class="nav-icon fas fa-chart-pie"></i>
                    <p>
                      Enrollment Management
                      <i class="right fas fa-angle-left"></i>
                    </p>
                  </a>
                  <ul class="nav nav-treeview" style="display: block;">
                    <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=babysitters/assign_enroll" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Add Enrollment</p>
                      </a>
                    </li>
                    <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=babysitters/assign_enroll_list" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Enrollment list</p>
                      </a>
                    </li>

                  </ul>
                </li>
              <?php endif; ?>
              <!-----================================ Added By Developer================================----->




              <!-----================================ Added By Developer Attendance Management================================----->
              <li class="nav-item menu-is-opening menu-open">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-chart-pie"></i>
                  <p>
                    Attendance Management
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview" style="display: block;">

                  <?php if ($_settings->userdata('type') == 3) : ?>
                    <li class="nav-item">
                      <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_index" class="nav-link">
                        <i class="far fa-circle nav-icon"></i>
                        <p>Add Attendance</p>
                      </a>
                    </li>
                  <?php endif; ?>
                  <li class="nav-item">
                    <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_list" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Attendance list</p>
                    </a>
                  </li>


                </ul>
              </li>


              <!-----================================ Added By Developer Reports Management================================----->
              <li class="nav-item menu-is-opening menu-open">
                <a href="#" class="nav-link">
                  <i class="nav-icon fas fa-chart-pie"></i>
                  <p>
                    Reports
                    <i class="right fas fa-angle-left"></i>
                  </p>
                </a>
                <ul class="nav nav-treeview" style="display: block;">
                  <li class="nav-item">
                    <a href="<?php echo base_url ?>admin/?page=babysitters/enrollment_report" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Enrollment Report</p>
                    </a>
                  </li>
                  <li class="nav-item">
                    <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_list" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Attendance Report</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="<?php echo base_url ?>admin/?page=babysitters/attendance_report" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Daily Enrollment Report</p>
                    </a>
                  </li>

                  <li class="nav-item">
                    <a href="pages/charts/flot.html" class="nav-link">
                      <i class="far fa-circle nav-icon"></i>
                      <p>Monthly Report</p>
                    </a>
                  </li>


                </ul>
              </li>
              <!-----================================ Added By Developer================================----->


              <!-----================================ Added By Developer================================----->

              <?php if ($_settings->userdata('type') == 1) : ?>
                <li class="nav-header">Maintenance</li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=services" class="nav-link nav-services">
                    <i class="nav-icon fas fa-th-list"></i>
                    <p>
                      Services List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=user/list" class="nav-link nav-user_list">
                    <i class="nav-icon fas fa-users-cog"></i>
                    <p>
                      User List
                    </p>
                  </a>
                </li>
                <li class="nav-item dropdown">
                  <a href="<?php echo base_url ?>admin/?page=system_info" class="nav-link nav-system_info">
                    <i class="nav-icon fas fa-cogs"></i>
                    <p>
                      Settings
                    </p>
                  </a>
                </li>
              <?php endif; ?>

            </ul>
          </nav>
          <!-- /.sidebar-menu -->
        </div>
      </div>
    </div>
    <div class="os-scrollbar os-scrollbar-horizontal os-scrollbar-unusable os-scrollbar-auto-hidden">
      <div class="os-scrollbar-track">
        <div class="os-scrollbar-handle" style="width: 100%; transform: translate(0px, 0px);"></div>
      </div>
    </div>
    <div class="os-scrollbar os-scrollbar-vertical os-scrollbar-auto-hidden">
      <div class="os-scrollbar-track">
        <div class="os-scrollbar-handle" style="height: 55.017%; transform: translate(0px, 0px);"></div>
      </div>
    </div>
    <div class="os-scrollbar-corner"></div>
  </div>
  <!-- /.sidebar -->
</aside>
<script>
  var page;
  $(document).ready(function() {
    page = '<?php echo isset($_GET['page']) ? $_GET['page'] : 'home' ?>';
    page = page.replace(/\//gi, '_');

    if ($('.nav-link.nav-' + page).length > 0) {
      $('.nav-link.nav-' + page).addClass('active')
      if ($('.nav-link.nav-' + page).hasClass('tree-item') == true) {
        $('.nav-link.nav-' + page).closest('.nav-treeview').siblings('a').addClass('active')
        $('.nav-link.nav-' + page).closest('.nav-treeview').parent().addClass('menu-open')
      }
      if ($('.nav-link.nav-' + page).hasClass('nav-is-tree') == true) {
        $('.nav-link.nav-' + page).parent().addClass('menu-open')
      }

    }

    $('#receive-nav').click(function() {
      $('#uni_modal').on('shown.bs.modal', function() {
        $('#find-transaction [name="tracking_code"]').focus();
      })
      uni_modal("Enter Tracking Number", "transaction/find_transaction.php");
    })
  })
</script>