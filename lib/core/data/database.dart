
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
abstract class DatabaseProvider {
   Future<void> initDatabase();
  Database getDatabaseInstance();
}
class DatabaseProviderImpl implements DatabaseProvider {
    late Database _database;

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('create table files(path text primary key)');
  }
  
  @override
  Database getDatabaseInstance() {
    
    return _database;
  }
  
  @override
  Future<void> initDatabase() async{
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'app.db');
    _database = await openDatabase(
      path,
      version: 1,
      onCreate:_onCreate,
    );

  }
  
}