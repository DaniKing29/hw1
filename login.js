
document.addEventListener('DOMContentLoaded', (event) => {
    const passwordInput = document.getElementById('password');
    const toggleEye = document.getElementById('toggleEye');

    toggleEye.addEventListener('click', () => {
        const isPasswordVisible = passwordInput.type === 'text';

        if (isPasswordVisible) {
            passwordInput.type = 'password';
            toggleEye.src = 'images/eye-open.svg';
        } else {
            passwordInput.type = 'text';
            toggleEye.src = 'images/eye-close.svg';
        }
    });
});


function validateLoginForm() {
    var usernameInput = document.getElementsByName('username')[0];
    var passwordInput = document.getElementById('password');
    var usernameLabel = document.querySelector('label[for="username"]');
    var passwordLabel = document.querySelector('label[for="password"]');
    var errorUsername = document.getElementById('errorUsername');
    var errorPassword = document.getElementById('errorPassword');

    var usernameValue = usernameInput.value.trim();
    var passwordValue = passwordInput.value.trim();
    var isValid = true;

    // Controllo validità dello username
    if (usernameValue === undefined || usernameValue === "") {
        usernameLabel.classList.remove("input-label-ok");
        usernameLabel.classList.add("input-label-error");
        errorUsername.innerHTML = "Inserisci lo username";
        isValid = false;
    } else {
        usernameLabel.classList.remove("input-label-error");
        usernameLabel.classList.add("input-label-ok");
        errorUsername.innerHTML = "";
    }

    // Controllo validità della password
    if (passwordValue === undefined || passwordValue === "") {
        passwordLabel.classList.remove("input-label-ok");
        passwordLabel.classList.add("input-label-error");
        errorPassword.innerHTML = "Inserisci la password";
        isValid = false;
    } else {
        passwordLabel.classList.remove("input-label-error");
        passwordLabel.classList.add("input-label-ok");
        errorPassword.innerHTML = "";
    }

    return isValid; // Ritorna true se tutti i campi sono validi, altrimenti false
}
