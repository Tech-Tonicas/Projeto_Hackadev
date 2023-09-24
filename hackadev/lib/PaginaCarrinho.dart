import 'package:flutter/material.dart';
import 'package:hackadev/carrinho.dart';
import 'package:hackadev/main.dart';
import 'package:hackadev/produtos.dart';
import 'package:intl/intl.dart';
import 'MenuNavegacao.dart';

class PaginaCarrinho extends StatefulWidget {
  final Carrinho carrinho;
  final bool appBar;
  final bool footer;

  PaginaCarrinho(
      {Key? key,
      required this.carrinho,
      required this.appBar,
      required this.footer})
      : super(key: key);

  @override
  _PaginaCarrinhoState createState() => _PaginaCarrinhoState();
}

class _PaginaCarrinhoState extends State<PaginaCarrinho> {
  String formaPagamento = "Boleto";

  double calcularDesconto() {
    if (formaPagamento == "PIX") {
      return 0.10;
    } else if (formaPagamento == "Boleto") {
      return 0.05;
    } else {
      return 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    // Determina o número de colunas para exibir produtos com base no tamanho da tela
    int columnsCount = screenWidth > 600 ? 2 : 1;

    double desconto = calcularDesconto();
    double valorTotalComDesconto =
        widget.carrinho.valorTotal - (widget.carrinho.valorTotal * desconto);

    final currencyFormatter =
        NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');
    String valorComDescontoFormatado =
        currencyFormatter.format(valorTotalComDesconto);
    String valorTotalFormatado =
        currencyFormatter.format(widget.carrinho.valorTotal);

    return Scaffold(
      appBar: widget.appBar
          ? CustomAppBar(
              title: 'Digital Wave',
            )
          : null,
      body: SingleChildScrollView(
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
                : GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: columnsCount,
                    ),
                    shrinkWrap: true,
                    itemCount: widget.carrinho.itens.length,
                    itemBuilder: (context, index) {
                      Produto produto =
                          widget.carrinho.itens.keys.elementAt(index);
                      int quantidade =
                          widget.carrinho.itens.values.elementAt(index);
                      return Card(
                        margin: EdgeInsets.all(8.0),
                        child: ListTile(
                          leading: Image.asset(
                            produto.urlImagem,
                            width: 35,
                            height: 35,
                            fit: BoxFit.cover,
                          ),
                          title: Text(
                            '${produto.nome}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                            ),
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Container(
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
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Forma de Pagamento Selecionada: $formaPagamento',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Quantidade de Produtos: ${widget.carrinho.quantidadeTotal}',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Valor Total: $valorTotalFormatado',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Desconto: ${(desconto * 100).toStringAsFixed(2)}%',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Valor com Desconto: $valorComDescontoFormatado',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
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
            ElevatedButton(
              onPressed: () {
                widget.carrinho.limparCarrinho();
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
      bottomNavigationBar: widget.footer
          ? SizedBox(
              height: 71,
              child: MenuNavegacao(carrinho: widget.carrinho),
            )
          : null,
    );
  }
}
