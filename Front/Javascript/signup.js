const password = document.getElementById("password"); 
const lock = document.getElementById("lock");
const candado = document.getElementById("candado");
const signupForm = document.getElementById("signupForm");
const errorMessage = document.getElementById("errorMessage");

// Password visibility toggle
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

// Form submission handling
signupForm.addEventListener('submit', (e) => {
    e.preventDefault();
    
    const rfc = document.getElementById("rfc").value.trim();
    const nombre = document.getElementById("nombre").value.trim();
    const apellidos = document.getElementById("apellidos").value.trim();
    const user = document.getElementById("user").value.trim();
    const telefono = document.getElementById("telefono").value.trim();
    const fechaNacimiento = document.getElementById("fechaNacimiento").value;
    const email = document.getElementById("email").value.trim();
    const passwordValue = password.value.trim();
    const genero = document.querySelector('input[name="genero"]:checked');
    
    // Validate all fields are filled
    if (!rfc || !nombre || !apellidos || !user || !telefono || !fechaNacimiento || !email || !passwordValue) {
        showError("Por favor, complete todos los campos");
        return;
    }
    
    // Validate gender is selected
    if (!genero) {
        showError("Por favor, seleccione un género");
        return;
    }
    
    // Validate RFC format (basic validation)
    // RFC format: 4 letters + 6 digits + 3 alphanumeric characters (homoclave)
    const rfcRegex = /^[A-ZÑ&]{3,4}\d{6}[A-Z0-9]{2,3}$/i;
    if (!rfcRegex.test(rfc)) {
        showError("El RFC debe tener el formato correcto (ej: ABCD123456XY1)");
        return;
    }
    
    // Validate email format
    if (!validateEmail(email)) {
        showError("Por favor, ingrese un correo electrónico válido");
        return;
    }
    
    // Validate phone number
    const phoneRegex = /^\d{10,}$/;
    if (!phoneRegex.test(telefono)) {
        showError("El número de teléfono debe contener solo dígitos y tener al menos 10 caracteres");
        return;
    }
    
    // Validate password strength
    if (passwordValue.length < 6) {
        showError("La contraseña debe tener al menos 6 caracteres");
        return;
    }
    
    // In a real application, this would send data to a server
    // For now, we'll simulate registration
    registerUser();
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

function registerUser() {
    // Simulate registration process
    showError("Registro en proceso...");
    
    setTimeout(() => {
        showError("Registro exitoso. Redirigiendo al inicio de sesión...", true);
        
        setTimeout(() => {
            window.location.href = "/Front/html/login.html";
        }, 1000);
    }, 500);
}
