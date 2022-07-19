<div class="container-fluid">
    <form action="" id="update_occupied_status_form">
        <input type="hidden" name="id" value="<?= isset($_GET['id']) ? $_GET['id'] : "" ?>">
        <div class="form-group">
            <label for="status" class="control-label text-navy">Status</label>
            <select name="occupied_status" id="occupied_status" class="form-control form-control-border" required>
                <option value="not_occupied" <?= isset($_GET['occupied_status']) && $_GET['occupied_status'] == "not_occupied" ? "selected" : "" ?>>not_occupied</option>
                <option value="occupied" <?= isset($_GET['occupied_status']) && $_GET['occupied_status'] == "occupied" ? "selected" : "" ?>>occupied</option>
            </select>
        </div>
    </form>
</div>
<script>
    $(function() {
        $('#update_occupied_status_form').submit(function(e) {
            e.preventDefault()
            start_loader()
            var el = $('<div>')
            el.addClass("pop-msg alert")
            el.hide()
            $.ajax({
                url: _base_url_ + "classes/Master.php?f=occupied_status",
                method: "POST",
                data: $(this).serialize(),
                dataType: "json",
                error: err => {
                    console.log(err)
                    alert_taost("An error occured while saving the data,", "error")
                    end_loader()
                },
                success: function(resp) {
                    if (resp.status == 'success') {
                        location.reload()
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
                    end_loader();
                }
            })
        })
    })
</script>