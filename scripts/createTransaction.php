<?php
    if (array_key_exists('studentID', $_POST) && array_key_exists('productID', $_POST)) {
        $student_id = $_POST['studentID'];
        $product_id = $_POST['productID'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";


        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $sql = "insert into transactions (studentID, productID, date) values ('$student_id', '$product_id', now())";
        echo $conn->query($sql);
        $conn->close();
    } 
    else {echo false; }
?>