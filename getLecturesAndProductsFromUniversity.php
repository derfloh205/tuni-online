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
                  $stringTest = $row["name"];
                  $rows[] = $stringTest;
            }
		}

		$product_query = "select productID from universityproducts where uniID = '$university'";
		$products = $conn->query($product_query) or die('Error connecting to MySQL server.');
		$rows[] = "products";

		while($element = mysqli_fetch_assoc($products))
		{
		    $elem = $element["productID"];
			$query_string = "select * from product where ID = '$elem'";
			$product = $conn->query($query_string) or die('Error connecting to MySQL server.');

            while($row = mysqli_fetch_assoc($product)){
                  $stringTest = $row["name"];
                  $rows[] = $stringTest;
                  $stringTest = $row["price"];
                  $rows[] = $stringTest;
            }
		}


		echo json_encode($rows);
}

?>
