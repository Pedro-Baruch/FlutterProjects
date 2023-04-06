import 'package:flutter/material.dart';

class Gasolina extends StatefulWidget {
  const Gasolina({super.key});

  @override
  State<Gasolina> createState() => _GasolinaState();
}

class _GasolinaState extends State<Gasolina> {
  TextEditingController alcoolController = TextEditingController();
  TextEditingController gasolinaController = TextEditingController();

  String _info = "Informe os valores!";

  void _resetFields() {
    alcoolController.text = "";
    gasolinaController.text = "";
    setState(() {
      _info = "Informe os valores!";
    });
  }

  void _calcular() {
    setState(() {
      double alcool = double.parse(alcoolController.text);
      double gasolina = double.parse(gasolinaController.text);
      double calculo = alcool / gasolina;

      if(calculo > 0.7){
        _info = "Gasolina é melhor!";
      }else{
        _info = "Alcool é melhor!";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            const Padding(padding: EdgeInsets.all(10)),
            const CircleAvatar(
              radius: 100,
              backgroundImage: NetworkImage(
                  'https://img2.icarros.com/dbimg/imgnoticia/4/28901_1'),
              backgroundColor: Colors.green,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Alcool",
                labelStyle: TextStyle(color: Colors.green, fontSize: 17.0),
              ),
              textAlign: TextAlign.left,
              controller: alcoolController,
            ),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Gasolina",
                labelStyle: TextStyle(color: Colors.green, fontSize: 17.0),
              ),
              textAlign: TextAlign.left,
              controller: gasolinaController,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, bottom: 20),
              child: Container(
                height: 50,
                color: Colors.green,
                child: ElevatedButton(
                  onPressed: () {
                    _calcular();
                  },
                  child: const Text("Calcular"),
                ),
              ),
            ),
            Text(_info,
                textAlign: TextAlign.center,
                style: const TextStyle(color: Colors.green, fontSize: 17.0))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _resetFields();
        },
        backgroundColor: Colors.green,
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
