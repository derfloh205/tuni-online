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
  console.log("response bar: " + lecturesAndProducts);
  let lectureElement = "";
  let productElement = "";
  for(let key in lecturesAndProducts) {
    console.log(lecturesAndProducts[key]);
      let id = lecturesAndProducts[key]["ID"];
      let name = lecturesAndProducts[key]["name"];
      let price = lecturesAndProducts[key]["price"];
      console.log("id: " + id + " name: " + name );
      if(lecturesAndProducts[key]["type"] == "lecture") {
        lectureElement += "<li><a id='" + id + "' onClick='getProductsByLecture(this);'>" + name +"</a></li>";
      }
      else if(lecturesAndProducts[key]["type"] == "product") {
        productElement += "<li><a id='" + id + "' onClick='createTransaction(this);'>" + name  + ", price: " + price +  "</a></li>";

      }
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
            console.log("response foo: ", response);

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

function getProductsByLecture(item) {
    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let parsedProducts = JSON.parse(this.response);
            if(parsedProducts) {
                console.log("Products by Lecture fetched");
                for(let index in parsedProducts) {
                    console.log("product: " + parsedProducts[index].name);
                }
            } else {
                alert("Products by Lecture  Fetch Error");
                // show login error
            }
        }
    };
    xmlhttp.open("POST", "scripts/getProductsByLecture.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("lectureID=" + item.id);
}
