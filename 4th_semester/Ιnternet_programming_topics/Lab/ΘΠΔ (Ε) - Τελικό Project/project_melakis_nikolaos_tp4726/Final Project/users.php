<?php

$dbname = "id16380854_project1";
$dbuser = "id16380854_nikos";
$passwd = "MelakisNikolaos!999";

$dbhost = "localhost";
$options = [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ];

$dsn = "mysql:host={$dbhost};dbname={$dbname};charset=utf8mb4";
$pdo = new PDO($dsn, $dbuser, $passwd, $options);

echo "Connected";

// $stmt = $pdo->query("SELECT * FROM users"); 
// $results = $stmt ->fetchALL();


// print_r($results);

// $nbr = count($results);
// echo "Βρήκα $nbr αποτελέμσατα!";

// echo "<ul>";
// foreach($results as $row) {
//     echo "<li>{$row["surname"]}</li>";

// }

// echo "</ul>";


?>
