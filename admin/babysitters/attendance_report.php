<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-12">
            <div class="card mt-5">
                <div class="card-header">
                    <h4>Attendance Date Range Search</h4>
                </div>
                <div class="card-body">

                </div>
            </div>

            <div class="card mt-4">
                <div class="card-body">
                    <div class="col-md-12 text-center">
                        <button type="button" class="btn btn-secondary" id="pdf">Export PDF</button>
                        <button type="button" class="btn btn-secondary" id="excel">Export Excel</button>
                        <button type="button" class="btn btn-secondary" id="csv">Export CSV</button>
                    </div>
                    <div class="total-filter">
                        <div class="search-heading">Show Results</div>
                        <p id="date_filter">

                            <span id="date-label-from" class="date-label">From:</span>
                            <input class="date_range_filter date" type="text" id="datepicker_from" />

                            <span id="date-label-to" class="date-label">To:</span>
                            <input class="date_range_filter date" type="text" id="datepicker_to" />
                            <button class="btn btn-default clear-date-filter">Clear Filter</button>
                        </p>
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




    //newly added 
    $(document).ready(function() {
        $.fn.dataTable.ext.search.push(
            function(settings, data, dataIndex) {
                var min = $('#datepicker_from').datepicker('getDate');
                var max = $('#datepicker_to').datepicker('getDate');

                var startDate = new Date($.trim(data[1])); //here change column value if you have different table structure
                if (min == null && max == null) return true;
                if (min == null && startDate <= max) return true;
                if (max == null && startDate >= min) return true;
                if (startDate <= max && startDate >= min) return true;
                return false;
            }
        );

        $('#datepicker_from').datepicker({
            onSelect: function() {
                table.draw();
            },
            changeMonth: true,
            changeYear: true
        });
        $('#datepicker_to').datepicker({
            onSelect: function() {
                table.draw();
            },
            changeMonth: true,
            changeYear: true
        });
        var table = $('#mytable').DataTable();

        // Event listener to the two range filtering inputs to redraw on input
        $('#datepicker_from,#datepicker_to').change(function() {
            table.draw();

        });

        $(".clear-date-filter").on("click", function() {
            $('#datepicker_from').val("").datepicker("update");
            $('#datepicker_to').val("").datepicker("update");
        });

    });
</script>