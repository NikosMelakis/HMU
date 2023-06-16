<!DOCTYPE html>
<html>
<head>
    <title>Me Gusta</title>
    <meta charset="UTF-8">
    <link rel="icon" href="M.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles2.css">
</head>
<body>
    <header>
        <nav>
            <!-- <img src="me-gusta_logo.png" class="logo"> -->
            <ul>
                <li><a href="index.php">HOME</a></li>
                <li><a href="annanouncements.php">ANNANOUNCEMETNS</a></li>
                <li><a href="menu.php">MENU</a></li>
                <li><a href="gallery.php">GALLERY</a></li>
                <li><a href="contact.php">CONTACT</a></li>
                
            </ul>
               
            <ul>

           <li><a href="login.php">LOG IN </a></li>

        </ul>


            
   </nav>
    </header>

        


</head>
<body>
    <div class="container">
        <!-- <h2>New Member Regisrtetion Form</h2> -->
        <form method="POST" action="do_register.php" autocomplete="off">
            <p>REGISTRETION FORM</p>
            <hr>
            <p><input required name="user" placeholder="Username" type="text"></p>
            <p><input required name="pwd" placeholder="Password" type="password"></p>
            <hr>
            <p><input required name="name" placeholder="Firtsname" type="text"></p>
            <p><input required name="surname" placeholder="Lastname" type="text"></p>
            <button type="submit">REGISTER</button>
        </form>
    </div>
</body>
</html>