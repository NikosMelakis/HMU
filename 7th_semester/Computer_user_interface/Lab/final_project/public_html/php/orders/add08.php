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
        

    

    $sql = "INSERT INTO orders VALUES (NULL, '8', 'Casablanca', '1', '2023-02-20', '2023-11-16', '2023-11-20', '600', 'https://cdn.britannica.com/16/177616-050-0167E767/Casablanca-Morocco.jpg')";


    if ($conn->query($sql) === TRUE) {
        header("Location: ../../travel-packages-in.php");
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;}

$conn->close();

?>