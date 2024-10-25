const titulo = document.getElementById("titulo");
const listaNaoOrdenada = document.querySelector("ul");
const link = document.getElementById("link");   

const listaOrdenada = document.getElementById("lista-ordenada");
titulo.innerText = "Manipulando o DOM com JavaScript";
link.innerText = "Visite a Prozeducação";

listaNaoOrdenada.innerHTML = "<li>Item 1</li><li>Item 2</li><li>Item 3</li>";
listaOrdenada.innerHTML = `
    <li><a href="https://www.google.com">Google</a></li>
    <li><a href="https://www.w3schools.com">W3Schools</a></li>
    <li><a href="https://developer.mozilla.org">MDN Web Docs</a></li>
`;
