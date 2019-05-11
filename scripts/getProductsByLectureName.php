<?php
    if (array_key_exists('lectureID', $_POST)) {
        $lecture_id = $_POST['lectureID'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $product_id = "select productID from lectureProducts where lectureID = (". $lecture_id . ")";
        $sql = "SELECT name,price FROM product WHERE id = (" . $product_id . ")";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) { return true; } 
        else { return false; }
    } 
    else { return false; }
?>