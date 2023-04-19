import 'package:sqflite/sqflite.dart' as sqflite;
import 'package:path/path.dart';
import 'package:sqflite/sqlite_api.dart';

class DataBase {
  static Future<sqflite.Database> db() async {
    var DataBasePath = await sqflite.getDatabasesPath();

    String path = join(DataBasePath, 'banco.db');

    var bd = await sqflite.openDatabase(path, version: 1,
        onCreate: (db, veraoRecente) async {
      await db.execute(
          "CREATE TABLE pessoas (id INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL, nome TEXT, senha TEXT, email TEXT, telefone TEXT)");
    });

    print('Banco: ' + bd.isOpen.toString());

    return bd;
  }

  static Future<int> registerPessoa(
      String nome, String email, String senha, String telefone) async {
    final db = await DataBase.db();

    final data = {
      'nome': nome,
      'telefone': telefone,
      'email': email,
      'senha': senha
    };

    final id = await db.insert('pessoas', data);

    return id;
  }

  static Future<List<Map<String, dynamic>>> getPessoas() async {
    final db = await DataBase.db();

    return db.query('pessoas');
  }
}
