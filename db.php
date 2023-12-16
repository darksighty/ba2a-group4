<?php
$servername= "localhost";
$username = "root";
$password = "";
$dbname = "kimia";
$conn = new mysqli($servername, $username, $password, $password);
if ($conn->connect_error) {
    die("connection failed:" . $conn->connect_error);
}
?>