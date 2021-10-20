<?php
include '../includes/connect.php';
$name = htmlspecialchars($_POST['name']);
$username = htmlspecialchars($_POST['username']);
$password = htmlspecialchars($_POST['password']);
$phone = $_POST['phone'];

function number($length) {
    $result = '';

    for($i = 0; $i < $length; $i++) {
        $result .= mt_rand(0, 9);
    }

    return $result;
}


$exist = false;
$sql = "SELECT (name) FROM users WHERE username  LIKE '$username';";
$sql_c = mysqli_query($con, $sql);
while ($row = mysqli_fetch_array($sql_c)){
    $exist = true;
}
// if($con->query($sql)==true){
//     $exist = true;
// }
// else
// {
//     $exist = false;
// }

if ($exist == false){
    $sql = "INSERT INTO users (name, username, password, contact) VALUES ('$name', '$username', '$password', $phone);";
    if($con->query($sql)==true){
        $user_id =  $con->insert_id;
        $sql = "INSERT INTO wallet(customer_id) VALUES ($user_id)";
        if($con->query($sql)==true){
            $wallet_id =  $con->insert_id;
            $cc_number = number(16);
            $cvv_number = number(3);
            $sql = "INSERT INTO wallet_details(wallet_id, number, cvv) VALUES ($wallet_id, $cc_number, $cvv_number)";
            $con->query($sql);
        }
    }
    header("location: ../login.php");
}
else{
    header("location: ../register.php?error=username_exist");
}

?>