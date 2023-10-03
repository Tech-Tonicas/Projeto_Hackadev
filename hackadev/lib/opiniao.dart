import 'package:flutter/material.dart';
import 'model/produtos.dart';

class AvaliacoesProduto extends StatefulWidget {
  final List<Comentario> comentarios;

  const AvaliacoesProduto({super.key, required this.comentarios});

  @override
  _AvaliacoesProdutoState createState() => _AvaliacoesProdutoState();
}

class _AvaliacoesProdutoState extends State<AvaliacoesProduto> {
  TextEditingController nomeUsuarioController = TextEditingController();
  TextEditingController novoComentarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avaliações do Produto'),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: widget.comentarios.length,
              itemBuilder: (context, index) {
                final comentario = widget.comentarios[index];
                return Card(
                  margin: EdgeInsets.all(8.0),
                  child: ListTile(
                    leading: Icon(Icons.account_circle),
                    title: Text(comentario.usuario),
                    subtitle: Text(comentario.texto),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: nomeUsuarioController,
              decoration: InputDecoration(
                hintText: 'Digite seu nome de usuário',
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: novoComentarioController,
              decoration: InputDecoration(
                hintText: 'Adicione um comentário...',
              ),
            ),
          ),
          ElevatedButton(
          onPressed: () {
            final nomeUsuario = nomeUsuarioController.text;
            final novoComentario = Comentario(
              usuario: nomeUsuario,
              texto: novoComentarioController.text,
            );

            setState(() {
              widget.comentarios.add(novoComentario);
              novoComentarioController.clear();
            });
          },
          // definindo o estilo do botão de novos comentarios
          style: ElevatedButton.styleFrom(
            primary: Colors.white,
            onPrimary: Colors.green, 
             textStyle: const TextStyle(
          fontWeight: FontWeight.bold, 
          ),
          ),
          child: const Text('Adicionar Comentário'),
        ),
        ],
      ),
    );
  }
}
