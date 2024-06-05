<?php
session_start();

if(isset($_SESSION["username"])){
    $username = $_SESSION["username"];
    $tipoAccount = $_SESSION["account"];
}
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Store Ufficiale Juventus</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="search.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
    <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/icon-web.png">
    <script src="script.js" defer></script>  
    <script src="search.js" defer></script>  
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
                   <img src="images/logo-j.svg" class="logo" alt="Juventus">
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
     
        <!-- MENU' NAVIGATION -->

        <div class="SecondBar">
            <a class="active" href="maglieGara.php">Maglie Gara</a>
            <a href="kitGara.php">Kit Gara</a>
            <a href="allenamento.php">Allenamento</a>
            <a href="abbigliamento.php">Abbigliamento</a>
            <a href="accessori.php">Accessori</a>
            <a class="active" href="giocatori.php">Giocatori</a>
        </div>
      </header>


         <!--  OVERLAY -->

          <div class="carousel">
            <img id="carousel-image" >
               <div class="text-box">
                  <span>
                    <h1>Scegli la tua Maglia</h1>
                     <strong> Personalizzazione gratuita su tutte le maglie gara della stagione 2023/24 fino alle ore 23:59 Cest di Mercoledi 03.04.2024 </strong>
                  </span>
                  <button > ACQUISTA ORA</button>
               </div>          
          </div>


          <!--  SEZIONE PUBBLICITA' -->

          <div class="text">
              <div class="separa-s">
                  <span><strong>Supporta la Squadra</strong></span>
                  <strong>  <p>Acquista direttamente da Juventus</p> </strong>       
              </div>
                
              <div class="separa-c">
                  <span><strong>Spedizione Veloce</strong></span>
                  <strong> <p>In italia, Spedizioni espresse e sicure</p> </strong>       
              </div>
             
            <div class="separa-d">
                <span><strong>Prodotti Esclusivi</strong></span>
                <strong><p>ogni giorno nuovi prodotti 100% ufficiali</p></strong>
            </div>       
          </div>

          <!-- SEZIONE TUTE -->

          <div class="blocco"> 

            <div class="card">
                <div class="header">
                    <img src="images/felpa.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>Tute Uomo</a>
                  <button> Acquista Ora </button>
                </div>
              </div>

              <div class="card">
                <div class="header">
                    <img src="images/kid3.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>Tute Ragazzo</a>
                  <button> Acquista Ora </button>
                </div>
              </div>
            
              <div class="card">
                <div class="header">
                    <img src="images/kid4.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>Tute Bambino</a>
                  <button> Acquista Ora </button>
                </div>
              </div>
        </div>

         <!-- PERSONALIZZA IL TUO KIT -->

        <div class="intestazione">
          <span>PERSONALIZZA IL TUO KIT JUVENTUS</span>
        </div>

        <div class="contenitor-item">
          <div  class="header-menu">
                 <span data-num="0">HOME 23/24</span>   
                 <span data-num="1">AWAY 23/24</span> 
                 <span data-num="2">THIRD 23/24</span> 
          </div>

          <div class="menu-contenitor">

              <div class="menu-box">

                  <div id="select" class="custom-select" class="oversize">
                    <select>
                      <option value="0">Home Authentic</option>
                      <option value="1">Home Replica</option>
                      <option value="2">Home Bambino</option>       
                    </select>
                  </div>

                  <div class="custom-select">
                 
                      <select>
                        <option value="0">- TAGLIA -</option>
                       <option value="1">XS</option>
                        <option value="2">S</option>   
                      </select>
        
                        <span class="tab-taglie"> tabella taglie</span>
                   
                  </div>

                
                  <!-- MODAL TAGLIE MAGLIE -->
                   
                    <div id="cover">
                        <div class="modal">
                      
                         <div class="closebtn2" >&times; </div>
                       
                        <h1> MAGLIE GARA ADIDAS 2023/24 - Tabella taglie</h1>
                     
                          <div class="contenitore-testo">
                               <span> Prendi la misura appoggiando una tua maglietta su una superficie PIANA. 
                          
                              (Se stai indossando la maglietta, prendi le misure a diretto contatto con il corpo.) </span>  <br/>

                              <span> Poi trova la taglia corrispondente nella tabella sottostante. Se hai dubbi, prendi la misura più grande! </span> <br/>
                          
                              <p>  B: Larghezza spalle, da cucitura a cucitura dell'attaccatura superiore delle maniche <br/>
                                   C: Lunghezza maglia, la misurazione viene effettuata della cucitura più alta del colletto al fondo del capo d'abbigliamento <br/>
                                   D: Larghezza Torace, la misurazione viene effettuata dalla cucitura del cavo ascellare di destra a quello di sinistra</p>
                            </div>
                          <button class="size-box"> <img src="images/size.jpg" alt="size"> </button>


                         <div class="tab-content">
                            <button class="collapsible">UOMO - MAGLIA REPLICA 2023/24</button>
                            <div class="content" data-index="0">
                            </div>
                            <button class="collapsible">UOMO - MAGLIA "AUTHENTIC" 2023/24</button>
                            <div class="content" data-index="1">
                            </div>
                            <button class="collapsible">UOMO - MAGLIA PORTIERE 2023/24</button>
                            <div class="content" data-index="2">
                            </div>
                            <button class="collapsible">DONNA - MAGLIA GARA 2023/24</button>
                            <div class="content" data-index="3">
                            </div>
                            <button class="collapsible">BAMBINO - MAGLIA GARA 2023/24</button>
                            <div class="content" data-index="4">
                            </div>
                      </div>
                      </div>
                    </div>
                   
                
    

                  <div class="custom-select" class="oversize">
                    <select>
                      <option value="0">NESSUNO</option>
                     <option value="1">GIOCATORI</option>
                      <option value="2">PERSONALIZZA</option>   
                    </select>
                  </div>

                 <div class="acquisto">

                  <span>Aggiungi Patch</span>
                 
                  <div class="spot">
                    <img scr="images/spot.png">
                  </div>

                  <div class="radio">
                    <input type="radio">
                  </div>
               
                  <div class="cassa"> 

                    <span>Prezzo totale</span>
                    <p> 150,00 €</p>
  
                    <button>Aggiungi al carrello</button>

                  </div>

                 </div>

              </div>

               <div class="card-img1"> </div>
               <div class="card-img2"> </div>
          </div>
        </div>


          <!-- BEST SELLER-->

          <div class="intestazione">
            <span>BEST SELLER</span>
          </div>
  
          <div class="row">
  
             <div class="column">
                <img src="images/bs1.jpg">
                <div class="titolo">
                      <p>INDIVISA X JUVENTUS TOTE BAG NERA</p>
                </div>
                <div class="prezzo"> 15,00 €</div>
             </div>
  
             <div class="column">
                <img src="images/bs2.jpg">
                <div class="titolo">
                       <p>JUVENTUS BOTTIGLIA TERMICA</p>
                </div>
                <div class="prezzo"> 19,90 € </div>
             </div>
  
             <div class="column">
                <img src="images/bs3.jpg">
                <div class="titolo">
                       <p>JUVENTUS GAZELLE FW32</p>
                </div>
                <div class="prezzo"> 120,00 € </div>
           </div>
  
             <div class="column">
                <img src="images/bs4.jpg">
                <div class="titolo">
                       <p>JUVENTUS BERRETTO GIALLO FLUO</p>
                </div>
                <div class="prezzo"> 27,90 € </div>
             </div>
  
             <div class="column">
                <img src="images/bs5.jpg">
                <div class="titolo">
                        <p>JUVENTUS ACCAPPATOIO LUXURY</p>
                </div>
                <div class="prezzo"> 99,90 € </div>
             </div>
          </div>
       
         
          <div class="frecce">
              <div  class="previous round">&#8249;</div>
             <div  class="next round">&#8250;</div>
          </div>

           
          

          <div class="intestazione">
            <span>Prime pagine dei quotidiani sportivi</span>
          </div>

          <div class="news-box">

              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="">
                    <img src="" alt="">
                  </a>
                  <div class="desc"></div>
                </div>
              </div>


              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="">
                    <img src="" alt="">
                  </a>
                  <div class="desc"></div>
                </div>
              </div>


              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="">
                    <img src="" alt="">
                  </a>
                  <div class="desc"></div>
                </div>
              </div>


              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="">
                    <img src="" alt="">
                  </a>
                  <div class="desc"></div>
                </div>
              </div>


              <div class="responsive">
                <div class="gallery">
                  <a target="_blank" href="">
                    <img src="" alt="">
                  </a>
                  <div class="desc"></div>
                </div>
              </div>

          </div>
          


         <!-- PRODOTTI IMPERDIBILI-->
          <!--    
          <div class="intestazione">
            <span>PRODOTTI IMPERDIBILI</span>
          </div>
  
          <div class="row">
  
             <div class="column">
                <img src="images/p1.jpg">
                <div class="titolo">
                      <p>JUVENTUS FELPA CAPPUCCIO LAPIS GIALLO FLUO</p>
                </div>
                <div class="prezzo"> 54,90 € </div>
             </div>
  
             <div class="column">
                <img src="images/p2.jpg">
                <div class="titolo">
                       <p>JUVENTUS SCIARPA LUXURY CASHMERE NERA</p>
                </div>
                <div class="prezzo"> 99,00 € </div>
             </div>
  
             <div class="column">
                <img src="images/p3.jpg">
                <div class="titolo">
                       <p>JUVENTUS SCIARPA NERO&GIALLA</p>
                </div>
                <div class="prezzo"> 49,00 € </div>
           </div>
  
             <div class="column">
                <img src="images/p4.jpg">
                <div class="titolo">
                       <p>JUVENTUS GUANTI NERI</p>
                </div>
                <div class="prezzo"> 28,00 € </div>
             </div>
  
             <div class="column">
                <img src="images/p5.jpg">
                <div class="titolo">
                        <p>JUVENTUS BOTTIGLIA TERMICA FINO ALLA FINE</p>
                </div>
                <div class="prezzo"> 19,90 € </div>
             </div>
  
          </div>
          -->
      
  
       <!--  ABBIGLIAMENTO -->  
  
              <div class="box3">
                  <div class="box-item1">  
                      <div class="par">
                          <p>Abbigliamento Ragazzi</p>
                          <button>Acquista Ora</button>
                      </div>
                  </div>
                  <div class="box-item2">
                      <div class="par">
                          <p>Abbigliamento Bambini</p>
                          <button>Acquista Ora</button>
                      </div>
                  </div>
             </div>
  
         
        <!--  TRAINING -->  

          <div class="box">
              <div>
                  <img src="images/kostic.jpg" alt="Car" >
              </div>
              <div class="par">
                <p>TRAINING</p>
                <button>Acquista Ora</button>
              </div>
          </div>


          <!-- METEO -->
        

          <div id="box-meteo" class="box-meteo">
            <h1> OGGI NON SAI COSA METTERTI? CI PENSIAMO NOI! </h1>
            <form id="form"> 
                <input type="search" id="cerca-citta" name="q" placeholder="INSERISCI LA CITTA'">
                <button type="submit"><i class="fa fa-search"></i></button>
            </form>

            <div id="contenitore-meteo" class="contenitor-meteo"> 
                    <div class="meteo-card"> </div>

                    <div class="box-outfit"> 
                         <div class="sopra"> </div>
    
                         <div class="sotto"></div> 
                    </div>
            </div>
        </div>
        

       
        <!--  ABBIGLIAMENTO -->  

        <div class="blocco"> 

            <div class="card">
                <div class="header">
                    <img src="images/rosa.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>abbigliamento donna</a>
                  <button>Acquista Ora</button>
                </div>
              </div>

              <div class="card">
                <div class="header">
                    <img src="images/cappello.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>accessori</a>
                  <button>Acquista Ora</button>
                </div>
              </div>
            
              <div class="card">
                <div class="header">
                    <img src="images/scarpe.jpg" alt="Car" >
                </div>
              
                <div class="container">
                  <a>outlet</a>
                  <button>Acquista Ora</button>
                </div>
              </div>
        </div>


    <!-- SPONSOR -->

        <div class="sponsor">

            <img src="images/Sconto_Membership_ita.png" alt="Sconto_Membership_ita" >
            <img src="images/Pagamento_Sicuro_ita.png" alt="Pagamento_Sicuro_ita" >
            <img src="images/Spedizione_veloce_ita.png" alt="Spedizione Veloce" >

        </div>
   
     <!-- FOOTER -->

        
            <div class="footer">
                <p>
                    Juventus Football Club S.p.A. Via Druento, 175 - 10151 Torino - Italia<br/>
                    Capitale Sociale &nbsp;&euro;&nbsp;<span lang="EN-US">50.000,00</span>
                    <span></span>
                    interamente versato - Registro Imprese, Codice Fiscale e Partita IVA 00470470014 - REA 394963
                </p>
                <p>
                    Fotografia e contenuti &copy;2022 Juventus Football Club S.p.A. <strong>- All rights reserved</strong>
                </p>
                <p>Assistenza Juventus Official Online Store: store-support@juventus.com - Tel. +39 0110435010</p>
            </div>
          
</body>
</html>