<?php
    session_start();
    require_once("config.php");

    $idUtente = $_SESSION['IdUtente'];
    $idProdotto = intval($_GET['id']);

    $sql = "DELETE FROM Carrello WHERE codUtente = $idUtente AND codProdotto = $idProdotto";
    
    if ($conn->query($sql) === TRUE) {
        echo "Prodotto aggiunto al carrello";
    } else {
        echo "Errore: " . $sql . "<br>" . $conn->error;
    }
    
    $conn->close();

?>



