<?php
session_start();

if(isset($_SESSION["username"])){
    $username = $_SESSION["username"];
    $tipoAccount = $_SESSION["account"];
}
?>



<html>
    <head>
         <link rel="stylesheet" href="navbar/navbar.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
        <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="images/icon-web.png">
        <script src="navbar/navbar.js" defer></script>
        <script src="search.js" defer></script>  
        <link rel="stylesheet" href="search.css">
    </head>
    <body>
      

        <!-- HEADER -->
      <header> 
        
        <!-- NAVBAR -->
         <div class="topnav">
              
              <div id="myNav" class="topbar">
                    <a> &#9776; </a>
               </div>

               <div  class="topbar-overlay" id="overlay">
                <div class="topbar-content">
                  <a href="#" class="closebtn" >&times; </a>
                  <a href="index.php">juventus.com</a>
                  <a href="maglieGara.php">j|Maglie Gara</a>
                  <a href="kitGara.php">j|Kit Gara</a>
                  <a href="allenamento.php">j|Allenamento</a>
                  <a href="abbigliamento.php">j|Abbigliamento</a>
                  <a href="accessori.php">j|Accessori</a>
                  <a href="giocatori.php">j|Giocatori</a>
                </div>
              </div>

         
              <div class="logo">
                   <a href="index.php"><img src="images/logo-j.svg" class="logo" alt="Juventus"></a>
              </div>
           
              <div class="namehome">
                  <h1>
                     <strong >Juventus</strong>
                     <span>Official Online Store</span>
                 </h1>
              </div>

              <!-- DROPDOWN MENU' -->

                      <select class="dropdown">
                            <option value="it">Italiano</option>
                            <option value="en">Inglese</option>
                            <option value="fr">Francese</option>
                      </select>

            
                      <div class="icon">
                          <a class="account-icon"> <img src="images/icon-account.png"> </a>
                          <div id="menuAccount" class="menu-account">
                              <?php if(isset($username)): ?>
                                  <?php echo "<h1>Bentornato $username!</h1>";   ?>
                                                      
                                  <?php if($tipoAccount == 1): ?>
                                    <a href="amministration.php">Amministrazione</a>
                                <?php endif; ?>

                                  <a href="logout.php" class="logout-button">Logout</a>
                              <?php else: ?>
                                  <a href="login.php">Login</a>
                                  <a href="registration.php">Registrazione</a>
                              <?php endif; ?>
                          </div>
                              <a class="cuore-icon"  href="preferiti.php"> <img src="images/cuore.png"></a> <span id="preferiti-icon" class="quantity-badge-favorite"></span> 
                              <a class="carrello-icon" href="carrello.php"> <img src="images/carrello.png">  </a><span id="carrello-icon" class="quantity-badge-cart"></span>
                        </div>




                <!--  SEARCHBAR -->

                <div class="search-container">
                  <form onsubmit="return false;">
                      <div class="box-search">
                          <input type="text" placeholder="CERCA..." id="search" onkeyup="searchProducts()">
                          <button type="submit"><i class="fa fa-search"></i></button>
                      </div>
                      <div class="dropdown-content" id="dropdown-content"></div>
                  </form>
              </div>

        </div>

     
          
      </header>
    
</body>

</html>


