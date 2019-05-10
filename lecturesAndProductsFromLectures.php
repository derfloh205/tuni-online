<?php

$university = $_POST["TODO"];


$lectures = mysql_query("SELECT * FROM `lecture`;");
$universityProducts = mysql_query("SELECT * FROM `universityproducts`;");
$rows = array();
while($element = mysql_fetch_assoc($lectures))
{
	$rows[] = $element;
}

while($element = mysql_fetch_assoc($universityproducts))
{
	$rows[] = $element;
}

return json_encode($rows);
?>