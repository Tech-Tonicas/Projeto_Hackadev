import 'package:flutter/material.dart';

class CategoriasWidget extends StatelessWidget{
  const CategoriasWidget({super.key});
  
  @override
  Widget build(BuildContext context) {
    return  SizedBox(child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton.icon(onPressed: () {
          //Função do botão

        },style:ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF52E636), backgroundColor: const Color(0xFF2B2B2B),
        ), icon:const Icon(Icons.monitor,size: 50.0,), label:const Text("Monitores")),
        ElevatedButton.icon(onPressed: () {
          //Função do botão

        },style:ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF52E636), backgroundColor: const Color(0xFF2B2B2B)
        ), icon:const Icon(Icons.mouse_rounded,size: 50.0,), label:const Text("Mouse")),

        ElevatedButton.icon(onPressed: () {
          //Função do botão

        },style:ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF52E636), backgroundColor: const Color(0xFF2B2B2B)
        ), icon:const Icon(Icons.keyboard,size: 50.0,), label:const Text("teclados")),

        ElevatedButton.icon(onPressed: () {
          //Função do botão

        },style:ElevatedButton.styleFrom(
          foregroundColor: const Color(0xFF52E636), backgroundColor: const Color(0xFF2B2B2B)
        ), icon:const Icon(Icons.headphones, size: 50.0,), label:const Text("Fones")),

        
    
      
      ],));
      
    
  }


}