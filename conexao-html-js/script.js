const logo = document.getElementById("logo");

console.log(logo)
//--------------------------------------------------------------

const postAutor =  document.getElementsByClassName("post-autor");

console.log(postAutor)
//--------------------------------------------------------------

const texto = document.querySelector("#post02 .post-texto strong")

console.log(texto);
//---------------------------------------------------------------

const textoDosPost = document.querySelectorAll("strong")

console.log(textoDosPost[0].innerText);


const btn = document.querySelector("button")

const posts = document.querySelector("posts")

let postVisiveis = true

function alternarPosts(){
    postVisiveis = !postVisiveis
    novoTexto =  postVisiveis ? "Esconder posts" : "Mostrar posts"
    btn.innerHTML = novoTexto
    posts.style.display = postVisiveis ? "Block" : "None"
}