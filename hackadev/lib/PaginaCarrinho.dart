import 'package:flutter/material.dart';
import 'package:hackadev/carrinho.dart';
import 'package:hackadev/main.dart';
import 'package:hackadev/produtos.dart';
import 'package:intl/intl.dart';

class PaginaCarrinho extends StatefulWidget {
  final Carrinho carrinho;

  PaginaCarrinho({Key? key, required this.carrinho}) : super(key: key);

  @override
  _PaginaCarrinhoState createState() => _PaginaCarrinhoState();
}

class _PaginaCarrinhoState extends State<PaginaCarrinho> {
  String formaPagamento = "Boleto";

  // Função para calcular o desconto com base na forma de pagamento
  double calcularDesconto() {
    if (formaPagamento == "PIX") {
      return 0.10; // 10% de desconto para PIX
    } else if (formaPagamento == "Boleto") {
      return 0.05; // 5% de desconto para Boleto
    } else {
      return 0.0; // Sem desconto para Cartão
    }
  }

  @override
  Widget build(BuildContext context) {
    // Calcular o desconto com base na forma de pagamento selecionada
    double desconto = calcularDesconto();

    // Calcular o valor total com desconto
    double valorTotalComDesconto =
        widget.carrinho.valorTotal - (widget.carrinho.valorTotal * desconto);

    final currencyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String valorComDescontoFormatado =
        currencyFormatter.format(valorTotalComDesconto);
    String valorTotalFormatado =
        currencyFormatter.format(widget.carrinho.valorTotal);

    // Estilos de texto para Meus Valores
    TextStyle meusValoresTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    TextStyle valoresTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    // Estilo de texto para a Forma de Pagamento
    TextStyle formaPagamentoTextStyle = TextStyle(
      fontSize: 18,
      fontWeight: FontWeight.bold,
    );

    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
      ),
      body: SingleChildScrollView(
        // Adicionado SingleChildScrollView
        child: Column(
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
                : Container(
                    height: 300,
                    child: ListView.builder(
                      shrinkWrap: true, // Definir shrinkWrap como true
                      itemCount: widget.carrinho.itens.length,
                      itemBuilder: (context, index) {
                        Produto produto =
                            widget.carrinho.itens.keys.elementAt(index);
                        int quantidade =
                            widget.carrinho.itens.values.elementAt(index);
                        return Card(
                          margin: EdgeInsets.symmetric(
                            vertical: 8.0,
                            horizontal: 12.0,
                          ),
                          child: ListTile(
                            leading: Image.asset(
                              produto.urlImagem,
                              width: 35,
                              height: 35,
                              fit: BoxFit.cover,
                            ),
                            title: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  '${produto.nome}',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    widget.carrinho.removerProduto(produto);
                                    setState(() {});
                                  },
                                  icon: Icon(Icons.delete),
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
            Container(
              child: Row(
                // Usando Row para a forma de pagamento
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      // Container "Meus Valores"
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(8.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Center(
                            child: Text(
                              'Meus Valores',
                              style: meusValoresTextStyle,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Forma de Pagamento Selecionada: $formaPagamento',
                            style: valoresTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Quantidade de Produtos: ${widget.carrinho.quantidadeTotal}',
                            style: valoresTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Valor Total: $valorTotalFormatado',
                            style: valoresTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Desconto: ${(desconto * 100).toStringAsFixed(2)}%',
                            style: valoresTextStyle,
                          ),
                          SizedBox(height: 8),
                          Text(
                            'Valor com Desconto: $valorComDescontoFormatado',
                            style: valoresTextStyle,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.all(16),
                      padding: EdgeInsets.all(16),
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
                            'Forma de Pagamento',
                            style: formaPagamentoTextStyle,
                          ),
                          RadioListTile(
                            title: Text(
                              'Boleto',
                              style: formaPagamento == 'Boleto'
                                  ? TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : null,
                            ),
                            value: "Boleto",
                            groupValue: formaPagamento,
                            onChanged: (value) {
                              setState(() {
                                formaPagamento = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'Cartão',
                              style: formaPagamento == 'Cartão'
                                  ? TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : null,
                            ),
                            value: "Cartão",
                            groupValue: formaPagamento,
                            onChanged: (value) {
                              setState(() {
                                formaPagamento = value.toString();
                              });
                            },
                          ),
                          RadioListTile(
                            title: Text(
                              'PIX',
                              style: formaPagamento == 'PIX'
                                  ? TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    )
                                  : null,
                            ),
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
                  ),
                ],
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // Regra para finalizar a compra
                widget.carrinho.limparCarrinho(); // Limpa o carrinho
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => MyApp(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                primary: Color(0xFF52E636),
              ),
              child: Text('Finalizar Compra'),
            ),
          ],
        ),
      ),
    );
  }
}
