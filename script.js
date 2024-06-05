
/* OVERLAY */

let secondi = 1;
let num = 0;

function CambiaImmagine() {
    let immagini = [];
    immagini[0] = "images/sfondo1.jpg";
    immagini[1] = "images/sfondo2.jpg";
    immagini[2] = "images/sfondo3.jpg";
    
    document.querySelector("#carousel-image").src = immagini[num];
    num = (num + 1 >= immagini.length) ? 0 : num + 1;
    setTimeout(CambiaImmagine, secondi * 1000);
}

CambiaImmagine();


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



/* BEST SELLER */

let columnData = [
    { column: 1 , image: "images/bs1.jpg", title: "INDIVISA X JUVENTUS TOTE BAG NERA", price: "15,00 €"},
    { column: 2 , image: "images/bs2.jpg", title: "JUVENTUS BOTTIGLIA TERMICA", price: "19,90 €"},
    { column: 3 , image: "images/bs3.jpg", title: "JUVENTUS GAZELLE FW32", price: "120,00 €"},
    { column: 4 , image: "images/bs4.jpg", title: "JUVENTUS BERRETTO GIALLO FLUO", price: "27,90 €"},
    { column: 5 , image: "images/bs5.jpg", title: "JUVENTUS ACCAPPATOIO LUXURY", price: "99,90 €"}
];

let previousBtn = document.querySelector('.previous');
let nextBtn = document.querySelector('.next');

let SlideIndex = 0;
let columnElement = document.querySelectorAll('.column');
let imageElement = document.querySelectorAll('.column img');
let titleElement = document.querySelectorAll('.column .titolo p');
let priceElement = document.querySelectorAll('.column .prezzo');


function CambiaColonnaDx() {
    if (SlideIndex < columnData.length - 1) {
        SlideIndex++;
    } else {
        SlideIndex = 0; // Se siamo arrivati all'ultima colonna, ritorna alla prima
    }
    AggiornaColonne();
}

function CambiaColonnaSx() {
    if (SlideIndex > 0) {
        SlideIndex--;
    } else {
        SlideIndex = columnData.length - 1; // Se siamo alla prima colonna, vai all'ultima
    }
    AggiornaColonne();
}
     
function AggiornaColonne() {
    for (let i = 0; i < columnData.length; i++) {
        const dataIndex = (i + SlideIndex) % columnData.length;
        columnElement[i].id = columnData[dataIndex].column;
        imageElement[i].src = columnData[dataIndex].image;
        titleElement[i].textContent = columnData[dataIndex].title;
        priceElement[i].textContent = columnData[dataIndex].price;
    }
}
  
nextBtn.addEventListener('click', CambiaColonnaDx);
previousBtn.addEventListener('click', CambiaColonnaSx);
    

/* TRAINING */
/*
// Funzione per cambiare l'URL dell'immagine nel primo box
function cambiaBox1() {
    this.classList.remove('.box-item1');
    this.classList.add('box-item1-modificata');
}

// Funzione per cambiare l'URL dell'immagine nel secondo box
function cambiaBox2() {
    this.classList.remove('.box-item2');
    this.classList.add('.box-item2-modificata');
}

function tornaBox1(){
    this.classList.remove('.box-item1-modificata');
    this.classList.add('.box-item1');
}

document.querySelector('.box-item1').addEventListener('mouseover', cambiaBox1);
//document.querySelector('.box-item2').addEventListener('click', cambiaBox2);       

*/




/* MODAL TABELLE TAGLIE */


function openTabTaglie() {
    
    document.getElementById("cover").style.width = "100%";
    
  }
  
function closeTabTaglie() {
    console.log("ciao");
    document.getElementById("cover").style.width = "0%";
  }


  const btnTaglie = document.querySelector('.tab-taglie');
  btnTaglie.addEventListener('click', openTabTaglie);

  const closeTaglie = document.querySelector('.closebtn2');
  closeTaglie.addEventListener('click', closeTabTaglie);




  let tabImg = [];
  tabImg[0] = "images/tab0.png";
  tabImg[1] = "images/tab1.png";
  tabImg[2] = "images/tab2.png";
  tabImg[3] = "images/tab3.png"; 
  tabImg[4] = "images/tab4.png"; 
  
  let coll = document.getElementsByClassName("collapsible");
  let i;
  
  for (i = 0; i < coll.length; i++) {
      coll[i].addEventListener("click", function() {
          this.classList.toggle("attivo");
          var content = this.nextElementSibling;
          var dataIndex = content.getAttribute("data-index");
          var imageId = "image-" + dataIndex;
  
          var image = document.getElementById(imageId);
  
          // Controlla se l'immagine esiste già, se sì rimuovila
          if (image) {
              image.parentNode.removeChild(image);
          } else {
              // Altrimenti, crea l'immagine e aggiungila al contenuto
              image = document.createElement("img");
              image.setAttribute("src", tabImg[dataIndex]); // Imposta il percorso dell'immagine usando l'indice
              image.setAttribute("id", imageId); // Imposta l'id dell'immagine
              image.style.maxWidth = "100%"; // Imposta la larghezza massima dell'immagine al 100% del contenitore
              image.style.height = "auto";   // Imposta l'altezza dell'immagine in modo automatico per mantenere l'aspect ratio
              image.style.display = "block"; // Imposta il display a "block" per evitare eventuali spazi vuoti intorno all'immagine
              content.appendChild(image);
  
              // Forza il calcolo delle dimensioni dell'immagine
              image.onload = function() {
                  content.style.maxHeight = content.scrollHeight + "px";
              };
          }
  
          // Controlla se il contenuto è già visibile, se sì nascondilo, altrimenti mostralo
          if (content.style.maxHeight) {
              content.style.maxHeight = null;
          } else {
              content.style.maxHeight = content.scrollHeight + "px";
          }
      });
  }
  




/* PERSONALIZZA IL TUO KIT */

function showHome() {
    document.querySelector('.card-img1').style.backgroundImage = 'url(images/maglietta-casa.jpg)';
    document.querySelector('.card-img2').style.backgroundImage = 'url(images/vlahovic.jpg)';
    const select = document.getElementById('select');
    select.querySelector('option[value="0"]').textContent = 'Home Authentic';
    select.querySelector('option[value="1"]').textContent = 'Home Replica';
    select.querySelector('option[value="2"]').textContent = 'Home Bambino';
}

function showAway() {
    document.querySelector('.card-img1').style.backgroundImage = 'url(images/product.jpg)';
    document.querySelector('.card-img2').style.backgroundImage = 'url(images/product-1.jpg)';
    const select = document.getElementById('select');
    select.querySelector('option[value="0"]').textContent = 'Away Authentic';
    select.querySelector('option[value="1"]').textContent = 'Away Replica';
    select.querySelector('option[value="2"]').textContent = 'Away Bambino';
}

function showThird() {
    document.querySelector('.card-img1').style.backgroundImage = 'url(images/product-2.jpg)';
    document.querySelector('.card-img2').style.backgroundImage = 'url(images/product-3.jpg)';
    const select = document.getElementById('select');
    select.querySelector('option[value="0"]').textContent = 'Third Authentic';
    select.querySelector('option[value="1"]').textContent = 'Third Replica';
    select.querySelector('option[value="2"]').textContent = 'Third Bambino';
}

  document.addEventListener('DOMContentLoaded', function () {
    const headerMenu = document.querySelector('.header-menu');

    headerMenu.addEventListener('click', function (event) {
        const targetSpan = event.target;
        const num = targetSpan.getAttribute('data-num');
  
      switch (num) {
        case '0':      
          showHome();
          break;
        case '1':
          showAway();
          break;
        case '2':
          showThird();
          break;
        default:
          break;
      }
    });
});


// API NEWS 

const apiKey = '8ec8c6d248164231bb6e9bbe0bb124e2';
const newsContainer = document.querySelector('.news-box');

fetch(`https://newsapi.org/v2/everything?q=juventus&language=it&apiKey=${apiKey}`, {
    method: 'GET',
    headers: {
        'X-Api-Key': apiKey
    }
})
    .then(response => {
        if (!response.ok) {
            throw new Error('Errore nella richiesta API');
        }
        return response.json();
    })
    .then(data => {
        console.log(data);
        const articles = data.articles;
        const columns = document.querySelectorAll('.news-box .gallery');
    
        columns.forEach((column, index) => {
            const article = articles[index];
            const titolo = column.querySelector('.desc');
            const imageElement = column.querySelector('img');
    
            if (article) {
                const sourceName = document.createElement('p'); 
                sourceName.textContent = article.source.name; 
                titolo.appendChild(sourceName); 
    
                const titleElement = document.createElement('span');
                titleElement.textContent = article.title;
                titolo.appendChild(titleElement);
    
                if (article.urlToImage) {
                    imageElement.src = article.urlToImage;
                    imageElement.alt = article.title;
                }
            }
        });

    })
    .catch(error => {
        console.error('Si è verificato un errore:', error);
    });




// FORECA API Oauth

const contenitoreMeteo = document.getElementById('contenitore-meteo');

const outfitSopra = document.querySelector('.sopra');
const outfitSotto = document.querySelector('.sotto');

document.getElementById('form').addEventListener('submit', function(event) {
    event.preventDefault(); 

    const inputCitta = document.getElementById('cerca-citta').value; 
    
    fetch(`https://pfa.foreca.com/api/v1/location/search/${inputCitta}?lang=it`, {
      headers: {
        'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZmEuZm9yZWNhLmNvbVwvYXV0aG9yaXplXC90b2tlbiIsImlhdCI6MTcxNDY0NTQ1MiwiZXhwIjo5OTk5OTk5OTk5LCJuYmYiOjE3MTQ2NDU0NTIsImp0aSI6IjVkYmUzYjU1Y2U0NjQ5ZjciLCJzdWIiOiJtb3J0YWxmZW5peHgiLCJmbXQiOiJYRGNPaGpDNDArQUxqbFlUdGpiT2lBPT0ifQ.0p95n7jpMGEVfG1opvHRxjV2xKjSu6hAdVhzsHFmeik'
      }
    })
    .then(response => {
      if (!response.ok) {
        throw new Error('Errore nella richiesta API');
      }
      return response.json();
    })
    .then(data => {
        console.log(data)

        contenitoreMeteo.style.display = 'flex';

      if(data.locations.length > 0) {
        const primoRisultato = data.locations[0];
        const nomeCitta = primoRisultato.name;
        const nazione = primoRisultato.country;
        const meteoCard = document.querySelector('.meteo-card'); 
        meteoCard.innerHTML = `<p>Città: ${nomeCitta}</p>` + 
        `<p>Nazione: ${nazione}</p>`; 

        const indCitta = primoRisultato.id;

        fetchCurrentWeather(indCitta,meteoCard);
      } else {
            console.log("Nessun risultato trovato.");

              const messaggioErr = document.querySelector('.messaggio-errore');
              if (messaggioErr) {
                  messaggioErr.parentNode.removeChild(messaggioErr);
              }
           
            let messaggioErrore = document.createElement('p');
            messaggioErrore.textContent = 'Nessuna città con questo nome trovata. Riprova con un altro nome.';    
            document.querySelector(".box-meteo").appendChild(messaggioErrore);  
            contenitoreMeteo.style.display = 'none'; 
      }
    })
    .catch(error => {
      console.error('Si è verificato un errore:', error);
    });
});

function fetchCurrentWeather(cityId,meteoCard) {
  fetch(`https://pfa.foreca.com/api/v1/current/${cityId}`, {
    headers: {
      'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOlwvXC9wZmEuZm9yZWNhLmNvbVwvYXV0aG9yaXplXC90b2tlbiIsImlhdCI6MTcxNDY0NTQ1MiwiZXhwIjo5OTk5OTk5OTk5LCJuYmYiOjE3MTQ2NDU0NTIsImp0aSI6IjVkYmUzYjU1Y2U0NjQ5ZjciLCJzdWIiOiJtb3J0YWxmZW5peHgiLCJmbXQiOiJYRGNPaGpDNDArQUxqbFlUdGpiT2lBPT0ifQ.0p95n7jpMGEVfG1opvHRxjV2xKjSu6hAdVhzsHFmeik'
    }
  })
  .then(response => {
      if (!response.ok) {
          throw new Error('Errore nella richiesta API');
      }
      return response.json();
  })
  .then(data => {
      console.log("Current Weather:", data);
      const infoMeteo = data.current;

  const dateTimeSplit = infoMeteo.time.split("T");
  const date = dateTimeSplit[0];
  const time = dateTimeSplit[1].substring(0, 5);
  
  const weatherInfo = `
  <p>Temperatura: ${infoMeteo.temperature}°C</p>
  <img src="symbols/${infoMeteo.symbol}.png"> 
  <p>Data: ${date}</p>
  <p>Ora: ${time}</p>
`;

      meteoCard.innerHTML += weatherInfo; 
      mostraOutfit(infoMeteo.temperature, outfitSopra, outfitSotto);
  })
  .catch(error => {
      console.error('Si è verificato un errore:', error);
  });
}


function mostraOutfit(temperatura, sopraDiv, sottoDiv) {
   
    if (temperatura < 10) {
        sopraDiv.innerHTML = '<img src="images/freddo-sopra.jpg" alt="invernale-sopra">';
        sottoDiv.innerHTML = '<img src="images/freddo-sotto.jpg" alt="invernale-sotto">';
    }
   
    else if (temperatura >= 10 && temperatura < 20) {
        sopraDiv.innerHTML = '<img src="images/normale-sopra.jpg" alt="normale-sopra">';
        sottoDiv.innerHTML = '<img src="images/normale-sotto.jpg" alt="normale-sotto">';
    }

    else {
        sopraDiv.innerHTML = '<img src="images/estivo-sopra.jpg" alt="estivo-sopra">';
        sottoDiv.innerHTML = '<img src="images/estivo-sotto.jpg" alt="estivo-sotto">';
    }
}



/*  MENU A TENDINA ICONA */

document.addEventListener('DOMContentLoaded', function() {
    var accountIcon = document.querySelector('.account-icon');
    var menuAccount = document.getElementById("menuAccount");
    
    accountIcon.addEventListener('click', function() {
        menuAccount.style.display = (menuAccount.style.display === "none") ? "flex" : "none"; // Toggle tra visualizzazione e nascondimento del menu
    });
});



// Funzione per aggiornare dinamicamente il numero di prodotti
function updateQuantity(elementId, newValue) {
    var element = document.getElementById(elementId);
    if (element) {
        if (newValue === 0) {
            // Nascondi l'elemento del badge se la quantità è zero
            element.style.display = 'none';
        } else {
            // Altrimenti, mostra l'elemento del badge e aggiorna il suo valore
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
                if (quantity === null) { // Se il valore restituito è null, imposta la quantità a zero
                    quantity = 0;
                }
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
                if (quantity === null) { // Se il valore restituito è null, imposta la quantità a zero
                    quantity = 0;
                }
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

// Esegui l'aggiornamento delle quantità ogni tot di tempo (ad es. ogni 5 secondi)
setInterval(function() {
    updateCartQuantity();
    updateFavoritesQuantity();
}, 5000); // Tempo in millisecondi (5 secondi)
