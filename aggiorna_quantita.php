<?php
session_start();
require_once("config.php");

$idUtente = $_SESSION['IdUtente'];
$idProdotto = $_GET['id'];
$action = $_GET['action'];

if ($action == 'increase') {
    $sql = "UPDATE Carrello SET quantita = quantita + 1 WHERE codUtente = $idUtente AND codProdotto = $idProdotto";
} else if ($action == 'decrease') {
    $sql = "UPDATE Carrello SET quantita = quantita - 1 WHERE codUtente = $idUtente AND codProdotto = $idProdotto AND quantita > 1";
}

if ($conn->query($sql) === TRUE) {
    echo "Quantità aggiornata";
    
} else {
    echo "Errore: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
