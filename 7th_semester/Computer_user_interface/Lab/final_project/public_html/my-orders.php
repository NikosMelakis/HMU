<?php
include("php/connect_db.php")
?>

<!DOCTYPE html>
<html lang="en">

  <head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>MY ORDERS | BLUE CLOUD</title>
    <link rel="icon" type="image/x-icon" href="assets/logos/cloud.png" />
    <link rel="stylesheet" href="css/stylesheet.css" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css"
      integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css"
      integrity="sha384-xeJqLiuOvjUBq3iGOjvSQSIlwrpqjSHXpduPd6rQpuiM3f5/ijby8pCsnbu5S81n" crossorigin="anonymous" />
    <script src=" https://code.jquery.com/jquery-3.3.1.slim.min.js"
      integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js"
      integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
      crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js"
      integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
      crossorigin="anonymous"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet"
      crossorigin="anonymous" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js"
      crossorigin="anonymous"></script>

    <!-- Our Javascript -->
    <script src="js/mainPage.js"></script>
    <script src="js/scrollPage.js"></script>
    <script src="js/scrollBehavior.js"></script>
  </head>

  <body>
    <!-- navbar -->
    <nav class="navbar navbar-light navbar-expand-md bg-faded justify-content" id="navbar_top">
      <a href="home.html" class="navbar-brand">
        <img src="assets/logos/cloud.png" width="50" />
        BLUE CLOUD
      </a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
        <ul class="nav navbar-nav ml-auto w-100 justify-content-start">
          <li class="nav-item">
            <a class="nav-link" href="travel-packages-in.php">Travel Packages</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="contact-in.html">Contact</a>
          </li>
        </ul>
        <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
          <li class="nav-item">
            <a class="nav-link active" href="my-orders.php">My Orders</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="travel-packages.php">Log Out</a>
          </li>
        </ul>
      </div>
    </nav>

    <!-- header and text -->
    <header class=" page-header header container-fluid">
      <div class="overlay">
        <div class="description">
          <h1>My Orders</h1>
          <a class="btn btn-lg" href="#travels" id="aButton">See All</a>
        </div>
      </div>
    </header>

    <div id="travels"></div>

        <!-- Payment modal -->
        <div class="modal fade" id="payment" tabindex="-1" role="dialog"
            aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                    </div>
                <div class="modal-body">
                    <div class="card-body p-5 text-center">
                            <h5>Payment was successfull!<br>Thank you!</h5>
                        </div>
                    </div>
                </div>
            </div>
        </div>
            <section class="travelPacks">

              <h4>Planned Trips</h4>
                  
                    <div class="card-deck" id="card">

                     
                      <?php
                      $sql = "select * from orders where id=1";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title"><?php echo $data['packageName'] ?></h5>
                          <ul class="list-group list-group-flush" id="travelPacksCards">
                            <li class="list-group-item">
                              <i class="bi bi-calendar-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal">
                                From: <?php echo $data['fromDate'] ?><br>To: <?php echo $data['toDate'] ?>
                              </p>
                            </li>
                            <li class="list-group-item">
                              <i class="bi bi-tag-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal"><?php echo $data['price'] ?>€</p>
                            </li>
                          </ul>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from orders where id=2";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title"><?php echo $data['packageName'] ?></h5>
                          <ul class="list-group list-group-flush" id="travelPacksCards">
                            <li class="list-group-item">
                              <i class="bi bi-calendar-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal">
                                From: <?php echo $data['fromDate'] ?><br>To: <?php echo $data['toDate'] ?>
                              </p>
                            </li>
                            <li class="list-group-item">
                              <i class="bi bi-tag-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal"><?php echo $data['price'] ?>€</p>
                            </li>
                          </ul>
                        </div>
                      </div>

                    <?php
                      $sql = "select * from orders where id=3";
                      $result = $conn->query($sql);

                      if ($result){
                        $data = $result->fetch_assoc()
                      
                      ?>
                        
                    
                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title"> <?php echo $data['packageName'] ?></h5>
                          <ul class="list-group list-group-flush" id="travelPacksCards">
                            <li class="list-group-item">
                              <i class="bi bi-calendar-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal">
                                From: <?php echo $data['fromDate'] ?><br>To: <?php echo $data['toDate'] ?>
                              </p>
                            </li>
                            <li class="list-group-item">
                              <i class="bi bi-tag-fill" id="travelIcons"> </i>
                              <p class="card-text fw-normal"><?php echo $data['price'] ?>€</p>
                            </li>
                          </ul>
                        </div>
                        <?php
                          
                      }
                        ?>

                      </div>

            </section>
                    <div class="cont">
                    <a class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#payment">
                            Pay Now
                          </a>
                    </div>

    <!-- Footer -->
    <footer>
      <div class="container">
        <footer class="py-5">
          <div class="row">
            <div class="col-6 col-md-2 mb-3">
              <h5>Section</h5>
              <ul class="nav flex-column">
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Home</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Features</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Pricing</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">FAQs</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">About</a>
                </li>
              </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
              <h5>Section</h5>
              <ul class="nav flex-column">
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Home</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Features</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Pricing</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">FAQs</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">About</a>
                </li>
              </ul>
            </div>

            <div class="col-6 col-md-2 mb-3">
              <h5>Section</h5>
              <ul class="nav flex-column">
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Home</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Features</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">Pricing</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">FAQs</a>
                </li>
                <li class="nav-item mb-2">
                  <a href="#" class="nav-link p-0 text-muted">About</a>
                </li>
              </ul>
            </div>

            <div class="col-md-5 offset-md-1 mb-3">
              <form action="php/newsletter.php" method="post">
                <h5>Subscribe to our newsletter</h5>
                <p>Monthly digest of what's new and exciting from us.</p>
                <div class="d-flex flex-column flex-sm-row w-100 gap-2">
                  <input id="newsletter" type="email" class="form-control" placeholder="Email address" required />
                  <button class="btn btn-sm" type="submit" id="newsBtn">
                    Subscribe
                  </button>
                </div>
              </form>
            </div>
          </div>

          <div class="d-flex flex-column flex-sm-row justify-content-between py-4 my-4 border-top" id="socialLinks">
            <p>&copy; 2022 Blue Cloud Travel Agency. All rights reserved.</p>
            <ul class="list-unstyled d-flex justify-content-between py-3 my-3" id="socialIcons">
              <a href="www.google.com"><i class="bi bi-google"></i></a>
              <a href="www.facebook.com"><i class="bi bi-facebook"></i></a>
              <a href="www.instagram.com"><i class="bi bi-instagram"></i></a>
              <a href="www.twitter.com"><i class="bi bi-twitter"></i></a>
            </ul>
          </div>
        </footer>
      </div>
    </footer>
    <!-- scroll top button -->
    <button type="button" class="btn btn-danger btn-floating btn-lg" id="btn-back-to-top">
      ᐱ
    </button>
    <script src="js/scrollTop.js"></script>
    
    <script>
        const btn = document.getElementById("newsBtn");
        btn.addEventListener('click', function handleClick(){
                btn.textContent='Paid';
            });
    </script>

    

    
  </body>

</html>
