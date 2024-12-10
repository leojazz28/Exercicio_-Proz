const h2 = document.querySelector("h2")

h2.style.color = "Green";
h2.style.fontSize = "32px"

const input = document.querySelector("input");


input.classList.add("erro");

const paragrafo = document.querySelector("p");

paragrafo.classList.add("visible");

const input2 = document.querySelector("input[type='password']");

input2.classList.add("correct");

input.classList.replace("erro", "currect")

paragrafo.classList.remove("visible")