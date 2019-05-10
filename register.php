<?php

$matrNumber = $_POST["matriculationNumber"];
$name = $_POST["name"];
$email = $_POST["email"];
$password = $_POST["password"];


if($matrNumber && $name && $email && $password)
{
	$result = mysql_query("SELECT * FROM `student` WHERE studendID = $matrNumber;");

	if(!$result)
	{	
		echo "<script>console.log( 'in if' );</script>";
		mysql_query("INSERT INTO `student` (studentID, name, email, password) VALUES('$matrNumber', '$name', '$email', '$password');");

		return true;
	}
	else
	{
		echo "<script>console.log( 'in else' );</script>";
		return false;
	}
}
else
{
	echo "<script>console.log( 'in else 2' );</script>";
	return false;
}
?>