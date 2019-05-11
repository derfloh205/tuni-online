<?php
    if (array_key_exists('lectureID', $_POST)) {
        $lecture_id = $_POST['lectureID'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $product_query = "select productID from lectureProducts where lectureID = '$lecture_id'";
        $product_id = $conn->query($product_query);

        while($element = mysqli_fetch_assoc($product_id))
        {
          $elem = $element['productID'];
          $sql = "SELECT name,price FROM product WHERE ID = '$elem'";
          $result = $conn->query($sql);
          while($row = mysqli_fetch_assoc($result)){
            $jsonObject = (object)array();
            $jsonObject->name = $row["name"];
            $jsonObject->price = $row["price"];
            json_encode($jsonObject);
            $rows[] = $jsonObject;
          }
        }

        echo json_encode($rows);

    }
?>
