<?php
$val = $_GET['value'];
$field = $_GET['field'];


if ($field == "date_result") {
    if (strlen($val) < 5) {
        echo 'Must be 4+ letters';
    } else {
        echo '<label class = "text-success">Valid</label>';
    }
}
