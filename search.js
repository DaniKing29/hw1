async function searchProducts() {
    const query = document.getElementById('search').value;
    if (query.length > 0) {
        const response = await fetch(`search.php?query=${query}`);
        const products = await response.json();
        let dropdownContent = document.getElementById('dropdown-content');
        dropdownContent.innerHTML = '';

        products.forEach(product => {
            let a = document.createElement('a');
            a.href = `product.php?idProdotto=${product.idProdotto}`; 
            a.innerHTML = `<img src="${product.src}" alt="${product.nomeP}"><span>${product.nomeP}</span>`;
            dropdownContent.appendChild(a);
        });

        dropdownContent.style.display = 'block';
    } else {
        document.getElementById('dropdown-content').style.display = 'none';
    }
}
