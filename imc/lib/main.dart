import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MaterialApp(
    home: Imc(),
    ));
}

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();
  String info = "Informe os dados";

  void calcular(){
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text) / 100;
      double imc = peso / (altura * altura);
      //print(imc);
      if (imc <18.5) {
        info = "Abaixo do peso (${imc.toStringAsPrecision(3)})";
      } else if (imc >= 18.5 && imc <=24.99) {
        info = "Peso normal(${imc.toStringAsPrecision(3)})";  
      } else if (imc >= 25.0 && imc <= 29.99) {
        info = "Sobrepeso(${imc.toStringAsPrecision(3)})";
      } else if (imc >= 30.0 && imc <= 34.99) {
        info = "Obesidade grau 1(${imc.toStringAsPrecision(3)})";
      } else {
        info = "Obesidade grau 2(${imc.toStringAsPrecision(3)})";
      }
    });
  }

  void reset(){
    pesoController.text = "";
    alturaController.text = "";
    info = "Informe os dados";
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Calculadora IMC"),
        backgroundColor: Color.fromARGB(255, 216, 114, 31),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){reset();}, icon: Icon(Icons.refresh))
        ],
      ),

      body:  Container(
        padding: EdgeInsets.all(25),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Icon(Icons.person_2_outlined, size: 120, color: Colors.green,),
          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Peso (kg)",
            labelStyle: TextStyle(color: Colors.green)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25),
         controller: pesoController,
          ),


          TextField(keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: "Altura (cm)",
            labelStyle: TextStyle(color: Colors.green)
          ),
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.green, fontSize: 25),
          controller: alturaController,
          ),


          ElevatedButton(
            onPressed: () {calcular();}, 
            child: Text('Calcular'),
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.green,
              textStyle: const TextStyle(color: Colors.white, fontSize:25)
            )
          ),
          
          Text(info,
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.green, fontSize: 25),
          )
        ],
      ),
    ));
  }
}
