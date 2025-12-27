const password = document.getElementById("password"); 
const lock = document.getElementById("lock");
const candado = document.getElementById("candado");
const loginForm = document.getElementById("loginForm");
const emailInput = document.getElementById("email");
const errorMessage = document.getElementById("errorMessage");

lock.addEventListener('click', () =>{
    const clases = candado.classList;
    if(clases.contains("bi-lock")){
        candado.classList.remove("bi-lock");
        candado.classList.add('bi-unlock');
        password.type="text";
    }else{
        candado.classList.remove("bi-unlock");
        candado.classList.add('bi-lock');
        password.type="password";
    }
    
});

loginForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const email = emailInput.value.trim();
    const passwordValue = password.value.trim();
    
    if (!email || !passwordValue) {
        showError("Por favor, complete todos los campos");
        return;
    }
    
    if (!validateEmail(email)) {
        showError("Por favor, ingrese un correo electrónico válido");
        return;
    }
    
    if (passwordValue.length < 6) {
        showError("La contraseña debe tener al menos 6 caracteres");
        return;
    }
    
    // In a real application, this would send credentials to a server
    // For now, we'll simulate authentication
    authenticateUser(email, passwordValue);
});

function validateEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

function showError(message, isSuccess = false) {
    errorMessage.style.color = isSuccess ? "green" : "red";
    errorMessage.textContent = message;
    errorMessage.style.display = "block";
    setTimeout(() => {
        errorMessage.style.display = "none";
        errorMessage.style.color = "red";
    }, 3000);
}

function authenticateUser(email, password) {
    // Simulate authentication process
    // In a real application, this would validate against a database
    showError("Autenticación en proceso...");
    
    setTimeout(() => {
        // For demonstration, accepting any valid email and password with length >= 6
        // In production, this should validate against actual user credentials
        showError("Inicio de sesión exitoso. Redirigiendo...", true);
        
        setTimeout(() => {
            window.location.href = "/Front/html/Home.html";
        }, 1000);
    }, 500);
}
