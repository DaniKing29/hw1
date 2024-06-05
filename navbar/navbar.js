/* MENU ICON */

function openNav() {
    document.getElementById("overlay").style.width = "400px";
  }
  
function closeNav() {
    document.getElementById("overlay").style.width = "0%";
  }


  const topbar = document.querySelector('#myNav');
  topbar.addEventListener('click', openNav);

  const closeBtn  = document.querySelector('.closebtn');
  closeBtn.addEventListener('click', closeNav);



/* AGGIORNA DINAMICAMENTE LA QUANTITA' DEL CARRELLO E DEI PREFERITI */

function updateQuantity(elementId, newValue) {
  var element = document.getElementById(elementId);
  if (element) {
      if (newValue === null || newValue === 0) {
          element.style.display = 'none';
      } else {
          element.style.display = 'inline-block';
          element.innerHTML = newValue;
      }
  }
}

// Funzione per ottenere il numero di prodotti nel carrello
function updateCartQuantity() {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
          if (xhr.status === 200) {
              var quantity = xhr.responseText;
              updateQuantity('carrello-icon', quantity);
          }
      }
  };
  xhr.open('GET', 'getNumCarrello.php', true);
  xhr.send();
}

// Funzione per ottenere il numero di prodotti nei preferiti
function updateFavoritesQuantity() {
  var xhr = new XMLHttpRequest();
  xhr.onreadystatechange = function() {
      if (xhr.readyState === XMLHttpRequest.DONE) {
          if (xhr.status === 200) {
              var quantity = xhr.responseText;
              updateQuantity('preferiti-icon', quantity);
          }
      }
  };
  xhr.open('GET', 'getNumPreferiti.php', true);
  xhr.send();
}

// Esegui l'aggiornamento iniziale delle quantità
updateCartQuantity();
updateFavoritesQuantity();

// Esegui l'aggiornamento delle quantità ogni tot di tempo ogni 5 secondi)
setInterval(function() {
  updateCartQuantity();
  updateFavoritesQuantity();
}, 5000); 




/*  MENU A TENDINA ICONA */

document.addEventListener('DOMContentLoaded', function() {
  var accountIcon = document.querySelector('.account-icon');
  var menuAccount = document.getElementById("menuAccount");
  
  accountIcon.addEventListener('click', function() {
      menuAccount.style.display = (menuAccount.style.display === "none") ? "flex" : "none"; // Toggle tra visualizzazione e nascondimento del menu
  });
});
