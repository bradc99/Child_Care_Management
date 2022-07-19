function validForm() {
    var firstname = document.getElementById("child_firstname").value;
    var middlename = document.getElementById("child_middlename").value;
    var child_lastname = document.getElementById("child_lastname").value;
    var parent_firstname = document.getElementById("parent_firstname").value;
    var parent_middlename = document.getElementById("parent_middlename").value;
    var parent_lastname = document.getElementById("parent_lastname").value;
    var address = document.getElementById("address").value;
    var child_dob = document.getElementById("child_dob").value;

    //var email = document.getElementById("email").value;
    if (name == '' || password == '' || firstname == '' || child_lastname == '' || email == '' || parent_firstname == '') {
        //alert("Complete all the required fields");
    } else {
        var firstname1 = document.getElementById("firstname_result");
        var middlename1 = document.getElementById("middlename_result");
        var child_lastname1 = document.getElementById("child_lastname_result");
        var parentsfn1 = document.getElementById("parentsfn_result");
        var parentsmn = document.getElementById("parentsmn_result");
        var parentstln = document.getElementById("parentstln_result");
        var address1 = document.getElementById("address1_result");
        var child_dob1 = document.getElementById("child_dob_result");
        // var email1 = document.getElementById("email_result");
        if (firstname1.innerHTML == 'Must be 4+ letters' || middlename1.innerHTML == 'Name too short' || child_lastname1.innerHTML == 'Name too short'
            || parentsfn1.innerHTML == 'Name too short' || parentsmn.innerHTML == 'Name too short' || parentsmn.innerHTML == 'Name too short'
            || parentstln.innerHTML == 'Name too short') {
            alert("Complete valid information");
        }


        else {
            document.getElementById("enrollment_form").submit();
        }

    }
}

function validate(field, value) {
    var xmlhttp;
    if (window.XMLHttpRequest) {
        xmlhttp = new XMLHttpRequest();
    } else {
        xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }

    xmlhttp.onreadystatechange = function () {
        if (xmlhttp.readyState != 4 && xmlhttp.status == 200) {
            document.getElementById(field).innerHTML = "Validating..";
        } else if (xmlhttp.readyState == 4 && xmlhttp.status == 200) {
            document.getElementById(field).innerHTML = xmlhttp.responseText;
        } else {
            document.getElementById(field).innerHTML = "Error Occurred. <a href='index.php'>Reload Or Try Again</a> the page.";
        }
    }
    xmlhttp.open("GET", "validation.php?field=" + field + "&value=" + value, true);
    xmlhttp.send();
}