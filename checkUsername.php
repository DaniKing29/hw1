<?php

require_once('config.php');

if (isset($_POST['username'])) {
    $username = mysqli_real_escape_string($conn, $_POST['username']);
    $sql = "SELECT usernameU FROM Utente WHERE usernameU = '$username'";
    $result = $conn->query($sql);

    if ($result->num_rows > 0) {
        echo json_encode(['exists' => true]);
    } else {
        echo json_encode(['exists' => false]);
    }
}

$conn->close();

?>