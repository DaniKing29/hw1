<?php
    session_start();
    require_once("config.php");

    if ($_SERVER["REQUEST_METHOD"] == "POST") {
        $username = mysqli_real_escape_string($conn, $_POST['username']);
        $password = mysqli_real_escape_string($conn, $_POST['password']);
        $tipoAccount = mysqli_real_escape_string($conn, $_POST['account']);

        $sql = "SELECT IdUtente, usernameU, tipoAccount, passwordU FROM Utente WHERE usernameU = '$username'";
        $result = $conn->query($sql);

        if ($result && $result->num_rows == 1) {
            $row = $result->fetch_assoc();
            $hashedPassword = $row['passwordU'];
        
            if (password_verify($password, $hashedPassword)) {
                $_SESSION['IdUtente'] = $row['IdUtente'];
                $_SESSION['username'] = $row['usernameU'];
                $_SESSION['account'] = $row['tipoAccount'];
        
                header("Location: index.php");
                exit();
            } else {
                // Password non corretta, mostra un messaggio di errore
                $error = "Username o password non validi.";
            }
        } else {
            // Nessun utente trovato con quell'username, mostra un messaggio di errore
            $error = "Username o password non validi.";
        }
        
        $conn->close();
    }
?>


<!DOCTYPE html>
<html lang="it">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <link href="https://db.onlinewebfonts.com/c/85ed337567709f35cf0a006e2e482967?family=Juventus+Fans+Regular" rel="stylesheet">
    <link href="https://db.onlinewebfonts.com/c/b4ccc98add6cc60de17dbb589dca2164?family=Juventus+Fans+Bold" rel="stylesheet">
    <script src="login.js" defer></script>
    <title>Login</title>
</head>
<body>

    <div class="background">

        <div class="logo">
            <a href="index.php">
                <img src="images/juventus_logo_white.png" alt="Juventus Logo">
            </a>
        </div>

        <form id="formLogin" method="POST" action="login.php">
            <div class="form-login">
                <span>BENTORNATO</span>

                <div class="form-input">
                <label for="username"><b>Username</b></label>
                    <input type="text" placeholder="INSERISCI USERNAME" name="username" required onkeyup="validateLoginForm()">
                    <div id="errorUsername" class="error-message"><?php if (isset($error)) echo $error; ?></div>

                    <label for="password"><b>Password</b></label>
                    <input type="password" placeholder="INSERISCI PASSWORD" name="password" id="password" required onkeyup="validateLoginForm()">
                    <div id="errorPassword" class="error-message"><?php if (isset($error)) echo $error; ?></div>

                    <div class="eye-psw">
                        <img src="images/eye-open.svg" id="toggleEye" alt="Toggle Password Visibility">
                    </div>

                    <button type="submit">Login</button>
                </div>

                <div class="change-form">
                    <span>Non hai un account?</span>
                    <span class="attivo"><a href="registration.php">Registrati</a></span>
                </div>
            </div>
        </form>
    </div>

    <?php include 'footer/footer.php'; ?>

</body>
</html>
