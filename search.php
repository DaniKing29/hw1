<?php
session_start();
include 'config.php';

$idutente = $_SESSION['IdUtente'];


if (isset($_GET['query'])) {
    $query = $conn->real_escape_string($_GET['query']);
    $sql = "SELECT p.idProdotto, p.nomeP, p.taglia, p.prezzo, p.descrizione, i.src, c.nomeCategoria, c.misura
            FROM Prodotto p
            LEFT JOIN Immagine i ON p.codImmagine = i.idImmagine
            LEFT JOIN Categoria c ON p.codCategoria = c.idCategoria
            WHERE p.nomeP LIKE '%$query%'";
    $result = $conn->query($sql);

    $products = [];

    if ($result->num_rows > 0) {
        while($row = $result->fetch_assoc()) {
            // Modifica categoria per URL-friendly string
            $categoria = strtolower(str_replace(' ', '-', $row['nomeCategoria']));
            $misura = strtolower(trim($row['misura'])); // Usa trim per rimuovere spazi extra
           
            if ($row['nomeCategoria'] == 'Kit Gara') {
                $categoria = 'kit-gara';
            } elseif ($row['nomeCategoria'] == 'Maglie Gara') {
                $categoria = 'maglie-gare';
                $misura = ''; // Rimuove la misura per Maglie Gara
            } elseif ($row['nomeCategoria'] == 'Accessori') {
                $misura = ''; // Rimuove la misura per Accessori
            }

            $src = $categoria . '/' . ($misura ? $misura . '/' : '') . $row['src'];
            $row['src'] = $src; // Aggiungi il percorso completo all'array
            $products[] = $row; // Aggiungi la riga con le informazioni aggiuntive
        }
    }

    echo json_encode($products);
}
?>




