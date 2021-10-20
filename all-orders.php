<?php

include 'includes/connect.php';
    if((isset($_SESSION['cashier_sid']) and $_SESSION['cashier_sid']==session_id()) or 
        (isset($_SESSION['admin_sid']) and $_SESSION['admin_sid']==session_id()) or
        (isset($_SESSION['chef_sid']) and $_SESSION['chef_sid']==session_id()) or
        (isset($_SESSION['waiter_sid']) and $_SESSION['waiter_sid']==session_id()))
	{
        include 'order-view.php';
	}
    elseif(isset($_SESSION['customer_id']) and $_SESSION['customer_id']==session_id())
    {
        header("location:orders.php");		
    }
    else{
    
        header("location:login.php");
    }
    
	
?>