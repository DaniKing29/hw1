<?php
session_start();
include 'config.php';
include 'checkSession.php';

$user_id = $_SESSION['IdUtente'];
$product_id = $_GET['idProdotto'];


$product_query = "SELECT P.*, I.src AS image_src, C.nomeCategoria AS category_name, C.misura
                  FROM Prodotto P 
                  LEFT JOIN Immagine I ON P.codImmagine = I.idImmagine 
                  LEFT JOIN Categoria C ON P.codCategoria = C.idCategoria 
                  WHERE P.idProdotto = ?";
$stmt = $conn->prepare($product_query);
$stmt->bind_param("i", $product_id);
$stmt->execute();
$product_result = $stmt->get_result();

if ($product_result->num_rows > 0) {
    $product = $product_result->fetch_assoc();
} else {
    echo "Product not found.";
    exit;
}


$categoria = strtolower(str_replace(' ', '-', $product['category_name']));
$misura = strtolower(trim($product['misura']));

if ($product['category_name'] == 'Kit Gara') {
    $categoria = 'kit-gara';
} elseif ($product['category_name'] == 'Maglie Gara') {
    $categoria = 'maglie-gare';
    $misura = ''; 
} elseif ($product['category_name'] == 'Accessori') {
    $misura = ''; 
}

$src = $categoria . '/' . ($misura ? $misura . '/' : '') . $product['image_src'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="product.css">
    <script src="product.js" defer></script>  
    <title><?php echo htmlspecialchars($product['nomeP']); ?></title>
</head>
<body>

    <input type="hidden" id="hiddenId" value="<?php echo htmlspecialchars($user_id); ?>">

    <?php include 'navbar/navbar.php'; ?>     

    <br/><br/><br/><br/><br/><br/>

    <div class="product-container">

        <div class="product-image">
            <img src="<?php echo htmlspecialchars($src); ?>" alt="<?php echo htmlspecialchars($product['nomeP']); ?>">
        </div>
        <div class="product-details">
            <h1><?php echo htmlspecialchars($product['nomeP']); ?></h1>
            <p class="price"><?php echo htmlspecialchars($product['prezzo']); ?> &euro;</p>
            <p class="description"><?php echo htmlspecialchars($product['descrizione']); ?></p>
            <?php if ($product['specifiche']) { ?>
                <p class="specifiche"><strong>Specifiche:</strong> <?php echo htmlspecialchars($product['specifiche']); ?></p>
            <?php } ?>
            <?php if ($product['vestibilita']) { ?>
                <p class="vestibilita"><strong>Vestibilità:</strong> <?php echo htmlspecialchars($product['vestibilita']); ?></p>
            <?php } ?>
            <button id="add-to-cart" data-product-id="<?php echo htmlspecialchars($product_id); ?>" data-user-id="<?php echo htmlspecialchars($user_id); ?>">Aggiungi al carrello</button>
            <button id="add-to-favorites" data-product-id="<?php echo htmlspecialchars($product_id); ?>" data-user-id="<?php echo htmlspecialchars($user_id); ?>">Aggiungi ai preferiti</button>
            <button id="back-button" class="back-button">Indietro</button>
        </div>
    </div>

    <?php include 'footer/footer.php'; ?>

</body>
</html>

<?php
$conn->close();
?>
