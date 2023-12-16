<?php
session_start();
if (isset($_SESSION["username"])) {
    $username = $_SESSION["username"];
    session_write_close();
} else {
    // since the username is not set in session, the user is not-logged-in
    // he is trying to access this page unauthorized
    // so let's clear all session variables and redirect him to index
    session_unset();
    session_write_close();
    $url = "./index.php";
    // header("Location: $user-registration.php");
}

?>
<HTML>
<HEAD>
<TITLE>Welcome</TITLE>
<link href="assets/css/phppot-style.css" type="text/css"
	rel="stylesheet" />
<link href="assets/css/user-registration.css" type="text/css"
	rel="stylesheet" />
</HEAD>
<BODY>
	<div class="phppot-container">
		<div class="page-header">
			<span class="login-signup"><a href="logout.php">Logout</a></span>
		</div>
		<h2><div class="page-content">Welcome <mark style='font-size:xx-large'><?php echo $username;?><mark> </div></h2>
        <form action="result.php" method="post">
            <input type="submit" name="inner-join" value="inner-joint">
            <input type="submit" name="left-join" value="left-joint">
            <input type="submit" name="right-join" value="right-joint">
            <input type="submit" name="full-join" value="full-joint">
            <input type="submit" name="cross-join" value="cross-joint">



        <table border='1'>
            <tr>
                <th>Name</th>
                <th>Phone Number</th>
                 <th>Age</th>
            </tr>
            <?php
                 $con = mysqli_connect("localhost" ,"root" ,"" ,"kimia");
                $query = mysqli_query($con ,"select * from user");
                 while($data = mysqli_fetch_assoc($query)){
                    ?>
                        <tr>
                            <td><?php echo $data['user_name'];?></td>
                            <!-- <td><?php 
                            if($data['phone'] == null){
                                echo 'Null';
                            }else{
                                echo $data['phone'];
                            }
                            ?></td> -->
                            <!-- <td><?php
                             if($data['age'] == null){
                                echo 'Null';
                             }else{
                                echo $data['age'];
                             }
                             ?></td> -->
                        </tr>
                    <?php
                }
            ?>
        </table>

	</div>
    
</BODY>
</HTML>
