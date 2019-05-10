<?php

$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbName = "tunidb"; 

$db = mysql_connect($servername, $username, $password, $dbName)
or die('Error connecting to MySQL server.');

$db = mysql_connect($dbName);


$matrNumber = $_POST["id"];
$name = $_POST["name"];
$email = $_POST["email"];
$password = $_POST["pw"];

if(!$db) {

	echo "Could not connect to database";

} else {

if($matrNumber && $name && $email && $password)
{
	$result = mysql_query("SELECT * FROM `student` WHERE studendID = $matrNumber;");

	if(!$result)
	{	
		mysql_query("INSERT INTO `student` (studentID, name, email, password) VALUES('$matrNumber', '$name', '$email', '$password');");
		mysql_close($db);
		return true;
	}
	else
	{
		mysql_close($db);
		return false;
	}
}
else
{
	mysql_close($db);
	return false;
}
}



?>