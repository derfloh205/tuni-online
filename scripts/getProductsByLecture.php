<?php
    if (array_key_exists('lectureID', $_POST)) {
        $lecture_id = $_POST['lectureID'];

        $servername = "localhost";
        $username = "root";
        $password = "";
        $db = "tunidb";

        // Create connection
        $conn = new mysqli($servername, $username, $password, $db);
        $product_query = "select productID from lectureproducts where lectureID = '$lecture_id'";
        $product_id = $conn->query($product_query);
        //echo $product_query;
        //return;

        while($element = mysqli_fetch_assoc($product_id))
        {
          $elem = $element['productID'];
          $sql = "SELECT * FROM product WHERE ID = '$elem'";
          $result = $conn->query($sql);
          while($row = mysqli_fetch_assoc($result)){
            $jsonObject = (object)array();
            $jsonObject->ID = $row["ID"];
            $jsonObject->name = $row["name"];
            $jsonObject->price = $row["price"];
            json_encode($jsonObject);
            $rows[] = $jsonObject;
          }
        }

        echo json_encode($rows);

    }
?>
