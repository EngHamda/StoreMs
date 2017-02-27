<?php
$servername = "localhost";
$user_name = "root";
$password = "ROOT";
$dbname = "StoreMS";

// Create connection
$conn = new mysqli($servername, $user_name, $password,$dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
} 
// echo "Connected successfully";


//Check form not null, with exsit user
	// if (isset($_POST['email']) ) ==> $_POST alaways is set
if (!empty($_POST['email']) && !empty($_POST['passwd']) )
{
    // get user data from database

    //$sql = "SELECT user_fname, user_mname, user_lname FROM user where user_email = ".$_POST['email']." and user_passwd = ".$_POST['passwd'];===> get error why??
    $sql = "SELECT user_fname, user_mname, user_lname, store_Id FROM user where user_email = '".$_POST['email']."' and user_passwd = ".$_POST['passwd'];
    $result = $conn->query($sql);

    // output data of each row
    while($row = $result->fetch_assoc()) {
        $username = $row["user_fname"]." ".$row["user_mname"]." ".$row["user_lname"];
        $store = $row["store_Id"];
    }
    // $result->free();

	//get storename 
	$sql = "SELECT store_name FROM store where id = ".$store;
    $result = $conn->query($sql);

    // output data of each row
    while($row = $result->fetch_assoc()) {
        $storename = $row["store_name"];
    }

    // get categories
    $sql = "SELECT * FROM category";
    $result = $conn->query($sql);

    // output data of each row
    $categories= [];
    while($row = $result->fetch_assoc()) {
    	array_push($categories, $row["name"]);
    }
    // var_dump($categories);

    // get  models
    $sql = "SELECT * FROM model where store_id= ".$store;
    $result = $conn->query($sql);

    // output data of each row
    $models= [];
    while($row = $result->fetch_assoc()) {
    	array_push($models, $row["model_name"]);
    }
    // get requests
    $sql = "SELECT * FROM request where store_id= ".$store; // need attr. is_received
    $result = $conn->query($sql);

    // output data of each row
    $requests= [];
    while($row = $result->fetch_assoc()) {
    	array_push($requests, $row["id"]);
    }
    

    // get complaints



    $result->free();







    require 'index.html';
}else
{
	echo "You must Enter your email & your password.";
}
