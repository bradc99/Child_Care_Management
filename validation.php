<?php
$val = $_GET['value'];
$field = $_GET['field'];

if ($field == "firstname_result") {
    if (strlen($val) < 5) {
        echo 'Must be 4+ letters';
    } else {
        echo '<label class = "text-success">Valid</label>';
    }
}
if ($field == "middlename_result") {
    if (strlen($val) < 6) {
        echo 'Name too short';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}
if ($field == "child_lastname_result") {
    if (strlen($val) < 5) {
        echo 'Must be 4+ letters';
    } else {
        echo '<label class = "text-success">Valid</label>';
    }
}
if ($field == "parentsfn_result") {
    if (strlen($val) < 6) {
        echo 'Name too short';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}
if ($field == "parentsmn_result") {
    if (strlen($val) < 6) {
        echo 'Name too short';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}

if ($field == "parentstln_result") {
    if (strlen($val) < 6) {
        echo 'Name too short';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}

if ($field == "child_dob_result") {
    if (strlen($val) < 6) {
        echo 'Date must be filled';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}


// if ($field == "parentstln_result") {
//     if (strlen($val) < 6) {
//         echo 'Name too short';
//     } else {
//         echo '<label class = "text-success">Strong</label>';
//     }
// }

if ($field == "address1_result") {
    if (strlen($val) < 6) {
        echo 'Name too short';
    } else {
        echo '<label class = "text-success">Strong</label>';
    }
}
// if($field == "firstname_result"){
//     if(strlen($val) < 2){
//         echo 'Invalid';
//     }else{
//         echo '<label class = "text-success">Valid</label>';
//     }
// }

// if($field == "lastname_result"){
//     if(strlen($val) < 2){
//         echo 'Invalid';
//     }else{
//         echo '<label class = "text-success">Valid</label>';
//     }
// }

// if ($field == "email_result") {
//     if (!preg_match("/([\w\-]+\@[\w\-]+\.[\w\-]+)/", $val)) {
//         echo 'Invalid email';
//     } else {
//         echo '<label class = "text-success">Valid</label>';
//     }
// }
