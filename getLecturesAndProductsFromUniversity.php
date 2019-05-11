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

		$rows[] = "lectures";
		while($element = mysqli_fetch_assoc($lectures))
		{
			$query_string = "select * from lecture where ID = '$element'";
			$lecture_name = $conn->query($query_string) or die('Error connecting to MySQL server.');
			$rows[] = $lecture_name;
		}

		$product_query = "select productID from universityproducts where uniID = '$university'";
		$products = $conn->query($product_query) or die('Error connecting to MySQL server.');
		$rows[] = "products";

		while($element = mysqli_fetch_assoc($products))
		{
			$query_string = "select * from product where ID = '$element'";
			$procuct = $conn->query($query_string);
			$rows[] = $procuct;
		}


		echo json_encode($rows);
}

?>
