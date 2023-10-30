
const a = document.querySelectorAll("a");
const boton = document.querySelectorAll("button");

a.forEach(enlace => {
    enlace.addEventListener('click',function(){
    a.forEach(function(e){
        e.classList.remove('active');
        e.classList.add('inactive');
    })
    enlace.classList.remove('inactive');
    enlace.classList.add('active')

    })
})

boton.forEach(btn => {
    btn.addEventListener('click',function(){

        boton.forEach((e)=>{
            e.classList.remove('btn-active')
            e.classList.add('btn-inactive');
        } )

        btn.classList.add('btn-active')
}) })

const ctx = document.getElementById("myChart").getContext("2d");
const meses = ["Ene", "Feb", "Mar", "Abr", "May", "Jun"];
const cantidades = [10, 20, 15, 30, 25, 40];
const myChart = new Chart(ctx, {
  type: "line",
  data: {
    labels: meses,
    datasets: [
      {
        label: "Cantidad",
        data: cantidades,
        borderColor: "blue",
        borderWidth: 1,
        fill: false,
      },
    ],
  },
  options: {
    scales: {
      y: {
        beginAtZero: true,
      },
    },
  },
});
