<?php

$servername = "localhost"; 
$username = "root"; 
$password = ""; 
$dbName = "tunidb"; 

$db = mysqli_connect($servername, $username, $password, $dbName)
or die('Error connecting to MySQL server.');

$university = $_POST["TODO"];


$query = "SELECT * FROM lecture";
$lectures = mysqli_query($db, $query) or die('Error querying database 1.');
$query = "SELECT * FROM universityproducts";
$universityproducts = mysqli_query($db, $query) or die('Error querying database 1.');

$rows = array();
while($element = mysql_fetch_assoc($lectures))
{
	$rows[] = $element;
}

while($element = mysql_fetch_assoc($universityproducts))
{
	$rows[] = $element;
}

echo json_encode($rows);
?>