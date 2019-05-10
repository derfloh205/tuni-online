document.addEventListener("DOMContentLoaded", function() {
    document.getElementById("login").addEventListener("click", function () {
        login();
    });

    document.getElementById("register").addEventListener("click", function () {
        register();
    });
});

function login() {

    // get student-id and pw from form
    let studentID = document.getElementById("studentNumber").value;
    let studentpw = document.getElementById("studentPW").value;

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            if(response) {
                // success, redirect
                window.open("universities.html");
            } else {
                alert("Login Error");
                // show login error
            }
        } else {
            alert("Connection Error");
            // show connection error
        }
    };
    xmlhttp.open("POST", "login.php", true);
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
            if(response) {
                // success, redirect
                window.open("universities.html");
            } else {
                alert("Registration Error");
                // show register error
            }
        } else {
            alert("Connection Error");
            // show connection error
        }
    };
    xmlhttp.open("POST", "register.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("id=" + studentID + "&name=" + studentName + "&email=" + studentEmail + "&pw=" + studentPW);
}

