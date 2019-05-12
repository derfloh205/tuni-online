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

function createTransaction(item) {
    let xmlhttp = new XMLHttpRequest();
    console.log("item id: "+item.id);
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            console.log("response: ", response);

            if(response) {
                console.log("Created Transaction");
            } else {
                alert("Create Transaction Error");
            }
        }
    };

    xmlhttp.open("POST", "scripts/createTransaction.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("studentID=" + getSession() + "&productID=" + item.id);
}

function displayLecturesAndProducts(lecturesAndProducts) {
  let lectureElement = "";
  let productElement = "";
  for(let key in lecturesAndProducts) {
      let id = lecturesAndProducts[key]["ID"];
      let name = lecturesAndProducts[key]["name"];
      let price = lecturesAndProducts[key]["price"];
      if(lecturesAndProducts[key]["type"] == "lecture") {
        lectureElement += "<li><a id='" + id + "' onClick='getProductsByLecture(this);'>" + name +"</a></li>";
      }
      else if(lecturesAndProducts[key]["type"] == "product") {
        productElement += "<li><a id='" + id + "' onClick='createTransaction(this);'>" + name  + ", price: " + priceToString(price) + "</a></li>";

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
            if(response) {
                displayLecturesAndProducts(JSON.parse(response));
            } else {
                alert("Lecture Fetch Error");
            }
        }
    };
    let url_string = window.location.href;
    let url = new URL(url_string);
    universityID = url.searchParams.get("id");
    xmlhttp.open("POST", "scripts/getLecturesAndProductsFromUniversity.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("id=" + universityID);
}

function getProductsByLecture(item) {
    let xmlhttp = new XMLHttpRequest();
    console.log(item);
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let parsedProducts = JSON.parse(this.response);
            if(parsedProducts) {
                let productsLectureList = document.getElementById("productsLectureList");
                let productList = "";
                for(let index in parsedProducts) {
                    let currentProduct = parsedProducts[index];
                    productList += "<li>"+currentProduct.name+" Price: "+priceToString(currentProduct.price) + " <button id='"+currentProduct.ID+"' onclick='createTransaction(this)'>Buy Now</button></li>";
                }
                productsLectureList.innerHTML = productList;
                document.getElementById("productsLectureListContainer").style.display = "";
                document.getElementById("lectureProductHeadline").innerText = "Products from " + item.innerText;
            } else {
                alert("Products by Lecture Fetch Error");
                // show login error
            }
        }
    };
    xmlhttp.open("POST", "scripts/getProductsByLecture.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("lectureID=" + item.id);
}
