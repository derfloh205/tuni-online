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
$password = $_POST["pw"];


if($matrNumber && $name && $email && $password)
{
	#$result = mysqli_query("SELECT * FROM `student` WHERE studendID = $matrNumber;");
	$query = "SELECT * FROM student WHERE studentID = '$matrNumber'";
	$result = mysqli_query($db, $query) or die('Error querying database 1.');
	if($result == NULL)
	{	
		#mysqli_query("INSERT INTO `student` (studentID, name, email, password) VALUES('$matrNumber', '$name', '$email', '$password');");
		$query = "INSERT INTO student (studentID, name, email, password) VALUES('$matrNumber', '$name', '$email', '$password')";
		$result = mysqli_query($db, $query) or die('Error querying database 2.');
		#mysql_close($db);
		return true;
	}
	else
	{
		#mysql_close($db);
		return false;
	}
}
else
{
	#mysql_close($db);
	return false;
}



?>