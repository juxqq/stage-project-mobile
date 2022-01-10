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
  static const String host = '109.234.160.80';
  static const String user = 'jqtp0357_stage_2022_01x02_epsi';
  static const String password = 'stage_2022_01x02_epsi';
  static const String db = 'jqtp0357_stage_2022_01x02_epsi';
  static const int port = 25;
}