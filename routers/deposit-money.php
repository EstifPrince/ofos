<?php
include '../includes/connect.php';
include '../includes/wallet.php';

$deposit_amount = $_POST['deposit_amount'];

    if (($deposit_amount != '') and ($deposit_amount > 0) ){
        $balance = $balance + $deposit_amount;
        $sql = "UPDATE wallet_details SET balance = $balance WHERE wallet_id = $wallet_id;";
		$con->query($sql) === TRUE;

    }

    header("location: ../wallet-view.php");

?>