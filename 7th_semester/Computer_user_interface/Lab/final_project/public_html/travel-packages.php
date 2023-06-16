<?php
include("php/connect_db.php")
?>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8" />
  <meta http-equiv="X-UA-Compatible" content="IE=edge" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>TRAVEL PACKAGES | BLUE CLOUD</title>
  <link rel="icon" type="image/x-icon" href="assets/logos/cloud.png" />
  <link rel="stylesheet" href="css/stylesheet.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.9.1/font/bootstrap-icons.css" integrity="sha384-xeJqLiuOvjUBq3iGOjvSQSIlwrpqjSHXpduPd6rQpuiM3f5/ijby8pCsnbu5S81n" crossorigin="anonymous" />
  <script src=" https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.7/dist/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.3.1/dist/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/css/bootstrap.min.css" rel="stylesheet" crossorigin="anonymous" />
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta2/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>

  <!-- Our Javascript -->
  <script src="js/mainPage.js"></script>
  <script src="js/scrollPage.js"></script>
  <script src="js/scrollBehavior.js"></script>
</head>

<body>
  <!-- navbar -->
  <nav class="navbar navbar-light navbar-expand-md bg-faded justify-content" id="navbar_top">
    <a href="index.html" class="navbar-brand"><img src="assets/logos/cloud.png" width="50" /> BLUE CLOUD</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#collapsingNavbar3">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="navbar-collapse collapse w-100" id="collapsingNavbar3">
      <ul class="nav navbar-nav ml-auto w-100 justify-content-start">
        <li class="nav-item">
          <a class="nav-link active" href="travel-packages.php">Travel Packages</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="contact.html">Contact</a>
        </li>
      </ul>
      <ul class="nav navbar-nav ml-auto w-100 justify-content-end">
        <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter1">Log In</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="#" data-toggle="modal" data-target="#exampleModalCenter2">Register</a>
        </li>
        </ul>
      </div>
    </nav>

    <!-- header and text -->
    <header class=" page-header header container-fluid">
            <div class="overlay">
              <div class="description">
                <h1>Travel Packages</h1>
                <a class="btn btn-lg" href="#travels" id="aButton">See More</a>
              </div>
            </div>
            </header>

            <div id="travels"></div>

               <!-- Login Modal -->
    <div class="modal fade" id="exampleModalCenter1" tabindex="-1" role="dialog"
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

              <h3 class="mb-5">Sign in</h3>
              <form action="php/login.php" method="post">
                <div class="form-outline mb-4">
                  <input type="email" name="email" id="email" class="form-control form-control-lg" placeholder="Email"
                    required />
                </div>

                <div class="form-outline mb-4">
                  <input type="password" name="password" id="password" class="form-control form-control-lg"
                    placeholder="Password" required />
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-start mb-4">
                  <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                  <label class="form-check-label" for="form1Example3"> Remember
                    password
                  </label>
                </div>

                <button class="btn btn-primary btn-lg btn-block" type="submit" id="newsBtn">Login</button>
              </form>
              <hr class="my-4">
              <label class="form-check-label" for="form1Example3">Not a member? <a href="index.html" data-toggle="modal" data-target="#exampleModalCenter2">Register</a>
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>

    <!-- Register Modal -->
    <div class="modal fade" id="exampleModalCenter2" tabindex="-1" role="dialog"
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

              <h3 class="mb-5">Register</h3>
              <form action="php/registration.php" method="post">
                <div class="form-outline mb-4">
                  <input type="text" name="firstname" id="firstname" class="form-control form-control-lg"
                    placeholder="First Name" required />
                </div>

                <div class="form-outline mb-4">
                  <input type="text" name="lastname" id="lastname" class="form-control form-control-lg"
                    placeholder="Last Name" required />
                </div>

                <div class="form-outline mb-4">
                  <input type="email" name="email" id="email" class="form-control form-control-lg" placeholder="Email"
                    required />
                </div>

                <div class="form-outline mb-4">
                  <input type="password" name="password" id="password" class="form-control form-control-lg"
                    placeholder="Password" required />
                </div>

                <div class="form-outline mb-4">
                  <input type="password" name="confirm_password" id="confirm_password"
                    class="form-control form-control-lg" placeholder="Confirm Password" required />
                </div>


                <div class="form-outline mb-4">
                  <input type="text" name="address" id="address" class="form-control form-control-lg"
                    placeholder="Address" required />
                </div>


                <div class="form-outline mb-4">
                  <input type="text" name="city" id="city" class="form-control form-control-lg" placeholder="City"
                    required />
                </div>

                <div class="form-outline mb-4">
                  <input type="tel" name="postalCode" id="postalCode" class="form-control form-control-lg"
                    pattern="[0-9]{5}" placeholder="Postcode" required />
                </div>


                <div class="form-outline mb-4">
                  <input type="tel" name="mobileNum" id="mobileNum" class="form-control form-control-lg"
                    pattern="[0-9]{10}" placeholder="Phone Number" required />
                </div>

                <!-- Checkbox -->
                <div class="form-check d-flex justify-content-start mb-4">
                  <input class="form-check-input" type="checkbox" value="" id="form1Example3" />
                  <label class="form-check-label" for="form1Example3"> Remember
                    password
                  </label>
                </div>

                <button class="btn btn-primary btn-lg btn-block" type="submit" id="newsBtn"
                  name="register">Register</button>
              </form>
              <hr class="my-4">
              <label class="form-check-label" for="form1Example3">Already a member? <a href="index.html" data-toggle="modal" data-target="#exampleModalCenter1">Log
                  In</a>
              </label>
            </div>
          </div>
        </div>
      </div>
    </div>



            <section class="travelPacks">

              <h4>Our Packages</h4>

              <!-- Travel Packages in minimal pagination grouo with an active carousel with arrow and button navigation -->
              <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
                <ol class="carousel-indicators">
                  <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
                  <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
                </ol>


                <div class="carousel-inner">
                  <div class="carousel-item active">
                    <div class="card-deck" id="card">

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 1";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Athens</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 2";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Hydra</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 3";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Naxos</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 4";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Santorini</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                    </div>
                  </div>


                  <div class="carousel-item">
                    <div class="card-deck" id="card">

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 5";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Istanbul</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 6";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Rome</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 7";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Tel Aviv</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 8";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Casablanca</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                    </div>
                  </div>

                  <div class="carousel-item">
                    <div class="card-deck" id="card">

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 9";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Dubrovnik</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 10";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Cairo</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 11";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Dubai</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                      <?php
                      $sql = "select * from travelpackages WHERE packageid = 12";
                      $result = $conn->query($sql);

                      if ($result)
                        $data = $result->fetch_assoc()
                      ?>

                      <div class="card border-secondary">
                        <img class="card-img-top" src="<?php echo $data['photoURL'] ?>" alt="Card image cap" style="height:100%" />
                        <div class="card-body">
                          <h5 class="card-title">Vacation To Queen Alia</h5>
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
                        <div class="card-footer" id="card-footer">
                          <button href="#" class="btn btn-md" id="newsBtn" data-toggle="modal" data-target="#exampleModalCenter1">
                            Buy Now
                          </button>
                        </div>
                      </div>

                    </div>
                  </div>


                </div>


                <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev" id="carousel-control-prev">
                  <p id="carousel-control">
                    <</p>
                </a>
                <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next" id="carousel-control-next">
                  <p id="carousel-control">></p>
                </a>
              </div>
            </section>


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
</body>

</html>