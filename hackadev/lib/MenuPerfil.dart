import 'package:flutter/material.dart';
import 'package:hackadev/main.dart';

class MenuPerfil extends StatefulWidget {
  @override
  _MenuPerfilState createState() => _MenuPerfilState();
}

class _MenuPerfilState extends State<MenuPerfil> {
  String nome = "Seu Nome";
  String email = "seuemail@example.com";
  String senha = "";
  bool lembrarSenha = false;
  bool isCadastro = true;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController senhaController = TextEditingController();

  void alternarModo() {
    setState(() {
      isCadastro = !isCadastro;
    });
  }

  void cadastrar() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        nome = nomeController.text;
        email = emailController.text;
        senha = senhaController.text;
        lembrarSenha = false;
      });
    }
  }

  @override
  void dispose() {
    nomeController.dispose();
    emailController.dispose();
    senhaController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;

    return Scaffold(
      appBar: CustomAppBar(title: 'Digital Wave'),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                TextFormField(
                  controller: nomeController,
                  decoration: InputDecoration(labelText: 'Nome Completo'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira seu nome';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira seu email';
                    }
                    return null;
                  },
                ),
                SizedBox(height: 10),
                TextFormField(
                  controller: senhaController,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    labelStyle: TextStyle(
                      color: lembrarSenha ? Colors.grey : null,
                    ),
                  ),
                  obscureText: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Por favor, insira sua senha';
                    }
                    return null;
                  },
                ),
                Row(
                  children: <Widget>[
                    Checkbox(
                      value: lembrarSenha,
                      onChanged: (bool? value) {
                        setState(() {
                          lembrarSenha = value ?? false;
                        });
                      },
                    ),
                    Text("Lembrar senha"),
                  ],
                ),
                SizedBox(height: screenWidth * 0.04),
                ElevatedButton(
                  onPressed: cadastrar,
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 82, 230, 54),
                  ),
                  child: Text("Cadastrar"),
                ),
                SizedBox(height: screenWidth * 0.02),
                GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/TermosPoliticaPrivacidade');
                  },
                  child: Text(
                    "Termos de Política de Privacidade",
                    style: TextStyle(
                      color: Color.fromARGB(255, 44, 243, 33),
                      decoration: TextDecoration.underline,
                    ),
                  ),
                ),
                SizedBox(height: screenWidth * 0.02),
                TextButton(
                  onPressed: alternarModo,
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text(isCadastro
                      ? "Já possui uma conta? Faça o login."
                      : "Não possui uma conta? Cadastre-se."),
                ),
                SizedBox(height: screenWidth * 0.02),
                TextButton(
                  onPressed: () {
                    // Será no futuro implementada regra para "Esqueceu a senha?"
                  },
                  style: TextButton.styleFrom(
                    primary: Colors.white,
                  ),
                  child: Text("Esqueceu a senha?"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton.icon(
                      onPressed: () {
                        // Será no futuro implementada regra para login com Gmail
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      icon: Icon(Icons.mail, color: Colors.red),
                      label: Text(
                        "Gmail",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                    SizedBox(width: 20),
                    ElevatedButton.icon(
                      onPressed: () {
                        // ISerá no futuro implementada regra para login Facebook
                      },
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white,
                      ),
                      icon: Icon(Icons.facebook, color: Colors.blue),
                      label: Text(
                        "Facebook",
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
