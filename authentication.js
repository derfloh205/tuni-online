function login() {

    // get student-id and pw from form
    let studentnumber = 123;
    let studentpw = "studentpassword";

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            window.open("universities.html");
        }
    };
    xmlhttp.open("GET", "gethint.php?id=" + studentnumberID + "?pw=" + studentpw, true);
    xmlhttp.send();
}