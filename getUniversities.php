<?php
    $servername = "localhost";
    $username = "root";
    $password = "";
    $db = "tunidb";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $db);
    $sql = "SELECT name FROM universities";
    $result = $conn->query($sql);
    if($result->num_rows == 0)
    {
        echo false
    }
    else
    {
        $rows = array();
        while($r = mysqli_fetch_assoc($result)) {
            $rows[] = $r;
        }
        echo json_encode($rows);
    }
    $result->close();
    $conn->close();
?>