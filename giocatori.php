<?php

session_start();
include 'checkSession.php';

?>

<html>
    <head>
         <link rel="stylesheet" href="giocatori.css">
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
        <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
        <link rel="icon" type="image/x-icon" href="images/icon-web.png">
    </head>
    <body>


    <?php include 'navbar/navbar.php'; ?>

        <div class="intestazione">
            <span>giocatori</span> 
        </div>

        <h1 class="barra">
            </h1>

            <div class="banner">
                <img src="giocatori/banner.jpg">
            </div>
    
    <div class="container">

    <?php

    require_once("config.php");

    $sql = "SELECT g.nomeG, g.cognomeG, g.ruolo, i.src as immagineUrl
            FROM Giocatore as g JOIN Immagine as i ON g.codImmagine=i.idImmagine
            ORDER BY g.ruolo";
    $result = $conn->query($sql);

    if ($result === false) {
        die("Errore nella query: " . $conn->error);
    }

    ?>

    <?php
        if ($result->num_rows > 0) {
            $currentRole = '';
            while($row = $result->fetch_assoc()) {
                if ($row['ruolo'] != $currentRole) {
                    if ($currentRole != '') {
                        echo "</div>"; // Chiude la div del ruolo precedente
                    }
                    $currentRole = $row['ruolo'];
                    echo "<h2>$currentRole</h2>";
                    echo "<div class='role-section'>";
                }
                echo "<div class='card'>";
                echo "<img src='giocatori/" . $row['immagineUrl'] . "' alt='Immagine di " . $row['nomeG'] . " " . $row['cognomeG'] . "'>";
                echo "<div class='card-content'>";
                echo "<h3>" . $row['nomeG'] . " " . $row['cognomeG'] . "</h3>";
                echo "</div>";
                echo "</div>";
            }
            echo "</div>"; // Chiude l'ultima div del ruolo
        } else {
            echo "<p>Nessun risultato</p>";
        }
        $conn->close();
        ?>
    </div>

    <?php include 'footer/footer.php'; ?>

    </body>
</html>