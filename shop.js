function getSession() {
    return parseInt(getCookie("studentID"));
}

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

document.addEventListener("DOMContentLoaded", function() {
    let studentID = getSession();
    if(!studentID) {
        window.location.assign("index.html");
        return;
    } else {
        document.getElementById("loggedInAs").innerText = "Logged in with studentID: " + studentID.toString();
    }
    getLecturesAndProducts();
});

function createTransaction(event) {
  console.log("transaction: ", event);
}

function displayLecturesAndProducts(lecturesAndProducts) {
  console.log("response: " + lecturesAndProducts);
  let lectureElement = "";
  let productElement = "";
  let i = 0;
  for(i; i < lecturesAndProducts.length; i++) {
    if(lecturesAndProducts[i] == "products") {
      break;
    }
    lectureElement += "<li><a>" + lecturesAndProducts[i] +"</a></li>";
  }

  i++;
  for(i; i < lecturesAndProducts.length; i=i+2) {
    productElement += "<li><a id='" + lecturesAndProducts[i] + "' onClick='createTransaction(this);'>" + lecturesAndProducts[i]  + ", price: " + lecturesAndProducts[i+1] +  "</a></li>";
  }
  document.getElementById("lecturesList").innerHTML = lectureElement;
  document.getElementById("productsList").innerHTML = productElement;
}

function getLecturesAndProducts() {
    let universityID = 0;
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            //console.log("response: ", response);

            if(response) {
                console.log("Lectures fetched");
                displayLecturesAndProducts(JSON.parse(response));
            } else {
                alert("Lecture Fetch Error");
                // show login error
            }
        }
    };
    let url_string = window.location.href;
    let url = new URL(url_string);
    universityID = url.searchParams.get("id");
    //console.log("ID: ", universityID);
    xmlhttp.open("POST", "scripts/getLecturesAndProductsFromUniversity.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("id=" + universityID);
}
