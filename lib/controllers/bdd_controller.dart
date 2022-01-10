import 'package:mysql1/mysql1.dart';

class BddController {

  static final _connectionInformations = ConnectionSettings(
      host: BddConstants.host,
      port: BddConstants.port,
      user: BddConstants.user,
      password: BddConstants.password,
      db: BddConstants.db);

  var _connection;

  // Possible de maintenir une connexion ouverte ?
  void openConnection()
  {
    _connection = MySqlConnection.connect(_connectionInformations);
  }
}

class BddConstants {
  static const String host = '';
  static const String user = 'root';
  static const String password = '';
  static const String db = 'pizzeria';
  static const int port = 35955;
}