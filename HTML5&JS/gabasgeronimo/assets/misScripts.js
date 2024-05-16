let nro = document.getElementById('txbox')
let nroValue = document.getElementById('txbox').value.toString()

function agregarChar(char){
    nro.value = nro.value+char
}

function borrarTxt(){
    nro.value = ''
}

function borrarDigito(){
    nro.value = nroValue.slice(0,nroValue.length-1);
}

function calcular(){
    try {
        nro.
        if(nro.value != null && nro.value != undefined){
            nro.value = eval(nro.value)
        }
    } catch (error) {
        alert("Error")
    }
}

function myalert() {
    alert("Nv");
}