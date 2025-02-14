// Método simples: Adicionando um título ao site
const titulo = document.createElement('h1');
titulo.id = 'titulo';
titulo.innerText = "Loja de Produtos Especiais";
document.body.appendChild(titulo);

// Método complexo: Criando um elemento de produto
const produto = document.createElement('div');
produto.innerHTML = `
    <h2>Nome do Produto: Smartphone XYZ</h2>
    <p>Descrição: Um smartphone avançado com câmera de alta resolução e grande capacidade de armazenamento.</p>
    <p>Preço: R$ 1.500,00</p>
    <img src="https://canaljms.com/iphone-se-4-design-rumores-expectativas/" alt="Smartphone XYZ">
`;

// Adicionando o produto ao body do documento
document.body.appendChild(produto);