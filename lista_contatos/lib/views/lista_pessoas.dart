
import 'package:flutter/material.dart';
import 'package:lista_contatos/db.dart';

List<Map<String, dynamic>> _perfil_pessoa = [];
int _id = 0;

class ListaPessoas extends StatefulWidget {
  const ListaPessoas({super.key});

  @override
  State<ListaPessoas> createState() => _ListaPessoasState();
}

class _ListaPessoasState extends State<ListaPessoas> {
  late List<Map<String, dynamic>> _pessoas = [];

  void _loadPessoas() async {
    final pessoas = await DataBase.getPessoas();

    setState(() {
      _pessoas = pessoas;
    });
  }

  void _verPessoa(int id) async {
    final perfil_pessoa = await DataBase.getPessoaById(id);

    setState(() {
      _perfil_pessoa = perfil_pessoa;
      _id = id;
    });

    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => ver_perfil_pessoa(),
        ));
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
      body: ListView.builder(
          itemCount: _pessoas.length,
          itemBuilder: (BuildContext context, int index) => Card(
                color: Colors.orange,
                child: ListTile(
                  title: Padding(
                    padding: EdgeInsets.only(top: 20, left: 10),
                    child: Text(
                      _pessoas[index]['nome'],
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                  subtitle: Padding(
                    padding: EdgeInsets.only(bottom: 20, left: 10),
                    child: Text(
                      _pessoas[index]['email'],
                      style: TextStyle(fontSize: 15),
                    ),
                  ),
                  trailing: Row(mainAxisSize: MainAxisSize.min, children: [
                    IconButton(
                        onPressed: () {
                          _verPessoa(_pessoas[index]['id']);
                        },
                        icon: Icon(Icons.arrow_forward_ios))
                  ]),
                ),
              )),
    );
  }
}

class ver_perfil_pessoa extends StatefulWidget {
  const ver_perfil_pessoa({super.key});

  @override
  State<ver_perfil_pessoa> createState() => _ver_perfil_pessoaState();
}

class _ver_perfil_pessoaState extends State<ver_perfil_pessoa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Perfil"),
      ),
      body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: _perfil_pessoa.length,
          itemBuilder: (BuildContext context, int index) {
            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  const Padding(padding: EdgeInsets.only(top: 30, bottom: 20)),
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage: NetworkImage(
                        'https://cdn.imgbin.com/2/4/15/imgbin-computer-icons-portable-network-graphics-avatar-icon-design-avatar-DsZ54Du30hTrKfxBG5PbwvzgE.jpg'),
                    backgroundColor: Colors.orange,
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(_perfil_pessoa[index]['nome'],
                          style: const TextStyle(fontSize: 30)),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(_perfil_pessoa[index]['email'],
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding: const EdgeInsets.only(top: 20),
                      child: Text(_perfil_pessoa[index]['telefone'],
                          style: const TextStyle(fontSize: 20)),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.only(top:50),
                    child: FloatingActionButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Icon(Icons.arrow_back_ios),
                    ),
                  )
                ],
              ),
            );
          }),
    );
  }
}
