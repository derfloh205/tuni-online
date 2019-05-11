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
            if(response) {
                displayUniversities(JSON.parse(response));
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

function getLecturesAndProductsFromLectures() {
  let xmlhttp = new XMLHttpRequest();
  xmlhttp.onreadystatechange = function() {
      if (this.readyState == 4 && this.status == 200) {
        let response = this.response;
        console.log("response: " + response);
        if(response) {
            console.log("Lectures and Products fetched");

        } else {
            alert("Lectures and Products Fetch Error");
            // show login error
        }
      }
      xmlhttp.open("GET", "getLecturesAndProductsFromLectures.php", true);
      xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
      xmlhttp.send();
    }
}

function foo(id) {
  console.log("foo: ", id);
}

function displayUniversities(universities) {
    let element = "";
    for(let key in universities) {
        let id = universities[key]["id"];
        let name = universities[key]["name"];
        //console.log(id + " " + name);
        element += "<li onclick='foo(this)'>"+ " " + name +"</li>";
    }
        document.getElementById("universityList").innerHTML = element;
}

function getStudentTransactions() {
    let studentID = getSession();
}
