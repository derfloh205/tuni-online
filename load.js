document.addEventListener("DOMContentLoaded", function() {
    let studentID = getSession();
    if(!studentID) {
        window.location.assign("index.html");
        return;
    } else {
        document.getElementById("loggedInAs").innerText = "Logged in with studentID: " + studentID.toString();
    }

    getUniversities();
});

function getCookie(cname) {
    let name = cname + "=";
    let ca = document.cookie.split(';');
    for(let i = 0; i < ca.length; i++) {
        let c = ca[i];
        while (c.charAt(0) == ' ') {
            c = c.substring(1);
        }
        if (c.indexOf(name) == 0) {
            return c.substring(name.length, c.length);
        }
    }
    return "";
}

function getSession() {
    return parseInt(getCookie("studentID"));
}


function getUniversities() {
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            console.log("response: " + response);
            if(response == 1) {
                console.log("Universities fetched");
            } else {
                alert("University Fetch Error");
                // show login error
            }
        }
    };
    xmlhttp.open("GET", "getUniversities.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send();
}

function getStudentTransactions() {
    let studentID = getSession();
}


