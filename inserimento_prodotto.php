<?php
require_once('config.php');


if($_SERVER['REQUEST_METHOD'] === 'POST'){
   
    $nomeP = $_POST['nomeP'];
    $taglia = $_POST['taglia'];
    $prezzo = $_POST['prezzo'];
    $descrizione = $_POST['descrizione'];
    $specifiche = isset($_POST['specifiche']) ? $_POST['specifiche'] : NULL;
    $vestibilita = isset($_POST['vestibilita']) ? $_POST['vestibilita'] : NULL;
    $codCategoria = $_POST['codCategoria'];
    $codImmagine = isset($_POST['codImmagine']) ? $_POST['codImmagine'] : NULL;
    $isSconto = isset($_POST['isSconto']) ? 1 : 0;
    $Sconto = isset($_POST['Sconto']) ? $_POST['Sconto'] : NULL;

}

        $sql = "INSERT INTO Prodotto (nomeP, taglia, prezzo, descrizione, specifiche, vestibilita, codCategoria, codImmagine, isSconto, Sconto) VALUES ('$nomeP', '$taglia', '$prezzo', '$descrizione', '$specifiche', '$vestibilita', '$codCategoria', '$codImmagine', '$isSconto', '$Sconto')";
        if ($conn->query($sql) === TRUE) {
            $_SESSION['username'] = $username;
            header("Location: amministration.php");
            exit();
        } else {
            echo "Errore: " . $sql . "<br>" . $conn->error;
        }
        
        $conn->close();
  

?>