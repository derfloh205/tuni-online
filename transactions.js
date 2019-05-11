function priceToString(price) {
    let stringPrice = price.toString();

    if(!stringPrice.includes(".")) {
        stringPrice += ",00"
    }
    else if(stringPrice.length == 3) {
        stringPrice.replace(".", ",");
        stringPrice += "0";
    }
    return stringPrice + "€";
}

function displayTransactions(transactions) {
    let displayText = "Your Transactions:\n\n";
    let priceSum = 0;
    for(let index in transactions) {
        console.log(transactions[index]);
        let currentTransaction = transactions[index];
        priceSum += parseInt(currentTransaction.price);
        displayText += priceToString(currentTransaction.price) + " " + currentTransaction.name + "\n";
    }
    displayText += "----\n"+ priceToString(priceSum);
    alert(displayText);
}

function getStudentTransactions() {
    let studentID = getSession();

    let xmlhttp = new XMLHttpRequest();
    xmlhttp.onreadystatechange = function() {
        if (this.readyState == 4 && this.status == 200) {
            let response = this.response;
            console.log("response transaction: " + response);
            if(response) {
                console.log("Transactions fetched");
                displayTransactions(JSON.parse(response));
            } else {
                alert("Transactions Fetch Error");
            }
        }
    };
    xmlhttp.open("POST", "scripts/getTransactions.php", true);
    xmlhttp.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
    xmlhttp.send("studentID=" + studentID);
}
