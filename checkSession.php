<?php

session_start();
include 'config.php';


if (!isset($_SESSION['IdUtente'])) {
   
    exit();
}else{
    return $_SESSION['IdUtente'];
}

?>