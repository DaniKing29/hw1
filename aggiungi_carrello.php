<?php
session_start();
require_once("config.php");

$idUtente = intval($_GET['idUtente']);
$idProdotto = intval($_GET['id']);

echo $idUtente;
echo $idProdotto;

$sql = "INSERT INTO Carrello (codUtente, codProdotto, quantita) VALUES ($idUtente, $idProdotto, 1) ON DUPLICATE KEY UPDATE quantita = quantita + 1";
if ($conn->query($sql) === TRUE) {
    echo "Prodotto aggiunto al carrello";
} else {
    echo "Errore: " . $sql . "<br>" . $conn->error;
}

$conn->close();
?>
