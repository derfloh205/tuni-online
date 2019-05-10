document.addEventListener("DOMContentLoaded", function() {
    let studentID = getSession();

    if(!studentID) {
        window.location.assign("index.html");
    } else {
        document.getElementById("loggedInAs").innerText = "Logged in with studentID: " + studentID.toString();
    }
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
    // ajax
}

function getStudentTransactions() {
    let studentID = getSession();
}


