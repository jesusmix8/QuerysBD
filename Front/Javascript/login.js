const password = document.getElementById("password"); 
const lock = document.getElementById("lock");
const candado = document.getElementById("candado")

lock.addEventListener('click', () =>{
    clases = candado.classList
    if(clases.contains("bi-lock")){
        candado.classList.remove("bi-lock");
        candado.classList.add('bi-unlock');
        password.type="text";
    }else{
        candado.classList.remove("bi-unlock");
        candado.classList.add('bi-lock');
        password.type="password";
    }
    
})
