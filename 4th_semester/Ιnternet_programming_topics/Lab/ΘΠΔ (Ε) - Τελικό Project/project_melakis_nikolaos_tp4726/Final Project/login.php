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

</body>
</html>
    <div class="container">
        <!-- <h2>Είσοδος Χρήστη</h2> -->
        <form method="POST" action="do_login.php">
            <p><div class="form-header">LOGIN FORM</p>
            <hr>
            <p><input required name="user" placeholder="Username" type="text"></p>
            <p><input required name="pwd" placeholder="Password" type="password"></p>
            <p>Not a Member? Register <a href="register.php">HERE</a></p>
            <button type="submit"><a href="register.php">LOGIN</a></button>
        </form>
    </div>
</body>
</html>