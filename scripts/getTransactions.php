<?php
if (array_key_exists('studentID', $_POST)) {
  $student_id = $_POST['studentID'];

  $servername = "localhost";
  $username = "root";
  $password = "";
  $db = "tunidb";

  $conn = new mysqli($servername, $username, $password, $db);


	$query_string = "select productID from transactions where studentID = '$student_id'";
	$product_ids = $conn->query($query_string) or die('Error connecting to MySQL server.');

  while($element = mysqli_fetch_assoc($product_ids))
  {
    $elem = $element["productID"];
    $query_string = "select * from product where ID = '$elem'";
    $product = $conn->query($query_string) or die('Error connecting to MySQL server.');
     while($row = mysqli_fetch_assoc($product)){
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
