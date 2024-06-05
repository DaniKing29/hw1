<?php
session_start();
include 'config.php';
include 'checkSession.php';

$quantity = 0;

session_start();
if(isset($_SESSION["IdUtente"])) {
    $user_id = $_SESSION["IdUtente"];
    $sql = "SELECT IFNULL(SUM(quantita), 0) AS tot_quantita FROM carrello WHERE codUtente = $user_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        $row = $result->fetch_assoc();
        $quantity = $row["tot_quantita"];
    } else {
        $quantity = 0;
    }
}

$conn->close();

echo $quantity
?>

