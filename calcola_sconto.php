<?php
function calcolaSconto($prezzo, $percentualeSconto) {
    return $prezzo - ($prezzo * $percentualeSconto / 100);
}
?>
