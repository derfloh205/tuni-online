<?php
    if (array_key_exists('lecture', $_POST)) {
        $lecture = $_POST['lecture'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $lecture_id = "select id from lectures where name = " . $lecture;
        $product_id = "select productID from lectureProducts where lectureID = (". $lecture_id . ")";
        $sql = "SELECT name,price FROM product WHERE id = (" . $product_id . ")";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) { return true; } 
        else { return false; }
    } 
    else { return false; }
?>