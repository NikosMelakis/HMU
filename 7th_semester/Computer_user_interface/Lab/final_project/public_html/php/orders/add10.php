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
        

    

    $sql = "INSERT INTO orders VALUES (NULL'10', 'Cairo', '1', '2023-02-20', '2023-09-10', '2023-09-18', '765', 'https://dynamic-media-cdn.tripadvisor.com/media/photo-o/03/9b/2f/5b/cairo.jpg?w=700&h=500&s=1')";


    if ($conn->query($sql) === TRUE) {
        header("Location: ../../travel-packages-in.php");
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;}

$conn->close();

?>