import 'package:flutter/material.dart';
import 'package:hackadev/model/produtos.dart';
import 'package:intl/intl.dart';

import 'MenuNavegacao.dart';
import 'carrinho.dart';
import 'main.dart';


class PaginaCarrinho extends StatefulWidget {
  final Carrinho carrinho;
  final bool appBar;
  final bool footer;

  PaginaCarrinho({
    Key? key,
    required this.carrinho,
    required this.appBar,
    required this.footer,
  }) : super(key: key);

  @override
  _PaginaCarrinhoState createState() => _PaginaCarrinhoState();
}

class _PaginaCarrinhoState extends State<PaginaCarrinho> {
  String formaPagamento = "Boleto"; // Forma de pagamento padrão

  String nomeTitularCartao = "";
  String numeroCartao = "";
  String vencimentoCartao = "";
  int numeroParcelas = 1;

  double calcularDesconto() {
    if (formaPagamento == "PIX") {
      return 0.10; // Desconto de 10% para pagamento via PIX
    } else if (formaPagamento == "Boleto") {
      return 0.05; // Desconto de 5% para pagamento via Boleto
    } else {
      return 0.0; // Sem desconto para outras formas de pagamento
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
  screenWidth > 600; // Define um ponto de interrupção para desktop

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
          crossAxisAlignment: CrossAxisAlignment.start,
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
                : Column(
                    children: widget.carrinho.itens.entries.map((entry) {
                      Produto produto = entry.key;
                      int quantidade = entry.value;
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
                    }).toList(),
                  ),
            Divider(),
            Container(
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
                  Text(
                    'SubTotal',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Forma de Pagamento Selecionada:  $formaPagamento',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Quantidade de Produtos:  ${widget.carrinho.quantidadeTotal}',
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
                    'Valor com Desconto:  $valorComDescontoFormatado',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Divider(),
            
            Container(
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Método de Pagamento',
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
            // Formulário de pagamento com cartão
            if (formaPagamento == 'Cartão')
              Container(
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
                    Text(
                      'Pagar com Cartão',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 8),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Nome do Titular do Cartão'),
                      onChanged: (value) {
                        setState(() {
                          nomeTitularCartao = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration:
                          InputDecoration(labelText: 'Número do Cartão'),
                      onChanged: (value) {
                        setState(() {
                          numeroCartao = value;
                        });
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(
                          labelText: 'Vencimento do Cartão (MM/AA)'),
                      onChanged: (value) {
                        setState(() {
                          vencimentoCartao = value;
                        });
                      },
                    ),
                    DropdownButton<int>(
                      value: numeroParcelas,
                      onChanged: (value) {
                        setState(() {
                          numeroParcelas = value!;
                        });
                      },
                      items: [1, 2, 3].map((int value) {
                        return DropdownMenuItem<int>(
                          value: value,
                          child: Text('$value Parcela(s)'),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
           Align(
  alignment: Alignment.center,
  child: ElevatedButton(
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
),
            SizedBox(height: 16),
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
