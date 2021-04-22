<?php

include 'conn.php';
$name = $_POST['name'];
$mobile = $_POST['mobile'];

$conn->query("insert into mytable(name,mobile) values('".$name."','".$mobile."')")
?>