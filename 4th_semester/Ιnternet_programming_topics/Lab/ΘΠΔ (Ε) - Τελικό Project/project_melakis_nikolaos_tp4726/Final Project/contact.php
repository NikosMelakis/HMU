<!DOCTYPE html>
<html>
<head>
    <title>Me Gusta</title>
    <meta charset="UTF-8">
    <link rel="icon" href="M.jpg">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
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


    <div class="set">
	
        <h2>RESERVE A TABLE, ASK FOR TODAY'S SPECIAL OR JUST SEND US A MESSAGE</h2>

    <div class="container">
        <form action="action_page.php">
      
          <label for="fname"></label>
          <input type="text" id="fname" name="firstname" placeholder="Name" required name="Name">
      
          <label for="people"></label>
          <input type="number" id="people" name="people" placeholder="How many people"required name="People">
            
          <label for="Date and Time"></label>
          <input type="datetime-local" id="date" name="date" placeholder="Date and Time"required name="Date">
      
      
          <label for="subject"></label>
          <textarea id="subject" name="subject" placeholder="Message \ Special requirements" ></textarea>
      
          <input type="submit" value="Submit">
      
        </form>
      </div>
	  </div>

      

    </body>
    </html>