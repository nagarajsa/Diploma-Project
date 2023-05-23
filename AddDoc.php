<?php
$email = $_POST ['email'];
$fname = $_POST ['fname'];
$lname = $_POST ['lname'];
$state = $_POST ['state'];
$userPassword = $_POST ['password'];
$gender = $_POST ['element_7'];
$phone = $_POST ['phone'];
$role = 'doctor';
$date = $_POST ['date'];
$streetaddress = $_POST ['address'];
$city = $_POST ['city'];
$state = $_POST ['state'];
$pincode = $_POST ['postal'];
$specs = $_POST ['specs'];
$start = $_POST ['start'];
$end = $_POST ['end'];

$servername = "localhost";
$username = "root";
$password = "";
$database = "oda";

$conn = mysqli_connect ( $servername, $username, $password );
mysqli_select_db ( $conn, $database );

if (! $conn) {
	die ( "Connection failed: " . mysqli_connect_error () );
}

$sql = "INSERT INTO person (city, dob, email,fname,gender,lname,pincode,role,state,streetaddress,phonenumber)
		VALUES ('$city', '$date', '$email','$fname','$gender','$lname','$pincode','$role','$state','$streetaddress','$phone') ";
$get = mysqli_query ( $conn, $sql ) or die("Cannot Insert Query1...! ".mysqli_error($conn));

$sql = "INSERT INTO login (email,password,role) VALUES ('$email','$userPassword','$role') ";
$get = mysqli_query ( $conn, $sql ) or die("Cannot Insert Query2...! ".mysqli_error($conn));

$sql = "INSERT INTO doctor (email, starttime, endtime, specialist) VALUES ('$email','$start','$end','$specs') ";
$get = mysqli_query ( $conn, $sql ) or die("Cannot Insert Query3...! ".mysqli_error($conn));

session_start ();
$_SESSION ['Done'] = $fname;
header('Location:Home.php');
?>
