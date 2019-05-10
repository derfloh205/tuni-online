<?php
    if (array_key_exists('studentid', $_POST) && array_key_exists('productid', $_POST)) {
        $student_id = $_POST['studentid'];
        $product_id = $_POST['productid'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $sql = "insert into transactions (studentID, productID, date) values ('$student_id', '$product_id', now())";
        $result = mysqli_query($conn, $sql);
        echo $conn->query($sql)
    } 
    else {echo false; }
?>