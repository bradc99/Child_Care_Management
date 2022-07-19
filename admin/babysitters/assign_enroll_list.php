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
    $qry = $conn->query("SELECT * FROM `babysitter_enrollment` where id ='{$_GET['id']}' ");
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

    <input type="hidden" name="id" value="<?= isset($id) ? $id : '' ?>">
    <div class="card-header">
        <h3 class="card-title">List of Baby Sitters</h3>

        <?php if ($_settings->userdata('type') == 1) : ?>


            <div class="card-tools">
                <a href="./?page=babysitters/assign_enroll" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-plus"></i> Add New</a>
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
                            <th>#</th>


                            <th>Child Name</th>
                            <th>Babysitter Name</th>
                            <th>Date</th>
                            <th>Time</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php
                        $i = 1;
                        $qry = $conn->query("SELECT babysitter_enrollment.id, enrollment_list.child_fullname,
                        users.firstname,
                        babysitter_enrollment.date,
                        babysitter_enrollment.time,
                        babysitter_enrollment.entry_date
                        FROM babysitter_enrollment
                        INNER JOIN enrollment_list
                        ON enrollment_list.id = babysitter_enrollment.child_id
                        INNER JOIN users
                        ON users.id = babysitter_enrollment.babysitter_id
                        ORDER BY  entry_date asc");
                        while ($row = $qry->fetch_assoc()) :
                        ?>
                            <tr>
                                <td class="text-center"><?php echo $i++; ?></td>

                                <!-- <td><?php echo $row['id'] ?></td> -->
                                <td><?php echo $row['child_fullname'] ?></td>
                                <td><?php echo $row['firstname'] ?></td>
                                <td><?php echo $row['date'] ?></td>
                                <td><?php echo $row['time'] ?></td>

                                <?php if ($_settings->userdata('type') == 1) : ?>

                                    <td align="center">
                                        <button type="button" class="btn btn-flat btn-default btn-sm dropdown-toggle dropdown-icon" data-toggle="dropdown">
                                            Action
                                            <span class="sr-only">Toggle Dropdown</span>
                                        </button>
                                        <div class="dropdown-menu" role="menu">

                                            <a class="dropdown-item" href="./?page=babysitters/manage_assign_enroll&id=<?= $row['id'] ?>"><span class="fa fa-edit text-primary"></span> Edit</a>

                                        </div>
                                    </td>

                                <?php endif; ?>
                            </tr>
                        <?php endwhile; ?>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
</div>



<script type="text/javascript">
    $(document).ready(function() {


        // $('.table').dataTable({
        //     columnDefs: [{

        //     }],
        // });

        $("#pdf").click(function(e) {
            $("#mytable").tableExport({
                type: 'pdf',
                escape: 'false',
                pdfFontSize: 8

            });
        });




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

        $('.table td,.table th').addClass('py-1 px-2 align-middle')
        $('.table').dataTable({
            columnDefs: [{
                orderable: false,
                targets: 5
            }],
        });
    })
</script>