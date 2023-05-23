<?php
session_start ();
if (empty ( $_SESSION ['email'] ))
	header ( 'Location:Login.php' );
@$spec_name = $_GET ['spec_name'];
$drId = $_REQUEST ["drId"];
$hist1 = $_REQUEST ["hist"];
$upc1 = $_REQUEST ["upc"];

$servername = "localhost";
$username = "root";
$password = "";
$database = "oda";

$conn = mysqli_connect ( $servername, $username, $password );
mysqli_select_db ( $conn, $database );

if (! $conn)
{
	die ( "Connection failed: " . mysqli_connect_error () );
}



if ($hist1 == 1) 
{
	$query = "SELECT appointment.appid, appointment.patientid, person.fname, person.lname, appointment.date, appointment.prescription FROM appointment inner join patient on appointment.patientid=patient.patientid INNER JOIN person on patient.email=person.email where doctorid=$drId and date <= CURDATE() ORDER BY appointment.date DESC";
	$get = mysqli_query ( $conn, $query );
	$hist = mysqli_fetch_all ( $get );
		
		echo "<form action='AdminHome.php' method='POST'>";
	if ($hist && count ( $hist ) > 0)
	{
		echo "
				<table id='tg-cHuKU1' class='tg'>
									<tr>
										<th>AppID</th>
										<th>Patient</th>
										<th>Date</th>
										<th>Prescription</th>
										<th>Payment</th>
									</tr>";
		
		foreach ( $hist as $app ) 
		{
			echo "<tr>
					<td>$app[0]</td>
					<td>$app[1] - $app[2] $app[3]</td>
					<td>$app[4]</td>
					<td>$app[5]</td>";

			$queryPayment = "select * from paymenthistory where appid=$app[0]";
			$getPayment = mysqli_query ( $conn, $queryPayment );
			$payment = mysqli_fetch_array ( $getPayment );
			$amount = $payment ['amount'];
			
			
			echo "<td>$amount</td>";
			echo "</tr>";
		}
			echo "<tr></br>
					<td colspan='5' align='center'>
						<input type='text' name='Appid' size='3' maxlength='3' required/>
						<input type='text' name='Amnt' required/>&nbsp;&nbsp;&nbsp;&nbsp;
						<input type='submit' class='btn1' value='Save' name='submit' onclick='refresh();'/>
				  	</td>
				  </tr>";
			echo "</table></form>";
	} 
	else 
	{
		echo "<p>No appointment history</p>";
	}
} else if ($upc1 == 1) {
	$queryUpc = "SELECT appointment.patientid, person.fname, person.lname, appointment.date, TIME_FORMAT(appointment.time, '%H:%i'),  appointment.appid FROM appointment inner join patient on appointment.patientid=patient.patientid INNER JOIN person on patient.email=person.email where doctorid=$drId and date > CURDATE() ORDER BY appointment.date, appointment.time";
	$getUpc = mysqli_query ( $conn, $queryUpc );
	$upc = mysqli_fetch_all ( $getUpc );
	if (count ( $upc ) > 0) {
		echo "
				<table id='tg-cHuKU' class='tg'>
									<tr>
										<th>Patient</th>
										<th>Date</th>
										<th>Time</th>
										<th></th>
									</tr>";
		
		foreach ( $upc as $app ) {
			echo "<tr><td>$app[0] - $app[1] $app[2]</td><td>$app[3]</td><td>$app[4]</td>";
			echo "<td><a href='MakeAppointment.php?appId=" . $app [5] . "'>Change</a><br />";
			echo "<a href='CancelApp.php?appId=" . $app [5] . "'>Cancel</a></td></tr>";
		}
		echo "</table>";
	} else {
		echo "<p>No upcoming appointments</p>";
	}
}
?>