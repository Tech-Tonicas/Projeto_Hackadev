import 'package:flutter/material.dart';


void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    title: "Loja Virtual", // Titulo da pagina
    theme: ThemeData.dark(), color: Color(0xFF2B2B2B),
    home: Scaffold(appBar: AppBar(),
    //Body com as categorias
    body: const Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: [
      Column(children: [Icon(Icons.computer, size: 70.0,),Text("Monitores")],
      ),
      Column(children: [Icon(Icons.mouse,size: 70.0,),Text("Mouses")],
      ),
      Column(children: [Icon(Icons.keyboard, size: 70.0,),Text("Teclados")],
      ),
      Column(children: [Icon(Icons.headphones,size: 70.0,),Text("Fones")],)
    ],),)
    
    );  
  }
   
}
