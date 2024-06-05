document.addEventListener('DOMContentLoaded', function() {
    var removeButtons = document.querySelectorAll('.remove-product');

    removeButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = button.getAttribute('data-id');
            fetch('aggiungi_preferiti.php?action=remove&idUtente=<?php echo $idutente; ?>&id=' + productId)
                .then(response => {
                    if (response.ok) {
                        console.log('Prodotto rimosso dalla lista dei desideri');
                        button.parentElement.remove();
                    } else {
                        console.error('Errore durante la rimozione del prodotto dalla lista dei desideri');
                    }
                })
                .catch(error => {
                    console.error('Errore durante la richiesta fetch:', error);
                });
        });
    });
});



document.addEventListener('DOMContentLoaded', function() {
    var addToCartButtons = document.querySelectorAll('.add-to-cart');

    addToCartButtons.forEach(function(button) {
        button.addEventListener('click', function() {
            var productId = button.getAttribute('data-id');
            fetch('aggiungi_carrello.php?idUtente=<?php echo $idutente; ?>&id=' + productId)
                .then(response => {
                    if (response.ok) {
                        console.log('Prodotto aggiunto al carrello');
                        fetch('aggiungi_preferiti.php?action=remove&idUtente=<?php echo $idutente; ?>&id=' + productId)
                        button.parentElement.remove();
                    } else {
                        console.error('Errore durante l\'aggiunta del prodotto al carrello');
                    }
                })
                .catch(error => {
                    console.error('Errore durante la richiesta fetch:', error);
                });
        });
    });
});