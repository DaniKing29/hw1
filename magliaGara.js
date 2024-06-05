document.addEventListener("DOMContentLoaded", function() {
    const favoriteButtons = document.querySelectorAll('.add-to-favorites img');

    favoriteButtons.forEach(button => {
        button.addEventListener('click', (event) => {
            const img = event.target;
            const hiddenId = document.getElementById("hiddenId").value;
            const productId = img.getAttribute('data-id');
            const isFavorite = img.src.includes('cuore2.png');
            const action = isFavorite ? 'remove' : 'add';

            fetch(`aggiungi_preferiti.php?id=${encodeURIComponent(productId)}&action=${action}&idUtente=${hiddenId}`)
            .then(response => response.text())
            .then(data => {
                if (action === 'add'){
                    img.src = 'images/cuore2.png';
                }else{
                    img.src = 'images/cuore1.png';
                }
            })
            .catch(error => console.error('Error:', error));
        });
    });
});


document.addEventListener("DOMContentLoaded", function() {
const buttons = document.querySelectorAll('.add-to-cart');
buttons.forEach(button => {
    button.addEventListener('click', (event) => {
        const hiddenId = document.getElementById("hiddenId").value;
        const productId = event.target.closest('.add-to-cart').getAttribute('data-id');

        fetch(`aggiungi_carrello.php?id=${encodeURIComponent(productId)}&idUtente=${hiddenId}`)
            .then(response => response.text())
            .then(data => {
                console.log(data);
                alert('Prodotto aggiunto al carrello');
            })
            .catch(error => console.error('Error:', error));
    });
});
});