<style>
    #cimg {
        object-fit: scale-down;
        object-position: center center;
        height: 200px;
        width: 200px;
    }
</style>

<script src="babysitters/ajax.js"></script>


<div class="content py-3">
    <div class="container-fluid">
        <div class="card card-outline card-info shadow rounded-0">
            <hr class="bg-navy">
            <?php if ($_settings->chk_flashdata('pop_msg')) : ?>
                <div class="alert alert-success">
                    <i class="fa fa-check mr-2"></i> <?= $_settings->flashdata('pop_msg') ?>
                </div>
                <script>
                    $(function() {
                        $('html, body').animate({
                            scrollTop: 0
                        })
                    })
                </script>
            <?php endif; ?>
            <div class="card-body">
                <div class="container-fluid">
                    <form action="" id="babysitter_enrollment">
                        <input type="hidden" name="id" value="<?= isset($id) ? $id : '' ?>">
                        <fieldset>
                            <legend class="text-navy">Babysitter Enrollment</legend>
                            <div class="row">
                                <div class="form-group col-md-6">
                                    <label for="firstname" class="control-label text-primary">Child Name</label>
                                    <select name="child_id" data-live-search="true" id="child_id" class="form-control form-control-sm form-control-border" title="Select Car Model">


                                        <?php



                                        // $host = 'localhost';
                                        // $username = 'root';
                                        // $password = '';
                                        // $database = 'child_source_code';

                                        // $conn =  mysqli_connect($host, $username, $password) or die(mysql_error());
                                        // mysqli_select_db($conn, $database) or die(mysql_error());


                                        include_once('../../classes/DBConnection.php');

                                        $state_query = "SELECT * FROM enrollment_list";
                                        $result = mysqli_query($conn, $state_query);

                                        if (mysqli_num_rows($result) > 0) {
                                            while ($state_row = mysqli_fetch_assoc($result)) {

                                        ?>
                                                <option value="<?php echo $state_row['id'] ?>"><?php echo $state_row['child_fullname'] ?></option>
                                        <?php


                                            }
                                        }
                                        ?>


                                    </select>

                                </div>
                                <div class="form-group col-md-6">
                                    <label for="firstname" class="control-label text-primary">Babysitter Name</label>
                                    <select name="babysitter_id" data-live-search="true" id="babysitter_id" class="form-control form-control-sm form-control-border" title="Select Car Model">


                                        <?php

                                        //


                                        // $host = 'localhost';
                                        // $username = 'root';
                                        // $password = '';
                                        // $database = 'child_source_code';

                                        // $conn =  mysqli_connect($host, $username, $password) or die(mysql_error());
                                        // mysqli_select_db($conn, $database) or die(mysql_error());

                                        include_once('../../classes/DBConnection.php');


                                        $state_query = "select * from users where type=3 and status=1";
                                        $result = mysqli_query($conn, $state_query);

                                        if (mysqli_num_rows($result) > 0) {
                                            while ($state_row = mysqli_fetch_assoc($result)) {

                                        ?>
                                                <option value="<?php echo $state_row['id'] ?>"><?php echo $state_row['firstname'] ?></option>
                                        <?php


                                            }
                                        }
                                        ?>


                                    </select>

                                </div>

                            </div>




                        </fieldset>


                        <hr>


                        <div class="row">


                            <div class="form-group col-md-6">
                                <label for="" class="control-label">Date</label>
                                <input type="text" id="date" name="date" class="form-control form-control-sm form-control-border" required>

                            </div>

                            <div class="form-group col-md-6">
                                <label for="" class="control-label">Time</label>
                                <select name="time" id="time" class="form-control form-control-border" required>
                                    <option value="10:00:00" <?= isset($_GET['time']) && $_GET['time'] == "10:00:00" ? "selected" : "" ?>>10:00:00</option>
                                    <option value="11:00:00" <?= isset($_GET['time']) && $_GET['time'] == "11:00:00" ? "selected" : "" ?>>11:00:00</option>
                                    <option value="12:00:00" <?= isset($_GET['time']) && $_GET['time'] == "12:00:00" ? "selected" : "" ?>>12:00:00</option>
                                    <option value="13:00:00" <?= isset($_GET['time']) && $_GET['time'] == "13:00:00" ? "selected" : "" ?>>13:00:00</option>
                                    <option value="14:00:00" <?= isset($_GET['time']) && $_GET['time'] == "14:00:00" ? "selected" : "" ?>>14:00:00</option>
                                    <option value="15:00:00" <?= isset($_GET['time']) && $_GET['time'] == "15:00:00" ? "selected" : "" ?>>15:00:00</option>
                                    <option value="16:00:00" <?= isset($_GET['time']) && $_GET['time'] == "16:00:00" ? "selected" : "" ?>>16:00:00</option>

                                </select>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <div class="card-footer">
                <div class="text-center">
                    <!-- <input type="submit" name="submit" value="Submit"> -->
                    <button class="btn btn-flat btn-primary" form="babysitter_enrollment"><i class="fa fa-save"></i> Save</button>
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
                url: _base_url_ + "classes/Master.php?f=babysitter_enrollment",
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