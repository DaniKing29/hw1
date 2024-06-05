<?php
session_start();
require_once("config.php");
require_once("calcola_sconto.php");
include 'checkSession.php';

$idUtente = $_SESSION['IdUtente'];

$sql = "SELECT p.idProdotto, p.nomeP, p.prezzo, i.src, c.quantita, p.isSconto, p.Sconto, ca.nomeCategoria , ca.misura
        FROM Carrello c
        JOIN Prodotto p ON c.codProdotto = p.idProdotto
        JOIN Immagine i ON p.codImmagine = i.idImmagine
        JOIN Categoria ca ON p.codCategoria = ca.idCategoria
        WHERE c.codUtente = $idUtente";
$result = $conn->query($sql);

$total = 0;
?>

<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Carrello</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
    <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
    <link rel="icon" type="image/x-icon" href="images/icon-web.png">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="carrello.css">
    <script src="carrello.js" defer></script>  
</head>
<body>
    <?php include 'navbar/navbar.php'; ?>

    <div class="intestazione">
        <span>Il tuo Carrello</span> 
    </div>

    <h1 class="barra"></h1>

    <br/><br/><br/><br/><br/><br/><br/><br/>

    <div class="container-carrello">
        <?php
        if ($result->num_rows > 0) {
            while($row = $result->fetch_assoc()) {

                $prezzoOriginale = $row['prezzo'];
                $prezzoFinale = $prezzoOriginale;

                if ($row['isSconto']) {
                    $sconto = $row['Sconto'];
                    $prezzoFinale = calcolaSconto($prezzoOriginale, $sconto);
                }

                $total += $prezzoFinale * $row['quantita'];

             
                $categoria = strtolower(str_replace(' ', '-', $row['nomeCategoria']));
                $misura = strtolower(trim($row['misura'])); 
                
                // Modifica categoria specifica per Kit Gara, Maglie Gara, e Accessori
                if ($row['nomeCategoria'] == 'Kit Gara') {
                    $categoria = 'kit-gara';
                } elseif ($row['nomeCategoria'] == 'Maglie Gara') {
                    $categoria = 'maglie-gare';
                    $misura = ''; // Rimuove la misura per Maglie Gara
                } elseif ($row['nomeCategoria'] == 'Accessori') {
                    $misura = ''; // Rimuove la misura per Accessori
                }

                echo '<div class="cart-item">';

                echo '<div class="cestino" data-id="' . $row['idProdotto'] . '"> <img src="images/cest.png"> </div>';

                $src = $categoria . '/' . ($misura ? $misura . '/' : '') . $row['src'];
                echo '<img src="' . $src . '" alt="' . $row['nomeP'] . '">';

                echo '<h2>' . $row['nomeP'] . '</h2>';
            
                if ($row['isSconto']) {
                    echo '<p>Prezzo: <span>' . $prezzoFinale . '€</span></p>';
                } else {
                    echo '<p>Prezzo: ' . $prezzoOriginale . '€</p>';
                }

                echo '<div class="quantity-controls">';
                echo '<button class="decrease-quantity" data-id="' . $row['idProdotto'] . '">-</button>';
                echo '<span class="quantity">' . $row['quantita'] . '</span>';
                echo '<button class="increase-quantity" data-id="' . $row['idProdotto'] . '">+</button>';
                echo '</div>';
                echo '</div>';
            }
        } else {
            echo "Il carrello è vuoto.";
        }
        $conn->close();
        ?>
        <div class="cart-total">
            <h2>Totale: <span id="cart-total"><?php echo $total; ?>€</span></h2>
        </div>
    </div>

    <?php include 'footer/footer.php'; ?>

</body>
</html>
