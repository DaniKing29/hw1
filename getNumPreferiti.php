<?php

session_start();
include 'config.php';
include 'checkSession.php';

$quantity = 0;

session_start();
if(isset($_SESSION["IdUtente"])) {
    $user_id = $_SESSION["IdUtente"];
    $sql = "SELECT COUNT(*) AS total_quantity FROM preferiti WHERE codUtente = $user_id";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {    
        $row = $result->fetch_assoc();
        $quantity = $row["total_quantity"];
    }
}

$conn->close();

echo $quantity;
?>
