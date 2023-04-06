import 'package:flutter/material.dart';

class Imc extends StatefulWidget {
  const Imc({super.key});

  @override
  State<Imc> createState() => _ImcState();
}

class _ImcState extends State<Imc> {
  TextEditingController pesoController = TextEditingController();
  TextEditingController alturaController = TextEditingController();

  String _info = "Informe seus dados!";

  void _resetFields() {
    pesoController.text = "";
    alturaController.text = "";
    setState(() {
      _info = "Informe seus dados!";
    });
  }

  void _calcular() {
    setState(() {
      double peso = double.parse(pesoController.text);
      double altura = double.parse(alturaController.text);
      double imc = (peso / (altura * altura)) * 10000;

      if (imc < 18.6) {
        _info = 'Abaixo do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 18.6 && imc < 24.9) {
        _info = 'Peso Ideal (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 24.9 && imc < 29.9) {
        _info = 'Levemente Acima do Peso (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 29.9 && imc < 34.9) {
        _info = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 34.9 && imc < 39.9) {
        _info = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      } else if (imc >= 40) {
        _info = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Scaffold(
        appBar: AppBar(
          title: const Text("Calculadora de IMC"),
          centerTitle: true,
          backgroundColor: Colors.green,
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.refresh),
              onPressed: _resetFields,
            ),
          ],
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const Padding(padding: EdgeInsets.all(10)),
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://cdn.imgbin.com/2/4/15/imgbin-computer-icons-portable-network-graphics-avatar-icon-design-avatar-DsZ54Du30hTrKfxBG5PbwvzgE.jpg'),
                backgroundColor: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Peso (KG)",
                  labelStyle: TextStyle(color: Colors.green, fontSize: 17.0),
                ),
                textAlign: TextAlign.left,
                controller: pesoController,
                validator: (value) {
                  if (value!.isEmpty) {
                    _info = "Insira sua peso!";
                  }
                  return null;
                },
              ),
              TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    labelText: "Altura (CM)",
                    labelStyle: TextStyle(color: Colors.green, fontSize: 17.0),
                  ),
                  textAlign: TextAlign.left,
                  controller: alturaController,
                  validator: (value) {
                    if (value!.isEmpty) {
                      _info = "Insira sua altura!";
                    }
                    return null;
                  }),
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
