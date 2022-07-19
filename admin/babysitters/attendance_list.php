<style>
    .img-avatar {
        width: 45px;
        height: 45px;
        object-fit: cover;
        object-position: center center;
        border-radius: 100%;
    }
</style>

<?php


// require_once('../../config.php');
$id = isset($_GET['id']) ? $_GET['id'] : '';

if (isset($_GET['id'])) {
    $qry = $conn->query("SELECT * FROM `attendance` where id ='{$_GET['id']}' ");
    if ($qry->num_rows > 0) {
        $res = $qry->fetch_array();
        foreach ($res as $k => $v) {
            if (!is_numeric($k)) {
                $$k = $v;
            }
        }
    }
}

?>
<div class="card card-outline card-info rounded-0">
    <div class="card-header">
        <h3 class="card-title">Attendance List</h3>


        <?php if ($_settings->userdata('type') == 3) : ?>

            <div class="card-tools">
                <a href="./?page=babysitters/attendance_index" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-plus"></i> Add Attendance</a>
            </div>
        <?php endif; ?>


    </div>
    <div class="card-body">
        <div class="container-fluid">
            <div class="container-fluid">
                <div class="col-md-12 text-center">
                    <button type="button" class="btn btn-secondary" id="pdf">Export PDF</button>
                    <button type="button" class="btn btn-secondary" id="excel">Export Excel</button>
                    <button type="button" class="btn btn-secondary" id="csv">Export CSV</button>
                </div>
                <table id="mytable" class="table table-hover table-striped">
                    <!-- <colgroup>
					<col width="5%">
					<col width="10%">
					<col width="20%">
					<col width="20%">
					<col width="15%">
					<col width="15%">
					<col width="10%">
				</colgroup> -->
                    <thead>
                        <tr>
                            <!-- <th>#</th> -->


                            <th>Child Name</th>
                            <th>Child Code</th>
                            <th>Date</th>
                            <th>Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php

                        if ($_settings->userdata('type') == 1) :

                            $i = 1;
                            $qry = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, attendance.attendance_date, attendance.attendance_status
                        from attendance
                        inner join users on attendance.babysitter_id = users.id
                        inner join enrollment_list on enrollment_list.id = attendance.child_id");
                            while ($row = $qry->fetch_assoc()) :
                        ?>
                                <tr>
                                    <!-- <td class="text-center"><?php echo $i++; ?></td> -->

                                    <!-- <td><?php echo $row['id'] ?></td> -->
                                    <td><?php echo $row['child_fullname'] ?></td>
                                    <td><?php echo $row['code'] ?></td>
                                    <td><?php echo $row['attendance_date'] ?></td>
                                    <td><?php echo $row['attendance_status'] ?></td>





                                </tr>
                            <?php endwhile;     ?>

                        <?php endif; ?>


                        <?php
                        if ($_settings->userdata('type') == 3) :

                            $i = 1;
                            $qry = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, attendance.attendance_date, attendance.attendance_status
                        from attendance
                        inner join users on attendance.babysitter_id = users.id
                        inner join enrollment_list on enrollment_list.id = attendance.child_id
                        where attendance.babysitter_id ='" . $_SESSION['userdata']['id'] . "'");
                            while ($row = $qry->fetch_assoc()) :
                        ?>
                                <tr>
                                    <!-- <td class="text-center"><?php echo $i++; ?></td> -->

                                    <!-- <td><?php echo $row['id'] ?></td> -->
                                    <td><?php echo $row['child_fullname'] ?></td>
                                    <td><?php echo $row['code'] ?></td>
                                    <td><?php echo $row['attendance_date'] ?></td>
                                    <td><?php echo $row['attendance_status'] ?></td>






                                </tr>
                            <?php endwhile;   ?>

                        <?php endif; ?>


                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>


<!-- <script>
    $(document).ready(function() {
        var table = $('#example').DataTable({
            lengthChange: false,
            buttons: ['copy', 'excel', 'csv', 'pdf', 'colvis']
        });

        table.buttons().container()
            .appendTo('#example_wrapper .col-md-6:eq(0)');
    });
</script> -->


<script type="text/javascript">
    $(document).ready(function(e) {
        $("#pdf").click(function(e) {
            $("#mytable").tableExport({
                type: 'pdf',
                escape: 'false',
                pdfFontSize: 8

            });
        });

        var table = $('#mytable').DataTable({
            lengthChange: false,

        });
        // $('.table td,.table th').addClass('py-1 px-2 align-middle')
        // $('.table').dataTable({
        //     columnDefs: [{
        //         orderable: false,
        //         targets: 5
        //     }],
        // });

        $("#excel").click(function(e) {
            $("#mytable").tableExport({
                type: 'excel',
                escape: 'false',

            });
        });
        $("#csv").click(function(e) {
            $("#mytable").tableExport({
                type: 'excel',
                escape: 'false',

            });
        });
    });
</script>