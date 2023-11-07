<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Produtos Web</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #303030;
            margin: 0;
            padding: 0;
        }

        h1 {
            text-align: center;
            padding: 20px;
            color: #52E636;
        }

        #produtos {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            padding: 20px;
        }

        .produto-card {
            background-color: #4E4F4E;
            border: 1px solid #ddd;
            border-radius: 5px;
            margin: 10px;
            padding: 10px;
            max-width: 300px;
            text-align: center;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        .produto-card img {
            max-width: 100%;
            height: auto;
        }

        .produto-card > div {
            margin: 10px 0;
        }

        .produto-card h2 {
            font-size: 1.0rem;
        }

        .produto-card p {
            font-size: 0.9rem;
            color: #282928;
        }

        .preco {
            font-weight: bold;
            color: #282928;
        }

        .comprar-button {
            background-color: #52E636;
            color: #fff;
            border: none;
            padding: 10px 20px;
            border-radius: 5px;
            cursor: pointer;
            font-weight: bold;
            transition: background-color 0.3s;
        }

        .comprar-button:hover {
            background-color: #0E4D03;
        }
    </style>
</head>
<body>
    <h1>Digital Wave</h1>

    <div id="produtos"></div>

    <script>
        function produtoString(produto) {
            return `
                <div class="produto-card">
                    <img src="${produto.urlImagem}" alt="${produto.nome}">
                    <div>
                        <h2>${produto.nome}</h2>
                        <p>${produto.fabricante}</p>
                        <p class="preco">R$ ${produto.preco}</p>
                        <button class="comprar-button">Comprar</button>
                    </div>
                </div>
            `;
        }

        const produtosHtml = document.getElementById('produtos');

        const produtos = fetch('http://localhost:8080/api/products')
            .then((response) => response.json())
            .then((json) => {
                json.forEach((produto) => {
                    produtosHtml.innerHTML += produtoString(produto);
                });
            });
    </script>
</body>
</html>