<?php

$dbname = "id16380854_project1";
$dbuser = "id16380854_nikos";
$passwd = "MelakisNikolaos!999";

$dbhost = "localhost";
$options = [ PDO::ATTR_ERRMODE => PDO::ERRMODE_EXCEPTION ];

$dsn = "mysql:host={$dbhost};dbname={$dbname};charset=utf8mb4";
$pdo = new PDO($dsn, $dbuser, $passwd, $options);

$stmt = $pdo->prepare("SELECT * FROM users WHERE username="$user"");
if (!$stmt){
    $_SESSION['message']= 'Internal error';
    header('Location: index.php');
    exit;
}

$stmt->bind_param("s", $user);
$stmt->execute();
$result = $stmt->get_result();
if  ($result->num_rows == 0)
    {
        $_SESSION['message']= 'Wrong username or password';
        header('Location: index.php');
        exit;
}
$row =$result->fetch_assoc();

if (!password_verify($password, $row['pwd'])){
    $_SESSION['message']= 'Wrong username or password';
    header('Location: index.php');
    exit();
}


$_SESSION['logged']= true;
$_SESSION['id']= $row ['id'];
$_SESSION['username']= $row ['user'];

header('Location: index.php');
exit();


?>
