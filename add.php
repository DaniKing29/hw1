<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Aggiungi Prodotto</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="add.css">
</head>
<body>

    <?php include 'navbar/navbar.php'; ?>

    

        <div class="intestazione">
            <span>Aggiungi Prodotto</span>
        </div>
        <h1 class="barra"></h1>


        <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/> <br/>

        <div class="intro-contenitor">

        <div class="cont-intro">   

        <?php
            require_once('config.php');

            // Recupera le categorie dal database
            $sql = "SELECT idCategoria, nomeCategoria FROM Categoria";
            $result = $conn->query($sql) or die("Errore nel recupero delle categorie");

            // Recupera le immagini dal database
            $sql2 = "SELECT idImmagine, src FROM Immagine";
            $result2 = $conn->query($sql2) or die("Errore nel recupero delle immagini");

            echo "
            <form action='inserimento_prodotto.php' method='POST'>
                <h1>INSERISCI IL PRODOTTO:</h1>

                <div class='form-group'>
                    <label for='nomeP'>Nome Prodotto:</label>
                    <input class='form-control' id='nomeP' type='text' name='nomeP' required />
                </div>

                <div class='form-group'>
                    <label for='taglia'>Taglia:</label>
                    <input class='form-control' id='taglia' type='text' name='taglia' required />
                </div>

                <div class='form-group'>
                    <label for='prezzo'>Prezzo:</label>
                    <input class='form-control' id='prezzo' type='number' step='0.01' name='prezzo' required />
                </div>

                <div class='form-group'>
                    <label for='descrizione'>Descrizione:</label>
                    <textarea class='form-control' id='descrizione' name='descrizione' required></textarea>
                </div>

                <div class='form-group'>
                    <label for='specifiche'>Specifiche:</label>
                    <textarea class='form-control' id='specifiche' name='specifiche'></textarea>
                </div>

                <div class='form-group'>
                    <label for='vestibilita'>Vestibilità:</label>
                    <textarea class='form-control' id='vestibilita' name='vestibilita'></textarea>
                </div>

                <div class='form-group'>
                    <label for='categoria'>Categoria:</label>
                    <select class='form-select' id='categoria' name='codCategoria' required>
                        <option selected>SELEZIONA..</option>";
                        if ($result->num_rows > 0) {
                            while ($row = mysqli_fetch_assoc($result)) {
                                echo "<option value='{$row['idCategoria']}'>{$row['nomeCategoria']}</option>";
                            }
                        }
            echo "
                    </select>
                </div>

                <div class='form-group'>
                    <label for='immagine'>Immagine:</label>
                    <select class='form-select' id='immagine' name='codImmagine'>
                        <option selected>SELEZIONA..</option>";
                        if ($result2->num_rows > 0) {
                            while ($row2 = mysqli_fetch_assoc($result2)) {
                                echo "<option value='{$row2['idImmagine']}'>{$row2['src']}</option>";
                            }
                        }
            echo "
                    </select>
                </div>

                <div class='form-group'>
                    <label for='isSconto'>Sconto:</label>
                    <input class='form-check-input' type='checkbox' id='isSconto' name='isSconto'>
                </div>

                <div class='form-group'>
                    <label for='sconto'>Percentuale Sconto:</label>
                    <input class='form-control' id='sconto' type='number' name='Sconto' />
                </div>

                <button type='submit'>INSERISCI</button>
            </form>
            ";
        ?>

        </div>

    </div>

    <?php include 'footer/footer.php'; ?>

    <script src="script.js"></script>

</body>
</html>
