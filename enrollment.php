<?php

?>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">

<style>
    /* #enrollment-form {
        display: none;
    } */



    li {
        color: red;
    }
</style>


<!-- <style>
    div {
        box-sizing: border-box;
        width: 100%;
        border: 100px solid black;
        float: left;
        align-content: center;
        align-items: center;
    }

    form {
        margin: 0 auto;
        width: 600px;
    }
</style> -->
<script src="ajax.js"></script>

<div class="content py-3">
    <div class="container-fluid">
        <h3 class="text-center"><b>Enrollment Form</b></h3>
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
        <div class="card card-outline card-info rounded-0 shadow">
            <div class="card-body rounded-0">
                <div class="container-fluid">

                    <form action="" id="enrollment_form">

                        <input type="hidden" name="id" value="">
                        <fieldset>
                            <legend class="text-navy">Child's Information</legend>
                            <div class="row">



                                <div class="form-group col-md-4">
                                    <input type="text" id="child_firstname" name="child_firstname" onblur="validate('firstname_result', this.value)" autofocus class="form-control" placeholder="Firstname" required>
                                    <small class="text-muted px-4">First Name</small>
                                    <center>
                                        <div id='firstname_result' class="text-danger"></div>
                                        <center>

                                </div>
                                <div class="form-group col-md-4">
                                    <input type="text" id="child_middlename" name="child_middlename" onblur="validate('middlename_result', this.value)" class="form-control form-control-sm form-control-border" placeholder="(optional)">
                                    <small class="text-muted px-4">Middle Name</small>
                                    <center>
                                        <div id='middlename_result' class="text-danger"></div>
                                        <center>



                                </div>
                                <div class="form-group col-md-4">
                                    <input type="text" id="child_lastname" name="child_lastname" class="form-control" onblur="validate('child_lastname_result', this.value)" placeholder="Last Name">
                                    <small class="text-muted px-4">Last Name</small>
                                    <center>
                                        <div id='child_lastname_result' class="text-danger"></div>
                                        <center>
                                </div>
                            </div>
                            <div class="row align-items-center">
                                <div class="col-md-4 form-group">
                                    <div class="row">
                                        <div class="form-group col-md-12">
                                            <small class="text-muted">Gender</small>
                                        </div>
                                        <div class="form-group col-auto">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="genderMale" name="gender" value="Male" required checked>
                                                <label for="genderMale" class="custom-control-label">Male</label>

                                            </div>
                                        </div>
                                        <div class="form-group col-auto">
                                            <div class="custom-control custom-radio">
                                                <input class="custom-control-input" type="radio" id="genderFemale" name="gender" value="Female">
                                                <label for="genderFemale" class="custom-control-label">Female</label>

                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-4 form-group">
                                    <input type="date" id="child_dob" name="child_dob" onblur="validate('child_dob_result', this.value)" class="form-control form-control-sm form-control-border" required>
                                    <small class="text-muted px-4">Date of Birthday</small>
                                    <center>
                                        <div id='child_dob_result' class="text-danger"></div>
                                        <center>
                                </div>
                            </div>
                        </fieldset>
                        <fieldset>


                            <legend class="text-navy">Parent/Guardian's Information</legend>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <input type="text" id="parent_firstname" name="parent_firstname" onblur="validate('parentsfn_result', this.value)" class="form-control form-control-sm form-control-border" placeholder="Firstname" required>
                                    <small class="text-muted px-4">First Name</small>
                                    <center>
                                        <div id='parentsfn_result' class="text-danger"></div>
                                        <center>
                                </div>
                                <div class="form-group col-md-4">
                                    <input type="text" id="parent_middlename" name="parent_middlename" onblur="validate('parentsmn_result', this.value)" class="form-control form-control-sm form-control-border" placeholder="Middlname" placeholder="(optional)">
                                    <small class="text-muted px-4">Middle Name</small>
                                    <center>
                                        <div id='parentsmn_result' class="text-danger"></div>
                                        <center>
                                </div>
                                <div class="form-group col-md-4">
                                    <input type="text" id="parent_lastname" name="parent_lastname" onblur="validate('parentstln_result', this.value)" class="form-control form-control-sm form-control-border" placeholder="Lastname" required>
                                    <small class="text-muted px-4">Last Name</small>
                                    <center>
                                        <div id='parentstln_result' class="text-danger"></div>
                                        <center>
                                </div>
                            </div>
                            <div class="row">
                                <div class="form-group col-md-4">
                                    <input type="text" id="parent_contact" name="parent_contact" class="form-control form-control-sm form-control-border" placeholder="Contact" required>
                                    <small class="text-muted px-4">Contact #</small>

                                </div>
                                <div class="form-group col-md-4">
                                    <input type="text" id="parent_email" name="parent_email" class="form-control form-control-sm form-control-border" placeholder="Email" required>
                                    <small class="text-muted px-4">Email</small>

                                </div>

                            </div>


                            <div class="row">
                                <div class="form-group col-md-12">
                                    <small class="text-muted">Address</small>
                                    <textarea name="address" id="address" rows="3" style="resize:none" onblur="validate('address1_result', this.value)" class="form-control" placeholder="Here Street, There City, Anywhere State, 2306"></textarea>
                                    <center>
                                        <div id='address1_result' class="text-danger"></div>
                                        <center>

                                </div>
                            </div>
                        </fieldset>
                        <hr class="bg-navy">
                        <center>
                            <button onclick="validForm()" class="btn btn-lg bg-navy rounded-pill mx-2 col-3">Submit Enrollment</button>
                            <!-- <input type="submit" name="Submit" value="Submit" /> -->
                            <a class="btn btn-lg btn-light border rounded-pill mx-2 col-3" href="./">Cancel</a>
                        </center>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<!-- <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"> -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>

<!-- <script src="<?php echo base_url ?>plugins/jquery-validation/jquery.validate.min.js"></script>
<script src="<?php echo base_url ?>plugins/jquery-validation/additional-methods.min.js"></script> -->


<script>
    $(function() {
        $('#enrollment_form').submit(function(e) {


            e.preventDefault();

            //alert(data);
            var _this = $(this)
            $('.pop-msg').remove()
            var el = $('<div>')
            el.addClass("pop-msg alert")
            el.hide()
            start_loader();
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=save_enrollment",
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
                        location.reload();
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
        });
    })
</script>