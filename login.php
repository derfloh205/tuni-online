<?php
    if (array_key_exists('id', $_POST) && array_key_exists('pw', $_POST)) {
        $id = $_POST['pw'];
        $pw = ($_POST['pw']);

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $sql = "SELECT " . $id . " FROM students WHERE password = '" . $pw . "'";
        $result = $conn->query($sql);
        if ($result->num_rows > 0) { return true; } 
        else { return false; }
    } 
    else { return false; }
?>