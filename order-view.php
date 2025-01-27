<!DOCTYPE html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="msapplication-tap-highlight" content="no">
    <title>All orders</title>

    <!-- Favicons-->
    <link rel="icon" href="images/favicon/favicon-32x32.png" sizes="32x32">
    <!-- Favicons-->
    <link rel="apple-touch-icon-precomposed" href="images/favicon/apple-touch-icon-152x152.png">
    <!-- For iPhone -->
    <meta name="msapplication-TileColor" content="#00bcd4">
    <meta name="msapplication-TileImage" content="images/favicon/mstile-144x144.png">
    <!-- For Windows Phone -->


    <!-- CORE CSS-->
    <link href="css/materialize.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <link href="css/style.min.css" type="text/css" rel="stylesheet" media="screen,projection">
    <!-- Custome CSS-->
    <link href="css/custom/custom.min.css" type="text/css" rel="stylesheet" media="screen,projection">

    <!-- INCLUDED PLUGIN CSS ON THIS PAGE -->
    <link href="js/plugins/perfect-scrollbar/perfect-scrollbar.css" type="text/css" rel="stylesheet"
        media="screen,projection">

</head>

<body>
    <!-- Start Page Loading -->
    <div id="loader-wrapper">
        <div id="loader"></div>
        <div class="loader-section section-left"></div>
        <div class="loader-section section-right"></div>
    </div>
    <!-- End Page Loading -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START HEADER -->
    <header id="header" class="page-topbar">
        <!-- start header nav-->
        <div class="navbar-fixed">
            <nav class="navbar-color">
                <div class="nav-wrapper">
                    <ul class="left">
                        <li>
                            <h1 class="logo-wrapper"><a href="index.php" class="brand-logo darken-1"><img
                                        src="images/materialize-logo.png" alt="logo"></a> <span
                                    class="logo-text">Logo</span></h1>
                        </li>
                    </ul>
                    <ul class="right hide-on-med-and-down">   
                        <li><a href="all-orders.php" class="waves-effect waves-block waves-light speak-btn"><i
                      class="mdi-communication-message"><label style="font-size: 50%; color: #fff">0</label></i></a></li>                      
                    </ul>
                </div>
            </nav>
        </div>
        <!-- end header nav-->
    </header>
    <!-- END HEADER -->

    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START MAIN -->
    <div id="main">
        <!-- START WRAPPER -->
        <div class="wrapper">

            <!-- START LEFT SIDEBAR NAV-->
            <?php
                //Customer 
                if(isset($_SESSION['customer_sid'])){
                    include 'left_sidebar/customer-sidebar.php';
                }
                //Waiter
                else if(isset($_SESSION['waiter_sid'])){
                    include 'left_sidebar/waiter-sidebar.php';
                }
                //Chef
                else if(isset($_SESSION['chef_sid'])){
                    include 'left_sidebar/chef-sidebar.php';
                }
                //Cashier
                else if(isset($_SESSION['cashier_sid'])){
                    include 'left_sidebar/cashier-sidebar.php';
                }
                //Admin
                else if(isset($_SESSION['admin_sid']) || isset($_SESSION['manager_sid'])){
                    include 'left_sidebar/admin-sidebar.php';
                }
            ?>
            <!-- END LEFT SIDEBAR NAV-->

            <!-- //////////////////////////////////////////////////////////////////////////// -->

            <!-- START CONTENT -->
            <section id="content">

                <!--breadcrumbs start-->
                <div id="breadcrumbs-wrapper">
                    <div class="container">
                        <div class="row">
                            <div class="col s12 m12 l12">
                                <h5 class="breadcrumbs-title">All Orders</h5>
                            </div>
                        </div>
                    </div>
                </div>
                <!--breadcrumbs end-->


                <!--start container-->
                <div class="container">
                    <p class="caption">List of orders by customers with details</p>
                    <div class="divider"></div>
                    <!--editableTable-->
                    <div id="work-collections" class="seaction">

                        <?php
					if(isset($_GET['status'])){
						$status = $_GET['status'];
					}
					else{
						$status = '%';
					}
					$sql = mysqli_query($con, "SELECT * FROM orders WHERE status LIKE '$status';");
					echo '<div class="row">
                <div>
                    <h4 class="header">List</h4>
                    <ul id="issues-collection" class="collection">';
					while($row = mysqli_fetch_array($sql))
					{
						$status = $row['status'];
                        $deleted = $row['deleted'];
                        if(isset($_SESSION['admin_sid']) or
                            isset($_SESSION['cashier_sid']) or
                            isset($_SESSION['manager_sid']))
                        {
                            echo '<li class="collection-item avatar">
                                <i class="mdi-content-content-paste red circle"></i>
                                <span class="collection-header">Order No. '.$row['id'].'</span>
                                <p><strong>Date:</strong> '.$row['date'].'</p>
                                <p><strong>Payment Type:</strong> '.$row['payment_type'].'</p>							  
                                <p><strong>Status:</strong> '.($deleted ? $status : '
                                <form method="post" action="routers/edit-orders.php">
                                    <input type="hidden" value="'.$row['id'].'" name="id">
                                    <select name="status">
                                    <option value="Yet to be delivered" '.($status=='Yet to be delivered' ? 'selected' : '').'>Yet to be delivered</option>
                                    <option value="Cancelled by Admin" '.($status=='Cancelled by Admin' ? 'selected' : '').'>Cancelled by Admin</option>
                                    <option value="Paused" '.($status=='Paused' ? 'selected' : '').'>Paused</option>								
                                    </select>
                                ').'</p>
                                <a href="#" class="secondary-content"><i class="mdi-action-grade"></i></a>
                                </li>';
                        } 
                        elseif(isset($_SESSION['chef_sid'])){
                            echo '<li class="collection-item avatar">
                                <i class="mdi-content-content-paste red circle"></i>
                                <span class="collection-header">Order No. '.$row['id'].'</span>
                                <p><strong>Date:</strong> '.$row['date'].'</p>
                                <p><strong>Payment Type:</strong> '.$row['payment_type'].'</p>							  
                                <p><strong>Status:</strong> '.($deleted ? $status : '
                                <form method="post" action="routers/edit-orders.php">
                                    <input type="hidden" value="'.$row['id'].'" name="id">
                                    <select name="status">
                                    <option value="Yet to be delivered" '.($status=='Yet to be delivered' ? 'selected' : '').'>Yet to be delivered</option>
                                    <option value="Ready" '.($status=='Ready' ? 'selected' : '').'>Ready</option>
                                    								
                                    </select>
                                ').'</p>
                                <a href="#" class="secondary-content"><i class="mdi-action-grade"></i></a>
                                </li>';
                        }
                        elseif(isset($_SESSION['waiter_sid'])){
                            echo '<li class="collection-item avatar">
                                <i class="mdi-content-content-paste red circle"></i>
                                <span class="collection-header">Order No. '.$row['id'].'</span>
                                <p><strong>Date:</strong> '.$row['date'].'</p>
                                <p><strong>Payment Type:</strong> '.$row['payment_type'].'</p>							  
                                <p><strong>Status:</strong> '.($deleted ? $status : '
                                <form method="post" action="routers/edit-orders.php">
                                    <input type="hidden" value="'.$row['id'].'" name="id">
                                    <select name="status">

                                    <option value="Ready" '.($status=='Ready' ? 'selected' : '').'>Ready</option>
                                    <option value="Yet to be delivered" '.($status=='Yet to be delivered' ? 'selected' : '').'>Yet to be delivered</option>
                                    <option value="Delivered" '.($status=='Delivered' ? 'selected' : '').'>Delivered</option>
                                    								
                                    </select>
                                ').'</p>
                                <a href="#" class="secondary-content"><i class="mdi-action-grade"></i></a>
                                </li>';
                        }


						$order_id = $row['id'];
						$customer_id = $row['customer_id'];
						$sql1 = mysqli_query($con, "SELECT * FROM order_details WHERE order_id = $order_id;");
						$sql3 = mysqli_query($con, "SELECT * FROM users WHERE id = $customer_id;");
							while($row3 = mysqli_fetch_array($sql3))
							{
							echo '<li class="collection-item">
                            <div class="row">
							<p><strong>Name: </strong>'.$row3['name'].'</p>
							<p><strong>Address: </strong>'.$row['address'].'</p>
							'.($row3['contact'] == '' ? '' : '<p><strong>Contact: </strong>'.$row3['contact'].'</p>').'	
							'.($row3['email'] == '' ? '' : '<p><strong>Email: </strong>'.$row3['email'].'</p>').'		
							'.(!empty($row['description']) ? '<p><strong>Note: </strong>'.$row['description'].'</p>' : '').'								
                            </li>';							
							}
						while($row1 = mysqli_fetch_array($sql1))
						{
							$item_id = $row1['item_id'];
							$sql2 = mysqli_query($con, "SELECT * FROM items WHERE id = $item_id;");
							while($row2 = mysqli_fetch_array($sql2))
								$item_name = $row2['name'];
							echo '<li class="collection-item">
                            <div class="row">
                            <div class="col s7">
                            <p class="collections-title"><strong>#'.$row1['item_id'].'</strong> '.$item_name.'</p>
                            </div>
                            <div class="col s2">
                            <span>'.$row1['quantity'].' Pieces</span>
                            </div>
                            <div class="col s3">
                            <span>ETB. '.$row1['price'].'</span>
                            </div>
                            </div>
                            </li>';
						}
								echo'<li class="collection-item">
                                        <div class="row">
                                            <div class="col s7">
                                                <p class="collections-title"> Total</p>
                                            </div>
                                            <div class="col s2">
											<span> </span>
                                            </div>
                                            <div class="col s3">
                                                <span><strong>ETB. '.$row['total'].'</strong></span>
                                            </div>';										
								if(!$deleted){
								echo '<button class="btn waves-effect waves-light right submit" type="submit" name="action">Change Status
                                              <i class="mdi-content-clear right"></i> 
										</button>
										</form>';
								}
								echo'</div></li>';
					}
					?>
                        </ul>
                    </div>
                </div>
        </div>
    </div>
    <!--end container-->

    </section>
    <!-- END CONTENT -->
    </div>
    <!-- END WRAPPER -->

    </div>
    <!-- END MAIN -->



    <!-- //////////////////////////////////////////////////////////////////////////// -->

    <!-- START FOOTER -->
    <?php
        include 'footer.php'
    ?>
    <!-- END FOOTER -->



    <!-- ================================================
    Scripts
    ================================================ -->

    <!-- jQuery Library -->
    <script type="text/javascript" src="js/plugins/jquery-1.11.2.min.js"></script>
    <!--angularjs-->
    <script type="text/javascript" src="js/plugins/angular.min.js"></script>
    <!--materialize js-->
    <script type="text/javascript" src="js/materialize.min.js"></script>
    <!--scrollbar-->
    <script type="text/javascript" src="js/plugins/perfect-scrollbar/perfect-scrollbar.min.js"></script>
    <!--plugins.js - Some Specific JS codes for Plugin Settings-->
    <script type="text/javascript" src="js/plugins.min.js"></script>
    <!--custom-script.js - Add your own theme custom JS-->
    <script type="text/javascript" src="js/custom-script.js"></script>
</body>

</html>