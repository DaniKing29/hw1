
    document.addEventListener('DOMContentLoaded', () => {
        // Funzione per toggle la visibilità della password
        function togglePasswordVisibility(inputId, toggleId) {
            const passwordInput = document.getElementById(inputId);
            const toggleIcon = document.getElementById(toggleId);

            toggleIcon.addEventListener('click', () => {
                const isPasswordVisible = passwordInput.type === 'text';
                passwordInput.type = isPasswordVisible ? 'password' : 'text';
                toggleIcon.src = isPasswordVisible ? 'images/eye-open.svg' : 'images/eye-close.svg';
            });
        }

        // Aggiungi gli event listener per entrambi i campi password
        togglePasswordVisibility('password', 'togglePassword');
        togglePasswordVisibility('confirmPassword', 'toggleConfirmPassword');
    });





    let inputList = {
        nome: 0,
        cognome: 0,
        email: 0,
        username: 0,
        password: 0,
        confirmPassword: 0
    };
    
    function textValidate(myInput) {
        let myInputValue = myInput.value.trim();
        let myInputCheck = document.getElementById(myInput.id + "check");
        let minLength = 3;
        let label = myInput.previousElementSibling;
    
        if (myInputValue === undefined || myInputValue === "" || myInputValue.length < minLength) {
            myInputCheck.classList.remove("okCheck");
            myInputCheck.classList.add("errorCheck");
            myInputCheck.innerHTML = `Minimo ${minLength} caratteri`;
            myInput.style.borderColor = "red";
            label.classList.remove("input-label-ok");
            label.classList.add("input-label-error");
            inputList[myInput.id] = 0;
        } else {
            myInputCheck.classList.remove("errorCheck");
            myInputCheck.classList.add("okCheck");
            myInputCheck.innerHTML = "";
            myInput.style.borderColor = "green";
            label.classList.remove("input-label-error");
            label.classList.add("input-label-ok");
            if (myInput.id === 'username') {
                checkUsernameAvailability(myInputValue);
            } else {
                inputList[myInput.id] = 1;
            }
        }
        checkAllInput();
    }
    
    function checkEmailAvailability(email) {
        fetch('checkEmail.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `email=${encodeURIComponent(email)}`
        })
        .then(response => response.json())
        .then(data => {
            let emailCheck = document.getElementById('emailcheck');
            let label = document.getElementById('email').previousElementSibling;
            if (data.exists) {
                emailCheck.classList.remove('okCheck');
                emailCheck.classList.add('errorCheck');
                emailCheck.innerHTML = 'Email già in uso';
                document.getElementById('email').style.borderColor = 'red';
                label.classList.remove("input-label-ok");
                label.classList.add("input-label-error");
                inputList['email'] = 0;
            } else {
                emailCheck.classList.remove('errorCheck');
                emailCheck.classList.add('okCheck');
                emailCheck.innerHTML = '';
                document.getElementById('email').style.borderColor = 'green';
                label.classList.remove("input-label-error");
                label.classList.add("input-label-ok");
                inputList['email'] = 1;
            }
            checkAllInput();
        })
        .catch(error => console.error('Error:', error));
    }
    
    function checkUsernameAvailability(username) {
        fetch('checkUsername.php', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/x-www-form-urlencoded',
            },
            body: `username=${encodeURIComponent(username)}`
        })
        .then(response => response.json())
        .then(data => {
            let usernameCheck = document.getElementById('usernamecheck');
            let label = document.getElementById('username').previousElementSibling;
            if (data.exists) {
                usernameCheck.classList.remove('okCheck');
                usernameCheck.classList.add('errorCheck');
                usernameCheck.innerHTML = 'Username già in uso';
                document.getElementById('username').style.borderColor = 'red';
                label.classList.remove("input-label-ok");
                label.classList.add("input-label-error");
                inputList['username'] = 0;
            } else {
                usernameCheck.classList.remove('errorCheck');
                usernameCheck.classList.add('okCheck');
                usernameCheck.innerHTML = '';
                document.getElementById('username').style.borderColor = 'green';
                label.classList.remove("input-label-error");
                label.classList.add("input-label-ok");
                inputList['username'] = 1;
            }
            checkAllInput();
        })
        .catch(error => console.error('Error:', error));
    }
    
    document.getElementById('email').addEventListener('keyup', function() {
        emailValidate(this);
        checkEmailAvailability(this.value);
    });
    
    document.getElementById('username').addEventListener('keyup', function() {
        textValidate(this);
        checkUsernameAvailability(this.value);
    });
    
    function emailValidate(myInput) {
        let myInputValue = myInput.value.trim();
        let myInputCheck = document.getElementById(myInput.id + "check");
        let emailRegex = /\S+@\S+\.\S+/;
        let label = myInput.previousElementSibling;
    
        if (myInputValue === undefined || myInputValue === "" || !emailRegex.test(myInputValue)) {
            myInputCheck.classList.remove("okCheck");
            myInputCheck.classList.add("errorCheck");
            myInputCheck.innerHTML = "Email non valida";
            myInput.style.borderColor = "red";
            label.classList.remove("input-label-ok");
            label.classList.add("input-label-error");
            inputList[myInput.id] = 0;
        } else {
            myInputCheck.classList.remove("errorCheck");
            myInputCheck.classList.add("okCheck");
            myInputCheck.innerHTML = "";
            myInput.style.borderColor = "green";
            label.classList.remove("input-label-error");
            label.classList.add("input-label-ok");
            checkEmailAvailability(myInputValue);
        }
        checkAllInput();
    }
    
    function passwordValidate(myInput) {
        let myInputValue = myInput.value.trim();
        let myInputCheck = document.getElementById(myInput.id + "check");
        let passwordRegex = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W).{8,}$/;
        let label = myInput.previousElementSibling;
        let errorMessages = [];
    
        if (myInputValue === undefined || myInputValue === "") {
            errorMessages.push("La password non può essere vuota");
        }
    
        if (myInputValue.length < 8) {
            errorMessages.push("La password deve essere lunga almeno 8 caratteri");
        }
    
        if (!/\d/.test(myInputValue)) {
            errorMessages.push("La password deve contenere almeno un numero");
        }
    
        if (!/[a-z]/.test(myInputValue)) {
            errorMessages.push("La password deve contenere almeno una lettera minuscola");
        }
    
        if (!/[A-Z]/.test(myInputValue)) {
            errorMessages.push("La password deve contenere almeno una lettera maiuscola");
        }
    
        if (!/\W/.test(myInputValue)) {
            errorMessages.push("La password deve contenere almeno un carattere speciale");
        }
    
        if (errorMessages.length > 0) {
            myInputCheck.classList.remove("okCheck");
            myInputCheck.classList.add("errorCheck");
            myInputCheck.innerHTML = errorMessages[0];
            myInput.style.borderColor = "red";
            label.classList.remove("input-label-ok");
            label.classList.add("input-label-error");
            inputList[myInput.id] = 0;
        } else {
            myInputCheck.classList.remove("errorCheck");
            myInputCheck.classList.add("okCheck");
            myInputCheck.innerHTML = "";
            myInput.style.borderColor = "green";
            label.classList.remove("input-label-error");
            label.classList.add("input-label-ok");
            inputList[myInput.id] = 1;
        }
    
        confirmPasswordValidate(document.getElementById("confirmPassword"));
        checkAllInput();
    }
    
    function confirmPasswordValidate(myInput) {
        let myInputValue = myInput.value.trim();
        let myInputCheck = document.getElementById(myInput.id + "check");
        let passwordValue = document.getElementById("password").value.trim();
        let label = myInput.previousElementSibling;
    
        if (myInputValue !== passwordValue) {
            myInputCheck.classList.remove("okCheck");
            myInputCheck.classList.add("errorCheck");
            myInputCheck.innerHTML = "Le password non coincidono";
            myInput.style.borderColor = "red";
            label.classList.remove("input-label-ok");
            label.classList.add("input-label-error");
            inputList[myInput.id] = 0;
        } else {
            myInputCheck.classList.remove("errorCheck");
            myInputCheck.classList.add("okCheck");
            myInputCheck.innerHTML = "";
            myInput.style.borderColor = "green";
            label.classList.remove("input-label-error");
            label.classList.add("input-label-ok");
            inputList[myInput.id] = 1;
        }
    
        checkAllInput();
    }
    
    function checkAllInput() {
        if (Object.keys(inputList).length < 6) {
            document.getElementById("registrationButton").disabled = true;
            return;
        }
    
        for (const key in inputList) {
            if (inputList.hasOwnProperty(key) && inputList[key] === 0) {
                document.getElementById("registrationButton").disabled = true;
                return;
            }
        }
        document.getElementById("registrationButton").disabled = false;
    }
    
    document.addEventListener('DOMContentLoaded', function() {
        document.getElementById('password').addEventListener('keyup', function() {
            passwordValidate(this);
            confirmPasswordValidate(document.getElementById('confirmPassword'));
        });
    
        document.getElementById('confirmPassword').addEventListener('keyup', function() {
            confirmPasswordValidate(this);
        });
    });
    