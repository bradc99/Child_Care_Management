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

    <input type="hidden" name="id" value="<?= isset($id) ? $id : '' ?>">
    <div class="card-header">
        <h3 class="card-title">Attendance List</h3>


        <?php if ($_settings->userdata('type') == 3) : ?>

            <div class="card-tools">
                <a href="./?page=babysitters/attendance" class="btn btn-flat btn-primary btn-sm"><i class="fa fa-plus"></i> Add New</a>
            </div>
        <?php endif; ?>


    </div>
    <div class="card-body">
        <div class="container-fluid">
            <div class="container-fluid">



                <!-- Newly added -->
                <!-- <div class="row justify-content-md-center">
                    <div class="col-8">
                        <div class="text-muted">
                            Advanced Search
                        </div>
                        <div class="row">
                            <div class="col-md-5">
                                <select class="form-control" id="select-column">
                                    <option value="0">ID</option>
                                    <option selected value="1">Name</option>
                                    <option value="2">Email</option>
                                </select>
                            </div>
                            <div class="col-md-7">
                                <input class="form-control" type="text" id="search-by-column" placeholder="Search By Column">
                            </div>
                        </div>
                    </div>
                </div> -->

                <!-- Newly added -->
                <form method="post">
                    <table class="table table-hover table-striped" id="example">

                        <thead>
                            <tr>
                                <th>#</th>


                                <th>Child Name</th>
                                <th>Child Code</th>
                                <th>Date</th>
                                <?php
                                if ($_settings->userdata('type') == 3) :
                                ?>
                                    <th>Status</th>


                                <?php endif; ?>
                            </tr>
                        </thead>


                        <tbody>
                            <?php

                            if ($_settings->userdata('type') == 1) :

                                $i = 1;
                                $qry = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, babysitter_enrollment.date
                                from babysitter_enrollment
                                inner join users on babysitter_enrollment.babysitter_id = users.id
                                inner join enrollment_list on enrollment_list.id = babysitter_enrollment.child_id");
                                while ($row = $qry->fetch_assoc()) :
                            ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i++; ?></td>

                                        <!-- <td><?php echo $row['id'] ?></td> -->
                                        <td><?php echo $row['child_fullname'] ?></td>
                                        <td><?php echo $row['code'] ?></td>
                                        <td><?php echo $row['date'] ?></td>
                                        <!-- <td><?php echo $row['attendance_status'] ?></td> -->





                                    </tr>
                                <?php endwhile;     ?>

                            <?php endif; ?>


                            <?php
                            if ($_settings->userdata('type') == 3) :

                                $i = 1;
                                $qry = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, babysitter_enrollment.date
                                from babysitter_enrollment
                                inner join users on babysitter_enrollment.babysitter_id = users.id
                                inner join enrollment_list on enrollment_list.id = babysitter_enrollment.child_id
                                where babysitter_enrollment.babysitter_id ='" . $_SESSION['userdata']['id'] . "'");
                                while ($row = $qry->fetch_assoc()) :
                            ?>
                                    <tr>
                                        <td class="text-center"><?php echo $i++; ?></td>

                                        <!-- <td><?php echo $row['id'] ?></td> -->
                                        <td><?php echo $row['child_fullname'] ?></td>
                                        <td><?php echo $row['code'] ?></td>
                                        <td><?php echo $row['date'] ?></td>
                                        <!-- <td><?php echo $row['attendance_status'] ?></td> -->



                                        <td align="center">
                                            Present<input required type="radio" name="attendance[<?php echo $row['id'] ?>]" value="Present">

                                            Absent
                                            <input required type="radio" name="attendance[<?php echo $row['id']; ?>]" value="Absent" type="text">
                                        </td>


                                    </tr>
                                <?php endwhile;   ?>

                            <?php endif; ?>


                        </tbody>

                    </table>
                    <?php
                    // $date = date('d-m-yy');

                    // echo $date . "<br>";  
                    ?>
                    <?php if ($_settings->userdata('type') == 3) : ?>
                        <input class="btn btn-primary" type="submit" value="Take Attendance">
                    <?php endif; ?>
                </form>

                <?php
                if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                    $att = $_POST['attendance'];
                    $date = date('yy-m-d');
                    $babysitter = $_SESSION['userdata']['id'];

                    //check child_id
                    $chk_child = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, babysitter_enrollment.date
                    from babysitter_enrollment
                    inner join users on babysitter_enrollment.babysitter_id = users.id
                    inner join enrollment_list on enrollment_list.id = babysitter_enrollment.child_id
                    where babysitter_enrollment.babysitter_id ='" . $_SESSION['userdata']['id'] . "'");



                    //$row = $qry->fetch_assoc($chk_child);





                    //echo $row['id'];
                    $result = $conn->query("select * from attendance where attendance_date='$date' and babysitter_id='$babysitter'");
                    $numrow = mysqli_num_rows($result);
                    //echo $numrow;
                    //$check = mysqli_fetch_assoc($result);
                    //print_r($check);
                    //$result = $link->query($query);
                    $b = false;
                    if ($numrow > 0) {
                        while ($check = mysqli_fetch_assoc($result)) {
                            if ($date == $check['attendance_date']) {
                                $b = true;
                                echo "<div class='alert alert-danger'>
                                Attendance already Taken today!!!!.
                                </div>";
                            }
                        }
                    }





                    if (!$b) {
                        foreach ($att as $key => $value) {
                            if ($value = "Present") {

                                $query = $conn->query("insert into attendance(child_id,attendance_status,attendance_date,babysitter_id) values('$key','Present','$date','$babysitter')");
                                //$insertResult = $link->query($query);
                            } else {
                                $query = $conn->query("insert into attendance(child_id,attendance_status,attendance_date,babysitter_id) values('$key','Absent','$date','$babysitter')");
                                //$insertResult = $link->query($query);
                            }
                        }
                        if ($query) {

                            echo "<div class='alert alert-success'>
                                    Attendance Taken Successfully.
                                    </div>";
                        }
                    }
                }


                ?>

            </div>
        </div>
    </div>
</div>


<script>
    $(document).ready(function() {

        var table = $('#example').DataTable();
        searchByColumn(table);
    });
</script>