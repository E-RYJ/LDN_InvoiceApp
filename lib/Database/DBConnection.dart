import 'package:mysql1/mysql1.dart';

class DBConnection{
  static String host='localhost',
      user='root',
  //password='',
      db='prototipo';
  static int puerto=3308;

  DBConnection();

  static Future<MySqlConnection> getConnection() async{
    var settings = ConnectionSettings(
        host: host,
        port: puerto,
        user: user,
        //password: password,
        db: db
    );
    return await MySqlConnection.connect(settings);
  }
}