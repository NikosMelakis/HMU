<?php

$dbname = "id16380854_project1";
$dbuser = "id16380854_nikos";
$passwd = "MelakisNikolaos!999";

$dbhost = "localhost";
$options = [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ];

$dsn = "mysql:host={$dbhost};dbname={$dbname};charset=utf8mb4";
$pdo = new PDO($dsn, $dbuser, $passwd, $options);

$hash = password_hash($pwd, PASSWORD_DEFAULT);

$stmt = $pdo->prepare("INSERT INTO users(user, pwd, name, surname) VALUES(:username, :password, :fname, :lname)");
$stmt->execute(["username"=>$_REQUEST["user"], 
"password"=>$hash, "fname"=>$_REQUEST["name"],
"lname"=>$_REQUEST["surname"]]);

$newid = $pdo->lastInsertId();
echo "User inserted with id = ".$newid;

header('Location: index.php');
?>