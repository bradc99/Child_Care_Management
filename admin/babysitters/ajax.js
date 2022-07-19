function validForm() {
    var date = document.getElementById("date").value;

    //var email = document.getElementById("email").value;
    if (date == '') {
        //alert("Complete all the required fields");
    } else {
        var date1 = document.getElementById("date_result");

        // var email1 = document.getElementById("email_result");
        if (date1.innerHTML == 'Must be 4+ letters') {
            alert("Complete valid information");
        } else {
            document.getElementById("babysitter_enrollment").submit();
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
