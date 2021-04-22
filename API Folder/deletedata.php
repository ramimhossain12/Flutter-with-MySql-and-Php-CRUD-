<?php

include 'conn.php';
$id = $_POST['id'];

$conn->query("delete from mytable where id ='".$id."'");

?>