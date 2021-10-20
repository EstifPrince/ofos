<?php
include '../includes/connect.php';
$success=false;

$username = $_POST['username'];
$password = $_POST['password'];

$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Administrator' AND not deleted;");
while($row = mysqli_fetch_array($result))
{
	$success = true;
	$user_id = $row['id'];
	$name = $row['name'];
	$role= $row['role'];
}
if($success == true)
{	
	session_start();
	$_SESSION['admin_sid']=session_id();
	$_SESSION['user_id'] = $user_id;
	$_SESSION['role'] = $role;
	$_SESSION['name'] = $name;

	header("location: ../admin-page.php");
}
else
{
	$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Customer' AND not deleted;");
	while($row = mysqli_fetch_array($result))
	{
	$success = true;
	$user_id = $row['id'];
	$name = $row['name'];
	$role= $row['role'];
	}
	if($success == true)
	{
		session_start();
		$_SESSION['customer_sid']=session_id();
		$_SESSION['user_id'] = $user_id;
		$_SESSION['role'] = $role;
		$_SESSION['name'] = $name;			
		header("location: ../index.php");
	}
	else
	{
		$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Cashier' AND not deleted;");
		while($row = mysqli_fetch_array($result))
		{
			$success = true;
			$user_id = $row['id'];
			$name = $row['name'];
			$role= $row['role'];
		}
		if($success == true)
		{
			session_start();
			$_SESSION['cashier_sid']=session_id();
			$_SESSION['user_id'] = $user_id;
			$_SESSION['role'] = $role;
			$_SESSION['name'] = $name;			
			header("location: ../cashier-page.php");
		}
		else
		{
			$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Chef' AND not deleted;");
			while($row = mysqli_fetch_array($result))
			{
				$success = true;
				$user_id = $row['id'];
				$name = $row['name'];
				$role= $row['role'];
			}
			if($success == true)
			{
				session_start();
				$_SESSION['chef_sid']=session_id();
				$_SESSION['user_id'] = $user_id;
				$_SESSION['role'] = $role;
				$_SESSION['name'] = $name;			
				header("location: ../chef-page.php");
			}
			else
			{
				$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Waiter' AND not deleted;");
				while($row = mysqli_fetch_array($result))
				{
					$success = true;
					$user_id = $row['id'];
					$name = $row['name'];
					$role= $row['role'];
				}
				if($success == true)
				{
					session_start();
					$_SESSION['waiter_sid']=session_id();
					$_SESSION['user_id'] = $user_id;
					$_SESSION['role'] = $role;
					$_SESSION['name'] = $name;			
					header("location: ../waiter-page.php");
				}
				else
				{
					$result = mysqli_query($con, "SELECT * FROM users WHERE username='$username' AND password='$password' AND role='Manager' AND not deleted;");
					while($row = mysqli_fetch_array($result))
					{
						$success = true;
						$user_id = $row['id'];
						$name = $row['name'];
						$role= $row['role'];
					}
					if($success == true)
					{
						session_start();
						$_SESSION['manager_sid']=session_id();
						$_SESSION['user_id'] = $user_id;
						$_SESSION['role'] = $role;
						$_SESSION['name'] = $name;			
						header("location: ../manager-page.php");
					}
					else
					{
						header("location: ../login.php");
					}
				}
			}
		}
	}
}
?>