<?php

session_start();

require_once("config.php");
include 'checkSession.php';
require_once("calcola_sconto.php");

$username = $_SESSION['username']; 
$idutente = $_SESSION['IdUtente'];

$preferitiSql = "SELECT codProdotto FROM Preferiti WHERE codUtente = $idutente";
$preferitiResult = $conn->query($preferitiSql);

$preferiti = [];

if ($preferitiResult->num_rows > 0) {
    while ($row = $preferitiResult->fetch_assoc()) {
        $preferiti[] = $row['codProdotto'];
    }
}

?>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Abbigliamento</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="abbigliamento.css">
    <script src="abbigliamento.js" defer></script>  
</head>
<body>
    <?php include 'navbar/navbar.php'; ?>


    <div class="intro-contenitor" <?php if(isset($_GET['categoria'])){ echo "style='display:none'"; } ?>>

    <div class="intestazione">
            <span>Abbigliamento</span> 
        </div>

        <h1 class="barra"></h1>

  
            <div class="intro">
             <a data-cloth="uomo"> <img src="abbigliamento/uomo/abbigliamento-uomo.jpg"> </a>
            </div>

            <div class="intro">
            <a data-cloth="donna"> <img src="abbigliamento/donna/abbigliamento-donna.jpg"> </a>
            </div>

            <div class="intro">
            <a data-cloth="bambini"> <img src="abbigliamento/bambini/abbigliamento-bambini.jpg"> </a>
            </div>

            <div class="intro">
            <a data-cloth="neonati">  <img src="abbigliamento/neonati/abbigliamento-neonato.jpg"> </a>
            </div>

            </div>

        <div class="mostraKit" <?php if(isset($_GET['categoria'])){ echo "style='display:block'"; }else{ echo "style='display:none'"; } ?>>
        <a class="freccia" href="abbigliamento.php"> <img src="images/arrow.svg"> </a>
        <div class="intestazione">
        <span id="kitNomeCategoria"><?php if(isset($_GET['categoria'])){ echo "Abbigliamento ".$_GET['categoria']; } ?></span>
        </div>
        <h1 class="barra"></h1>
        <div class="banner">
            <img id="kitImage" <?php if(isset($_GET['categoria'])){ echo "src='abbigliamento/".$_GET['categoria'].".jpg'"; } ?> alt="Kit Image">
        </div>
        <div class="container">
            <input type="hidden" id="hiddenId" value="<?php echo $idutente?>">


            <?php
            require_once("config.php");

            if(isset($_GET['categoria'])){
                $categoria = $_GET['categoria'];
            }
           
            $categoria = $conn->real_escape_string($categoria);

            $sql = "SELECT p.idProdotto, p.nomeP, p.prezzo, p.isSconto, p.Sconto, i.src as immagineUrl
                    FROM Prodotto p
                    JOIN Categoria c ON p.codCategoria = c.idCategoria
                    JOIN Immagine i ON p.codImmagine = i.idImmagine
                    WHERE c.nomeCategoria = 'Abbigliamento' AND c.misura='$categoria'";

            $result = $conn->query($sql);

            if ($result === false) {
                die("Errore nella query: " . $conn->error);
            }
            ?>

        <?php
            if ($result->num_rows > 0) {
                while ($row = $result->fetch_assoc()) {

                    $isFavorite = in_array($row['idProdotto'], $preferiti);
                    $heartImage = $isFavorite ? 'cuore2.png' : 'cuore1.png';

                    $prezzoOriginale = $row['prezzo'];
                    $prezzoFinale = $prezzoOriginale;

                    if ($row['isSconto']) {
                        $sconto = $row['Sconto'];
                        $prezzoFinale = calcolaSconto($prezzoOriginale, $sconto);
                    }

                    echo '<div class="card">';
                    if ($row['isSconto']) {
                        echo '<div class="sales-label">Sales</div>';
                    }
                    echo '<img src="abbigliamento/'.$categoria.'/' . $row['immagineUrl'] . '" alt="Product Image">';
                    echo '<h2>' . $row['nomeP'] . '</h2>';
                    if ($row['isSconto']) {
                        echo '<p>Prezzo: <span style="text-decoration: line-through;">' . $prezzoOriginale . '€</span> <span>' . $prezzoFinale . '€</span></p>';
                    } else {
                        echo '<p>Prezzo: ' . $prezzoOriginale . '€</p>';
                    }
                    echo '<div class="btn-contenitor">';
                    echo '<button class="add-to-cart" data-id="' . $row['idProdotto'] . '">Aggiungi al Carrello</button>';
                    echo '<a class="add-to-favorites"><img src="images/' . $heartImage . '" data-id="' . $row['idProdotto'] . '"></a>';
                    echo '</div>';
                    echo '</div>';
                }
            } else {
                echo "Nessun prodotto trovato.";
            }
            $conn->close();
            ?>


      </div>
    </div>

    <?php include 'footer/footer.php'; ?>
    
</body>
</html>
