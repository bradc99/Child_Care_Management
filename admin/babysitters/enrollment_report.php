<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mt-5">
                <div class="card-header">
                    <h4>Enrollment Date Range Search</h4>
                </div>
                <div class="card-body">

                    <form action="" method="POST">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>From Date</label>
                                    <input type="date" name="from_date" value="<?php if (isset($_POST['from_date'])) {
                                                                                    echo $_POST['from_date'];
                                                                                } ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>To Date</label>
                                    <input type="date" name="to_date" value="<?php if (isset($_POST['to_date'])) {
                                                                                    echo $_POST['to_date'];
                                                                                } ?>" class="form-control">
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="form-group">
                                    <label>Click to Filter</label> <br>
                                    <button type="submit" name="search" class="btn btn-primary">Filter</button>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>

            <div class="card mt-4">
                <div class="card-body">
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-secondary" id="pdf">Export PDF</button>
                        <button type="button" class="btn btn-secondary" id="excel">Export Excel</button>
                        <button type="button" class="btn btn-secondary" id="csv">Export CSV</button>
                    </div>
                    <table id="mytable" class="table table-borderd">
                        <thead>
                            <tr>
                                <th>Child</th>
                                <th>Babysitter</th>
                                <th>Date</th>
                            </tr>
                        </thead>
                        <tbody>

                            <?php
                            $con = mysqli_connect("localhost", "root", "", "child_source_code");

                            if (isset($_POST['from_date']) && isset($_POST['to_date'])) {
                                $from_date = $_POST['from_date'];
                                $to_date = $_POST['to_date'];




                                $qry = $conn->query("select enrollment_list.child_fullname as Child, users.username as Babysitter, babysitter_enrollment.date

                                from enrollment_list, users, babysitter_enrollment
                                
                                where enrollment_list.id = babysitter_enrollment.child_id
                                
                                and users.id = babysitter_enrollment.babysitter_id
                                
                                and babysitter_enrollment.date BETWEEN '" . $from_date . "' and '" . $to_date . "'");

                                // $result = mysqli_fetch_assoc($qry);
                                // print_r($result);

                                // $query = "select enrollment_list.child_fullname as Child, users.username

                                // from enrollment_list, users, babysitter_enrollment

                                // where enrollment_list.id = babysitter_enrollment.child_id

                                // and users.id = babysitter_enrollment.babysitter_id

                                // and babysitter_enrollment.date BETWEEN '$from_date' AND '$to_date' ";
                                // $query_run = mysqli_query($con, $query);






                                if (mysqli_num_rows($qry) > 0) {
                                    foreach ($qry as $row) {
                            ?>
                                        <tr>
                                            <td><?= $row['Child']; ?></td>
                                            <td><?= $row['Babysitter']; ?></td>
                                            <td><?= $row['date']; ?></td>
                                        </tr>
                            <?php
                                    }
                                } else {
                                    echo "No Record Found";
                                }
                            }
                            ?>
                        </tbody>
                    </table>
                </div>
            </div>

        </div>
    </div>
</div>





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