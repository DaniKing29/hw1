document.addEventListener("DOMContentLoaded", function() {
    const decreaseButtons = document.querySelectorAll('.decrease-quantity');
    const increaseButtons = document.querySelectorAll('.increase-quantity');
    const deleteButtons = document.querySelectorAll('.cestino');

    decreaseButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const productId = event.target.getAttribute('data-id');
            updateQuantity(productId, 'decrease');
        });
    });

    increaseButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const productId = event.target.getAttribute('data-id');
            updateQuantity(productId, 'increase');
        });
    });

    deleteButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const productId = event.currentTarget.getAttribute('data-id');
            deleteProduct(productId);
        });
    });

    function updateQuantity(productId, action) {
        fetch(`aggiorna_quantita.php?id=${encodeURIComponent(productId)}&action=${action}`)
        .then(response => response.text())
        .then(data => {
            location.reload();
        })
        .catch(error => console.error('Error:', error));
    }

    function deleteProduct(productId) {
        fetch(`elimina_carrello.php?id=${encodeURIComponent(productId)}`)
        .then(response => response.text())
        .then(data => {
            location.reload();
        })
        .catch(error => console.error('Error:', error));
    }
});