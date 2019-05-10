<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $db = "tunidb";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $db);
    $sql = "SELECT name FROM universities";
    $result = $conn->query($sql);
    echo json_encode($result);
?>