<?php
session_start();
require_once("config.php");


$utenteId = intval($_GET['idUtente']);
$prodottoId = intval($_GET['id']);
$azione = $_GET['action'];

if ($azione == 'add') {
    $sql = "INSERT INTO Preferiti (codUtente, codProdotto) VALUES ($utenteId, $prodottoId)";
} else if ($azione == 'remove') {
    $sql = "DELETE FROM Preferiti WHERE codUtente = $utenteId AND codProdotto = $prodottoId";
} else {
    echo "Azione non valida";
    exit;
}

if ($conn->query($sql) === TRUE) {
    echo "Success";
} else {
    echo "Errore: " . $conn->error;
}

$conn->close();
?>
