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
        

    

    $sql = "INSERT INTO orders VALUES (NULL, '7', 'Tel Aviv', '1', '2023-02-20', '2023-10-17', '2023-10-20', '755', 'https://media-cldnry.s-nbcnews.com/image/upload/t_fit-1500w,f_auto,q_auto:best/rockcms/2021-12/211201-tel-aviv-mb-1113-a1eae5.jpg')";


    if ($conn->query($sql) === TRUE) {
        header("Location: ../../travel-packages-in.php");
    } 
    else {
        echo "Error: " . $sql . "<br>" . $conn->error;}

$conn->close();

?>