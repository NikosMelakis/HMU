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
        

    

    $sql = "INSERT INTO orders VALUES (NULL, '5', 'Istanbul', '1', '2023-02-20', '2023-02-15', '2023-02-20', '681', 'https://media.timeout.com/images/105859738/750/422/image.jpg')";


    if ($conn->query($sql) === TRUE) {
        header("Location: ../../travel-packages-in.php");
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;}

$conn->close();

?>