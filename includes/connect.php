<?php
session_start();
$servername = "localhost";
$server_user = "root";
$server_pass = "";
$dbname = "food";
if (isset($_SESSION['name'])){
    $name = $_SESSION['name'];
} else {
    $name = "";
}

if (isset($_SESSION['role'])){
    $role = $_SESSION['role'];
} else {
    $role = "";
}

$con = new mysqli($servername, $server_user, $server_pass, $dbname);
?>