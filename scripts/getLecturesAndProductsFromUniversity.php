<?php
if (array_key_exists('id', $_POST)) {
    $university = $_POST['id'];

		$servername = "localhost";
		$username = "root";
		$password = "";
		$dbName = "tunidb";

		$conn = new mysqli($servername, $username, $password, $dbName);

		$query_string = "select lectureID from universitylectures where uniID = '$university'";
		$lectures = $conn->query($query_string) or die('Error connecting to MySQL server.');

		while($element = mysqli_fetch_assoc($lectures))
		{
		  $elem = $element["lectureID"];
			$query_string = "select * from lecture where ID = '$elem'";
			$lecture_name = $conn->query($query_string) or die('Error connecting to MySQL server.');
			   while($row = mysqli_fetch_assoc($lecture_name)){
            $jsonObject = (object)array();
            $jsonObject->type = "lecture";
            $jsonObject->ID = $row["ID"];
            $jsonObject->name = $row["name"];
            json_encode($jsonObject);
            $rows[] = $jsonObject;
          }
		}

		$product_query = "select productID from universityproducts where uniID = '$university'";
		$products = $conn->query($product_query) or die('Error connecting to MySQL server.');
		//$rows[] = "products";

		while($element = mysqli_fetch_assoc($products))
		{
		  $elem = $element["productID"];
			$query_string = "select * from product where ID = '$elem'";
			$product = $conn->query($query_string) or die('Error connecting to MySQL server.');

            while($row = mysqli_fetch_assoc($product)){
              $jsonObj = (object)array();
              $jsonObj->type = "product";
              $jsonObj->ID = $row["ID"];
              $jsonObj->name = $row["name"];
              $jsonObj->price = $row["price"];
              json_encode($jsonObj);
              $rows[] = $jsonObj;
            }
		}
		echo json_encode($rows);
}

?>
