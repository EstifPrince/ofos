<?php
    include '../includes/connect.php';
    $date = $_POST['date'];
    $delivered = $_POST['delivered'];
    $cancelled = $_POST['cancelled'];
    $total_sale = $_POST['total_sale'];

    $sql = "INSERT INTO report (date, delivered, cancelled, total_sale) VALUE('$date', $delivered, $cancelled, $total_sale)";
    if($con->query($sql)==true){
        header("location: ../cashier-report.php?reported=true");
    }
    else{
        header("locaton: ../cashier-report.php?reported=false");
    }
?>