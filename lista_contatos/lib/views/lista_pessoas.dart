import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lista_contatos/db.dart';
import 'package:lista_contatos/models/pessoa_model.dart';

class ListaPessoas extends StatefulWidget {
  const ListaPessoas({super.key});

  @override
  State<ListaPessoas> createState() => _ListaPessoasState();
}

class _ListaPessoasState extends State<ListaPessoas> {
  late List<Map<String, dynamic>> _pessoas = [];

  bool load = true;

  void _loadPessoas() async {
    final pessoas = await DataBase.getPessoas();

    setState(() {
      _pessoas = pessoas;
      load = false;
    });
  }

  @override
  void initState() {
    super.initState();
    _loadPessoas();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Lista Pessoas"),
      ),
      body: load
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.all(10),
              itemCount: _pessoas.length,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: <Widget>[
                      Container(
                        padding: const EdgeInsets.all(5),
                        child: Text(
                          _pessoas[index]['nome'],
                          style: const TextStyle(fontSize:15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(3),
                        child: Text(
                          _pessoas[index]['telefone'],
                          style: const TextStyle(fontSize:15),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.all(4),
                        child: Text(
                          _pessoas[index]['email'],
                          style: const TextStyle(fontSize:15),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
    );
  }
}
