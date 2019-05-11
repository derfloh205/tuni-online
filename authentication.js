document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("login").addEventListener("click", function () {
        login();
    });

    document.getElementById("register").addEventListener("click", function () {
        register();
    });

    clearCookie("studentID");
});

function login() {
    // get student-id and pw from form
    let studentID = document.getElementById("studentNumber").value;
    let studentpw = document.getElementById("studentPW").value;

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            console.log("response: " + response);
            if(response == 1) {
                // success, redirect
                window.location.assign("universities.html");
                // on login success save "session"
                saveSession(studentID);
                console.log("response success");
            } else {
                alert("Login Error");
                // show login error
            }
        }
    };
    xmlhttp.open("POST", "scripts/login.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("id=" + studentID + "&pw=" + studentpw);
}

function register() {

    // get student-id and pw from form
    let studentID = document.getElementById("studentNumber").value;
    let studentName = document.getElementById("studentName").value;
    let studentEmail = document.getElementById("studentEmail").value;
    let studentPW = document.getElementById("studentPW").value;

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            console.log("response: " + response.toString());
            if(response == "1") {
                // success, redirect
                saveSession(studentID);
                window.location.assign("universities.html");
            } else {
                alert("Registration Error");
                // show register error
            }
        }
    };
    xmlhttp.open("POST", "scripts/register.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("id=" + studentID + "&name=" + studentName + "&email=" + studentEmail + "&pw=" + studentPW);
}
