<?php
    $username = "id20140802_bluecloud";
    $password = "R00tTr4v3l4g3ncy$";
    $dbname = "id20140802_travelagency";

    // Create connection
    $conn = new mysqli($servername, $username, $password, $dbname);
    // Check connection
    if ($conn->connect_error) {
        die("Connection failed: " . $conn->connect_error);
    } 
    
    $firstname=$_POST['firstname'];
    $lastname=$_POST['lastname'];
    $email=$_POST['email'];
    $password=$_POST['password'];
    $address=$_POST['address'];
    $city=$_POST['city'];
    $postalCode=$_POST['postalCode'];
    $mobileNum=$_POST['mobileNum'];
    
    $sql = "INSERT INTO clients VALUES ('$firstname', '$lastname', '$email', '$password', '$address', '$city', '$postalCode', '$mobileNum')";

    header("Location: ../index.html");
    if ($conn->query($sql) === TRUE) {
        header("Location: ../index.html");
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;}

$conn->close();

?>