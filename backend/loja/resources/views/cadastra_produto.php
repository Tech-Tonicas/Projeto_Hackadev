<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Cadastro de produto</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div class="container">
    <h1 class="mt-4">Cadastro de Produto</h1>

    <form action="/api/products" method="post" class="mt-4">
        <div class="form-group">
            <label for="nome">Nome:</label>
            <input type="text" name="nome" class="form-control" id="nome" required>
        </div>
        <div class="form-group">
            <label for="fabricante">Fabricante:</label>
            <input type="text" name="fabricante" class="form-control" id="fabricante" required>
        </div>
        <div class="form-group">
            <label for="resumo">Resumo:</label>
            <input type="text" name="resumo" class="form-control" id="resumo" required>
        </div>
        <div class="form-group">
            <label for="preco">Preço:</label>
            <input type="number" step=".01" name="preco" class="form-control" id="preco" required>
        </div>
        <div class="form-group">
            <label for="urlImagem">URL da Imagem:</label>
            <input type="text" name="urlImagem" class="form-control" id="urlImagem" required>
        </div>
        <div class="form-group">
            <label for="categorias">Categoria:</label>
            <input type="text" name="categorias" class="form-control" id="categorias" required>
        </div>
        <div class="form-group">
            <label for="cor">Cor:</label>
            <input type="text" name="cor" class="form-control" id="cor" required>
        </div>
        <div class="form-group">
            <label for="descricao">Descrição:</label>
            <input type="text" name="descricao" class="form-control" id="descricao" required>
        </div>
        <button type="submit" class="btn btn-primary">Cadastrar</button>
    </form>
</div>

<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>