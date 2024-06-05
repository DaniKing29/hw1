<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Kit Gara</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="amministration.css">
</head>
<body>

    <?php include 'navbar/navbar.php'; ?>

    <div class="intro-contenitor"   <?php 

if(isset($_GET['categoria'])){
    echo "style='display:none'";
}



?>
>

        <div class="intestazione">
            <span>Amministrazione</span>
        </div>
        <h1 class="barra"></h1>

        <div class="cont-intro">   

                <div class="intro">
                    <a href="add.php" ><img src="images/add.png" alt="Add"></a>
                </div>
                <div class="intro">
                    <a href="edit.php" ><img src="images/edit.png" alt="Edit"></a>
                </div>
                <div class="intro">
                    <a href="delete.php" ><img src="images/delete.png" alt="Delete"></a>
                </div>

        </div>

       
    </div>

 
   

    <?php include 'footer/footer.php'; ?>

</body>
</html>
