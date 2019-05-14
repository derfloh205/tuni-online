<?php
$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbName = "tunidb"; 

$db = mysqli_connect($servername, $username, $password, $dbName)
or die('Error connecting to MySQL server.');


$matrNumber = $_POST["id"];
$name = $_POST["name"];
$email = $_POST["email"];
$password = hash("sha256", $_POST["pw"]);


if($matrNumber && $name && $email && $password)
{
	$matNr = (int)$matrNumber;
	$query = "SELECT * FROM student WHERE studentID = '$matNr'";
	$result = mysqli_query($db, $query) or die('Error querying database 1.');

	$numRows = mysqli_num_rows($result);

	if($numRows == 0)
	{	
		$query = "INSERT INTO student (studentID, name, email, password) VALUES('$matrNumber', '$name', '$email', '$password')";
		$result = mysqli_query($db, $query) or die('Error querying database 2.');
		mysqli_close($db);
		echo true;
		return;
	}
	else
	{
		mysqli_close($db);
		echo false;
		return;
	}
}
else
{
	mysqli_close($db);
	echo false;
	return;
}

$conn->close();

?>