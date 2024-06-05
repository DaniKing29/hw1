document.addEventListener("DOMContentLoaded", function() {
    const userId = document.getElementById('hiddenId').value;

    document.getElementById('add-to-cart').addEventListener('click', function() {
        const productId = this.getAttribute('data-product-id');
        fetch(`aggiungi_carrello.php?id=${encodeURIComponent(productId)}&idUtente=${encodeURIComponent(userId)}`)
            .then(response => response.text())
            .then(data => {
                console.log(data);
                alert('Prodotto aggiunto al carrello');
            })
            .catch(error => console.error('Error:', error));
    });

    document.getElementById('add-to-favorites').addEventListener('click', function() {
        const productId = this.getAttribute('data-product-id');
        fetch(`aggiungi_preferiti.php?id=${encodeURIComponent(productId)}&action=add&idUtente=${encodeURIComponent(userId)}`)
            .then(response => response.text())
            .then(data => {
                console.log(data);
                alert('Prodotto aggiunto ai preferiti');
            })
            .catch(error => console.error('Error:', error));
    });

    document.getElementById('back-button').addEventListener('click', function() {
        window.history.back();
    });
});