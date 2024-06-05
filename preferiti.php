<?php
           session_start();

           require_once("config.php");
           include 'checkSession.php';

           if(isset($_SESSION["username"])){
                $username = $_SESSION["username"];
                $tipoAccount = $_SESSION["account"];
                $idutente = $_SESSION['IdUtente'];
            }
        
            // Query per ottenere i prodotti nella wishlist dell'utente
            $sql = "SELECT P.idProdotto, P.nomeP, P.taglia, P.prezzo, P.descrizione, I.src, C.nomeCategoria , C.misura
                    FROM Preferiti PF
                    JOIN Prodotto P ON PF.codProdotto = P.idProdotto
                    LEFT JOIN Immagine I ON P.codImmagine = I.idImmagine
                    JOIN Categoria C ON P.codCategoria = C.idCategoria
                    WHERE PF.codUtente = $idutente ";

            $result = $conn->query($sql);

?>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Maglie Gara</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
        <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="images/icon-web.png">
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="preferiti.css">
    <script src="preferiti.js" defer></script>  
</head>
<body>
    <?php include 'navbar/navbar.php'; ?>

        <div class="intestazione">
            <span>I miei preferiti</span> 
        </div>

        <h1 class="barra"></h1>

       
     <br/><br/><br/><br/><br/><br/><br/><br/><br/>


<div class="wishlist-container">

<?php
if ($result->num_rows > 0) {
    while ($row = $result->fetch_assoc()) {
        // Modifica categoria per URL-friendly string
        $categoria = strtolower(str_replace(' ', '-', $row['nomeCategoria']));
        $misura = strtolower(trim($row['misura'])); // Usa trim per rimuovere spazi extra
        
        // Modifica categoria specifica per Kit Gara, Maglie Gara, e Accessori
        if ($row['nomeCategoria'] == 'Kit Gara') {
            $categoria = 'kit-gara';
        } elseif ($row['nomeCategoria'] == 'Maglie Gara') {
            $categoria = 'maglie-gare';
            $misura = ''; // Rimuove la misura per Maglie Gara
        } elseif ($row['nomeCategoria'] == 'Accessori') {
            $misura = ''; // Rimuove la misura per Accessori
        }

        echo '<div class="product">';
        echo '<span class="remove-product" data-id="' . $row['idProdotto'] . '">x</span>';
        // Costruisce il percorso dell'immagine
        $src = $categoria . '/' . ($misura ? $misura . '/' : '') . $row['src'];
        echo '<img src="' . $src . '" alt="' . $row['nomeP'] . '">';
        echo '<h2>' . $row['nomeP'] . '</h2>';
        echo '<p>Categoria: ' . $row['nomeCategoria'] . '</p>';
        echo '<p>Prezzo: €' . $row['prezzo'] . '</p>';
        echo '<a class="add-to-cart" data-id="' . $row['idProdotto'] . '">sposta al carrello</a>';
        echo '</div>';
    }
} else {
    echo '<p>Non hai prodotti nella tua wishlist.</p>';
}
$conn->close();
?>
</div>

    <?php include 'footer/footer.php'; ?>


</body>
</html>