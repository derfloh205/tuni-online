<?php
    if (array_key_exists('id', $_POST) && array_key_exists('pw', $_POST)) {
        $id = $_POST['id'];
        $pw = hash("sha256", $_POST['pw']);

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $sql = "SELECT * FROM student WHERE studentID='$id' AND password='$pw'";
        $result = mysqli_query($conn, $sql);
        if (mysqli_num_rows($result) != 0) { echo true; } 
        else { echo false; }
    } 
    else {echo false; }
    $conn->close();
?>