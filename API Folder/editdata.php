<?php

include 'conn.php';

$id=$_POST['id'];
$name = $_POST['name'];
$mobile = $_POST['mobile'];


$conn->query("update mytable set name='".$name."',mobile='.$mobile.' where id ='".$id."'");
 

?>