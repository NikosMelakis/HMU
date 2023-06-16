<?php
$servername = "localhost";
$username = "id20140802_bluecloud";
$password = "R00tTr4v3l4g3ncy$";
$dbname = "id20140802_travelagency";

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);
// Check connection
if ($conn->connect_error) {
  die("Connection failed: " . $conn->connect_error);
} 

?>