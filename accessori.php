<?php
session_start();
require_once("config.php");
require_once("calcola_sconto.php"); 
include 'checkSession.php';

$username = $_SESSION['username']; 
$idutente = $_SESSION['IdUtente'];


// Query per ottenere i preferiti dell'utente loggato
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
    <title>Accessori</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="accessori.css">
    <script src="accessori.js" defer></script>  
</head>
<body>
    <?php include 'navbar/navbar.php'; ?>

    <div class="intestazione">
            <span>Accessori</span> 
        </div>

        <h1 class="barra">
            </h1>

            <div class="banner">
                <img src="accessori/accessory-banner.jpg">
            </div>

    
            <div class="container">
        <input type="hidden" id="hiddenId" value="<?php echo $idutente?>">
        <?php
        require_once("config.php");

        $sql = "SELECT p.idProdotto, p.nomeP, p.prezzo, p.isSconto, p.Sconto, i.src as immagineUrl
                FROM Prodotto p
                JOIN Categoria c ON p.codCategoria = c.idCategoria
                JOIN Immagine i ON p.codImmagine = i.idImmagine
                WHERE c.nomeCategoria = 'Accessori' ";
        $result = $conn->query($sql);

        if ($result === false) {
            die("Errore nella query: " . $conn->error);
        }
        ?>

        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {
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
                
                echo '<img src="accessori/' . $row['immagineUrl'] . '" alt="Product Image">';
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
            echo "No products found.";
        }
        $conn->close();
        ?>
    </div>

    <?php include 'footer/footer.php'; ?>
 
</body>
</html>
