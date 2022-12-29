import 'package:floor_database_demo_sqlite/db/dao/whatsapp_dao.dart';
import 'package:floor_database_demo_sqlite/db/services/services.dart';

abstract class LocalDatabase {
  static Future<AppDatabase> get _db async =>
      await $FloorAppDatabase.databaseBuilder(AppDatabase.dbName).build();

  static Future<WhatsAppDao> get whatsAppDAO async =>(await _db).whatsAppDao;

}
