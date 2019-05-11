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

        $DUMMY_TEMP_RETURN_REMOVE_ME = '[{"id":3, "name":"dummyProduct", "price":2.3}, {"id":4, "name":"dummyProduct2", "price":3.3}]';
        echo $DUMMY_TEMP_RETURN_REMOVE_ME;
        return true;
        if ($result->num_rows > 0) { return true; }
        else { return false; }
    } 
    else { return false; }
?>