<?php

// require_once('../config.php');

// $id = isset($_GET['id']) ? $_GET['id'] : '';


// if (isset($_POST['id'])) {
//     echo $_POST['id'];
// }


include_once('../classes/DBConnection.php');

// if (isset($_POST['id'])) {
//     print_r($_POST['id']);
// }


$select_childname = $conn->query("select * from enrollment_list");
//print_r($select_childname);



$select_babysitter = $conn->query("select * from users where type=3 and status=1");


if (!isset($_GET['id']) || $_GET['id'] == null) {
    echo "<script>window.location = 'assign_enroll_list.php';</script>";
} else {
    $id = preg_replace('/[^-a-zA-Z0-9_]/', '', $_GET['id']);
}

$date = date('yy-m-d');
$babysitter = "{$_SESSION['userdata']['id']}";
///echo $date;
///echo $babysitter;
// $result = $conn->query("SELECT * FROM `attendance`");
// $cat_row = mysqli_fetch_assoc($result);

// $numrow = mysqli_num_rows($result);

// print_r($cat_row);
// echo $numrow;


// $chk_child = $conn->query("select enrollment_list.id, enrollment_list.child_fullname, enrollment_list.code, babysitter_enrollment.date
//                     from babysitter_enrollment
//                     inner join users on babysitter_enrollment.babysitter_id = users.id
//                     inner join enrollment_list on enrollment_list.id = babysitter_enrollment.child_id
//                     where babysitter_enrollment.babysitter_id ='" . $_SESSION['userdata']['id'] . "'");

// $row = $chk_child->fetch_assoc();

// echo $row['id'];



$qry = $conn->query("SELECT * FROM `babysitter_enrollment` where id ='{$_GET['id']}' ");
// foreach ($qry->fetch_array() as $k => $v) {
//     $meta[$k] = $v;
// }
// if ($qry->num_rows > 0) {
//     $res = $qry->fetch_array();
//     foreach ($res as $k => $v) {
//         if (!is_numeric($k)) {
//             $$k = $v;
//         }
//     }
// }


// $count = mysqli_num_rows($qry);
// if (empty($count)) {
//     header('LOCATION: ../../babysitters/assign_enroll_list');
// }


// $check_enroll = [];
// $sql5 = $conn->query("select id from babysitter_enrollment where datediff(babysitter_enrollment.dateTime, now())>6");


// $check_enroll = mysqli_fetch_assoc($sql5);

// while ($row = mysqli_fetch_assoc($sql5)) {
//     $json[] = $row;
// }

// echo json_encode($json);


// $sql5 = $conn->query("SELECT * from `babysitter_enrollment` where `child_id`='{$child_id}' and `babysitter_id`='{$babysitter_id}' and `date`='{$date}' and `time`='$time'")->num_rows;


// print_r($sql5);

// $result = $conn->query("
// SELECT * FROM users WHERE id = '".$_SESSION['userdata']['id']."'
// ");


// $result = $conn->query("select enrollment_list.child_fullname as Child, users.username

// from enrollment_list, users, babysitter_enrollment

// where enrollment_list.id = babysitter_enrollment.child_id

// and users.id = babysitter_enrollment.babysitter_id

// and babysitter_enrollment.date between '2022-04-16' and '2022-04-27'");

// $cat_row = mysqli_fetch_assoc($result);


// print_r($cat_row);












if ($qry) {


    while ($cat_row = mysqli_fetch_assoc($qry)) {



        //print_r($cat_row);


?>

        <div class="content py-3">
            <div class="container-fluid">
                <div class="card card-outline card-info shadow rounded-0">
                    <hr class="bg-navy">

                    <div class="card-body">
                        <div class="container-fluid">
                            <form action="" id="babysitter_enrollment">
                                <input type="hidden" name="id" value="<?php echo $_GET['id']; ?>">
                                <fieldset>
                                    <legend class="text-navy">Babysitter Enrollment</legend>
                                    <div class="row">
                                        <div class="form-group col-md-6">
                                            <label for="firstname" class="control-label text-primary">Child Name</label>
                                            <select name="child_id" data-live-search="true" id="child_id" class="form-control form-control-sm form-control-border" title="Select Car Model" disabled>


                                                <?php



                                                // $host = 'localhost';
                                                // $username = 'root';
                                                // $password = '';
                                                // $database = 'child_source_code';

                                                // $conn =  mysqli_connect($host, $username, $password) or die(mysql_error());
                                                // mysqli_select_db($conn, $database) or die(mysql_error());




                                                while ($row = mysqli_fetch_assoc($select_childname)) :

                                                    $select_value = ($row['id'] == $cat_row['child_id'] ? 'selected' : false);

                                                ?>
                                                    <option value="<?php echo $row['id'] ?>" <?php echo $select_value ?>><?php echo $row['child_fullname']; ?></option>
                                                <?php


                                                endwhile;
                                                ?>


                                            </select>

                                        </div>
                                        <div class="form-group col-md-6">
                                            <label for="firstname" class="control-label text-primary">Babysitter Name</label>
                                            <select name="babysitter_id" data-live-search="true" id="babysitter_id" class="form-control form-control-sm form-control-border" title="Select Car Model">


                                                <?php



                                                // $host = 'localhost';
                                                // $username = 'root';
                                                // $password = '';
                                                // $database = 'child_source_code';

                                                // $conn =  mysqli_connect($host, $username, $password) or die(mysql_error());
                                                // mysqli_select_db($conn, $database) or die(mysql_error());




                                                while ($row = mysqli_fetch_assoc($select_babysitter)) :

                                                    $select_value = ($row['id'] == $cat_row['babysitter_id'] ? 'selected' : false);

                                                ?>
                                                    <option value="<?php echo $row['id'] ?>" <?php echo $select_value ?>><?php echo $row['firstname']; ?></option>
                                                <?php


                                                endwhile;
                                                ?>


                                            </select>

                                        </div>

                                    </div>




                                </fieldset>


                                <hr>


                                <div class="row">


                                    <div class="form-group col-md-6">
                                        <label for="" class="control-label">Date</label>
                                        <input type="text" id="date" name="date" class="form-control form-control-sm form-control-border" required value="<?php echo $cat_row['date'] ?>">

                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="" class="control-label">Time</label>
                                        <select name="time" id="time" class="form-control form-control-border" required>
                                            <option value="10:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "10:00:00" ? "selected" : "" ?>>10:00:00</option>
                                            <option value="11:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "11:00:00" ? "selected" : "" ?>>11:00:00</option>
                                            <option value="12:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "12:00:00" ? "selected" : "" ?>>12:00:00</option>
                                            <option value="13:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "13:00:00" ? "selected" : "" ?>>13:00:00</option>
                                            <option value="14:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "14:00:00" ? "selected" : "" ?>>14:00:00</option>
                                            <option value="15:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "15:00:00" ? "selected" : "" ?>>15:00:00</option>
                                            <option value="16:00:00" <?= isset($cat_row['time']) && $cat_row['time'] == "16:00:00" ? "selected" : "" ?>>16:00:00</option>




                                        </select>
                                    </div>
                                </div>
                            </form>
                    <?php     }
            }
                    ?>

                        </div>
                    </div>
                    <div class="card-footer">
                        <div class="text-center">
                            <!-- <input type="submit" name="submit" value="Submit"> -->
                            <button class="btn btn-flat btn-primary" form="babysitter_enrollment"><i class="fa fa-save"></i> Update</button>
                            <a href="./?page=babysitters" class="btn btn-flat btn-light border"><i class="fa fa-angle-left"></i> Cancel</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>


        <script>
            $(function() {
                $('#babysitter_enrollment').submit(function(e) {
                    e.preventDefault()
                    var _this = $(this)
                    $('.pop-msg').remove()
                    var el = $('<div>')
                    el.addClass("pop-msg alert")
                    el.hide()
                    start_loader();
                    $.ajax({
                        url: _base_url_ + "classes/Master.php?f=babysitter_enrollment_update",
                        data: new FormData($(this)[0]),
                        cache: false,
                        contentType: false,
                        processData: false,
                        method: 'POST',
                        type: 'POST',
                        dataType: 'json',
                        error: err => {
                            console.log(err)
                            alert_toast("An error occured", 'error');
                            end_loader();
                        },
                        success: function(resp) {
                            if (resp.status == 'success') {
                                location.href = './?page=babysitters/assign_enroll_list';
                            } else if (!!resp.msg) {
                                el.addClass("alert-danger")
                                el.text(resp.msg)
                                _this.prepend(el)
                            } else {
                                el.addClass("alert-danger")
                                el.text("An error occurred due to unknown reason.")
                                _this.prepend(el)
                            }
                            el.show('slow')
                            $('html, body').animate({
                                scrollTop: 0
                            }, 'fast')
                            end_loader();
                        }
                    })
                })
            })




            $(document).ready(function() {
                var minDate = new Date();
                $("#date").datepicker({
                    showAnim: 'drop',
                    numberofMonth: 1,
                    minDate: minDate,
                    dateFormat: 'yy-mm-dd',
                });
            })
        </script>