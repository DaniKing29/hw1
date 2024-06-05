<?php
session_start();
require_once('config.php');

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (isset($_POST['registrati'])) {
        if (isset($_POST["username"])) {
            $username = mysqli_real_escape_string($conn,$_POST["username"]);
        } else {
            $username = "";
        }

        if (isset($_POST["nome"])) {
            $nome = mysqli_real_escape_string($conn,$_POST["nome"]);
        } else {
            $nome = "";
        }

        if (isset($_POST["cognome"])) {
            $cognome = mysqli_real_escape_string($conn,$_POST["cognome"]);
        } else {
            $cognome = "";
        }

        if (isset($_POST["email"]) && filter_var($_POST["email"], FILTER_VALIDATE_EMAIL)) {
            $email = mysqli_real_escape_string($conn,$_POST["email"]);
        } else {
            // Gestisci l'errore per l'email non valida
            echo "Indirizzo email non valido.";
            exit();
        }

        if (isset($_POST["pass"])) {
            $password = mysqli_real_escape_string($conn,$_POST["pass"]);
        } else {
            $password = "";
        }

        // Utilizziamo bcrypt per l'hashing della password
        $hashedPassword = password_hash($password, PASSWORD_BCRYPT);

        $sql = "INSERT INTO Utente (NomeU, CognomeU, usernameU, passwordU, email) VALUES ('$nome', '$cognome', '$username', '$hashedPassword', '$email')";
        if ($conn->query($sql) === TRUE) {
            $_SESSION['username'] = $username;
            header("Location: login.php");
            exit();
        } else {
            echo "Errore: " . $conn->error;
        }

        $conn->close();
    }
}
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="registration.css">
    <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
    <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
    <script src="registration.js" defer></script>
    <title>Registrazione</title>
</head>
<body>
    <div class="background">
        <div class="logo">
            <a href="index.php">
                <img src="images/juventus_logo_white.png" alt="Juventus Logo">
            </a>
        </div>
        <form id="formRegistration" method="POST" action="registration.php">
            <div class="form-login">   
                <span>BENVENUTO</span> 
                <div class="form-input">
                    <label><b>Nome</b></label>
                    <input type="text" placeholder="INSERISCI IL NOME" name="nome" id="nome" onkeyup="textValidate(this)" required>
                    <span class="errorCheck" id="nomecheck"></span>

                    <label><b>Cognome</b></label>
                    <input type="text" placeholder="INSERISCI IL COGNOME" name="cognome" id="cognome" onkeyup="textValidate(this)" required>
                    <span class="errorCheck" id="cognomecheck"></span>

                    <label><b>E-mail</b></label>
                    <input type="email" placeholder="INSERISCI E-MAIL" name="email" id="email" onkeyup="emailValidate(this)" required>
                    <span class="errorCheck" id="emailcheck"></span>

                    <label><b>Username</b></label>
                    <input type="text" placeholder="INSERISCI USERNAME" name="username" id="username" onkeyup="textValidate(this)" required>
                    <span class="errorCheck" id="usernamecheck"></span>

                    <label><b>Password</b></label>
                    <input type="password" placeholder="INSERISCI PASSWORD" name="pass" id="password" onkeyup="passwordValidate(this)" required>
                    <span class="errorCheck" id="passwordcheck"></span>

                    <div class="eye-psw">
                        <img src="images/eye-open.svg" id="togglePassword">
                    </div>
                    <div class="controllo-psw">
                        <span>Una password vincente deve contenere almeno:</span>
                        <ul>   
                            <li>Un carattere in MAIUSCOLO</li>
                            <li>Un numero</li>
                            <li>8 caratteri</li>
                            <li>Un carattere in minuscolo</li>
                            <li>Un carattere speciale (&amp;*€%)</li>
                        </ul>
                    </div>
                    <div class="contenitor-conferma">
                        <label><b>Conferma Password</b></label>
                        <input type="password" placeholder="CONFERMA PASSWORD" name="psw" id="confirmPassword" onkeyup="confirmPasswordValidate(this)" required>
                        <span class="errorCheck" id="confirmPasswordcheck"></span>
                    </div>
                    <div class="eye-psw2">
                        <img src="images/eye-open.svg" id="toggleConfirmPassword">
                    </div>
                    <button id="registrationButton" type="submit" name="registrati" class="disabled" disabled>REGISTRATI</button>
                    <div class="change-form">
                        <span>Hai già un account?</span>
                        <span><a class="attivo" href="login.php">Accedi</a></span>
                    </div>
                </div>
            </div>
        </form>
    </div>
    <?php include 'footer/footer.php'; ?>
</body>
</html>







