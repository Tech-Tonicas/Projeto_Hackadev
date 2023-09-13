import 'package:flutter/material.dart';
import 'package:hackadev/carrinho.dart';
import 'package:hackadev/produtos.dart';
import 'package:hackadev/main.dart';

class PaginaCarrinho extends StatefulWidget {
  final Carrinho carrinho;

  PaginaCarrinho({Key? key, required this.carrinho}) : super(key: key);

  @override
  _PaginaCarrinhoState createState() => _PaginaCarrinhoState();
}

class _PaginaCarrinhoState extends State<PaginaCarrinho> {
  String formaPagamento =
      "Boleto"; // Inicialmente, a forma de pagamento é definida como Boleto

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: Column(
        children: [
          widget.carrinho.itens.isEmpty
              ? Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: Text(
                    'Carrinho Vazio',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )
              : Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: ListView.builder(
                      itemCount: widget.carrinho.itens.length,
                      itemBuilder: (context, index) {
                        Produto produto =
                            widget.carrinho.itens.keys.elementAt(index);
                        int quantidade =
                            widget.carrinho.itens.values.elementAt(index);
                        return Container(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 16.0,
                          ),
                          padding: EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.grey,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              produto.urlImagem,
                              width: 50,
                              height: 50,
                              fit: BoxFit.cover,
                            ),
                            title: Text(produto.nome),
                            subtitle: Text(produto.descricao),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    widget.carrinho.removerProduto(produto);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.remove),
                                ),
                                Text('$quantidade'),
                                IconButton(
                                  onPressed: () {
                                    widget.carrinho.adicionarProduto(produto);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.add),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
          Container(
            padding: EdgeInsets.all(16),
            margin: EdgeInsets.all(16), // Margem ao redor do sumário
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  'Quantidade de Produtos: ${widget.carrinho.quantidadeTotal}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 8),
                Text(
                  'Valor Total: ${widget.carrinho.valorTotalFormatado}',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.all(16), // Margem ao redor do novo sumário
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey,
                width: 1.0,
              ),
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Column(
              children: [
                Text(
                  'Forma de Pagamento:',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                RadioListTile(
                  title: Text('Boleto'),
                  value: "Boleto",
                  groupValue: formaPagamento,
                  onChanged: (value) {
                    setState(() {
                      formaPagamento = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('Cartão'),
                  value: "Cartão",
                  groupValue: formaPagamento,
                  onChanged: (value) {
                    setState(() {
                      formaPagamento = value.toString();
                    });
                  },
                ),
                RadioListTile(
                  title: Text('PIX'),
                  value: "PIX",
                  groupValue: formaPagamento,
                  onChanged: (value) {
                    setState(() {
                      formaPagamento = value.toString();
                    });
                  },
                ),
              ],
            ),
          ),
          ElevatedButton(
            onPressed: () {
              // Lógica para finalizar a compra
              widget.carrinho.limparCarrinho(); // Limpa o carrinho
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      MyApp(), // Substitui pela tela inicial (MyApp)
                ),
              );
            },
            style: ElevatedButton.styleFrom(
              primary: Color(0xFF52E636), // Cor de fundo desejada
            ),
            child: Text('Finalizar Compra'),
          ),
        ],
      ),
    );
  }
}
