import 'package:flutter/material.dart';
import 'package:lista_contatos/db.dart';
import 'package:lista_contatos/models/pessoa_model.dart';
import 'package:lista_contatos/views/lista_pessoas.dart';

class Registro extends StatefulWidget {
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {
  TextEditingController nomeController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();

  _cadastro() async{

    Pessoa pessoa = Pessoa(
      nomeController.text, 
      telefoneController.text, 
      emailController.text, 
      senhaController.text
    );

    await DataBase.registerPessoa(
      pessoa.nome, 
      pessoa.email, 
      pessoa.senha, 
      pessoa.telefone
    );

    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => ListaPessoas(),)
      );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Registro Pessoas"),
      ),
      body: SingleChildScrollView(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 30),
          child: Center(
              child: Column(
            children: <Widget>[
              const CircleAvatar(
                radius: 100,
                backgroundImage: NetworkImage(
                    'https://play-lh.googleusercontent.com/ahJtMe0vfOlAu1XJVQ6rcaGrQBgtrEZQefHy7SXB7jpijKhu1Kkox90XDuH8RmcBOXNn'),
                backgroundColor: Colors.green,
              ),
              TextFormField(
                keyboardType: TextInputType.name,
                decoration: const InputDecoration(
                  labelText: "Nome",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                textAlign: TextAlign.left,
                controller: nomeController,
              ),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Telefone",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                textAlign: TextAlign.left,
                controller: telefoneController,
              ),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                decoration: const InputDecoration(
                  labelText: "Email",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                textAlign: TextAlign.left,
                controller: emailController,
              ),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                decoration: const InputDecoration(
                  labelText: "Senha",
                  labelStyle: TextStyle(color: Colors.black, fontSize: 17.0),
                ),
                textAlign: TextAlign.left,
                controller: senhaController,
              ),
              Padding(
                padding: const EdgeInsets.only(top: 40, bottom: 20),
                child: Container(
                  height: 50,
                  width: 200,
                  color: Colors.orange,
                  child: ElevatedButton(
                    onPressed: () {
                      _cadastro();
                    },
                    child: const Text("Registrar"),
                  ),
                ),
              ),
            ],
          ))),
    );
  }
}
