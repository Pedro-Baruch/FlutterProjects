import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  runApp(const MaterialApp(
    home: Home(),
  ));
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String _logradouro = '';
  String _localidade = '';
  String _uf = '';

  _bucasCep() async {
    var url = Uri.parse('https://viacep.com.br/ws/01001000/json/');
    http.Response response;

    response = await http.get(url);

    Map<String, dynamic> retorno = json.decode(response.body);
    String logradouro = retorno["logradouro"];
    String localidade = retorno["localidade"];
    String uf = retorno["uf"];

    setState(() {
      _logradouro = logradouro;
      _localidade = localidade;
      _uf = uf;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Usando Api'),
      ),
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            ElevatedButton(
                onPressed: () {
                  _bucasCep();
                },
                child: const Text('Buca CEP!')),
            Container(
              padding: EdgeInsets.all(30),
              child: Card(
                child: ListTile(
                  title: Text(_logradouro),
                  subtitle: Text(_localidade),
                  trailing: Text(_uf),
              )),
            ),
          ],
        ),
      ),
    );
  }
}
