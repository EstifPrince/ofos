<?php

    require_once 'vendor/autoload.php';

    $clientID = '';
    $clientSecret ='';
    $redirectUrl = 'http://localhost/google-oAuth/glogin.php';

    // Creatin client request to google
    $client = new Google_Client();
    $client->setClientId($clientID);
    $client->setClientSecret($clientSecret);
    $client->setRedirectUri($redirectUrl);
    $client->addScope('profile');
    $client->addScope('email');

    if(isset($_GET['code'])){
        $token = $client->fetchAccessTokenWithAuthCode($_GET['code']);
        $client->setAccessToken($token);

        //Getting User Profile
        $gauth = new Google_Service_Oauth2($client);
        $google_info = $gauth->userinfo->get();
        $email = $google_info->email;
        $username = $google_info->name;
        $name = $username;
        $password = 'google';

        $result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND role='Customer' AND not deleted;");
        if ($result->lengths){
            while($row = mysqli_fetch_array($result)){
                $user_id = $row['id'];
                $name = $row['name'];
                $role= $row['role'];
    
                $_SESSION['customer_sid']=session_id();
                $_SESSION['user_id'] = $user_id;
                $_SESSION['role'] = $role;
                $_SESSION['name'] = $name;
            }
        } else{
            $sql = "INSERT INTO users (name, username, password, email) VALUES ('$name', '$username', '$password', $email);";
            if($con->query($sql)==true){
                $user_id =  $con->insert_id;
                $sql = "INSERT INTO wallet(customer_id) VALUES ($user_id)";
                if($con->query($sql)==true){
                    $wallet_id =  $con->insert_id;
                    $cc_number = number(16);
                    $cvv_number = number(3);
                    $sql = "INSERT INTO wallet_details(wallet_id, number, cvv) VALUES ($wallet_id, $cc_number, $cvv_number)";
                    if($con->query($sql) == true){
                        $result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND role='Customer' AND not deleted;");
                        if ($result->lengths){
                            while($row = mysqli_fetch_array($result)){
                                $user_id = $row['id'];
                                $name = $row['name'];
                                $role = $row['role'];
                    
                                $_SESSION['customer_sid']=session_id();
                                $_SESSION['user_id'] = $user_id;
                                $_SESSION['role'] = $role;
                                $_SESSION['name'] = $name;
                            }
                        }
                    }
                }
            }
            
        }



    }
    
?>