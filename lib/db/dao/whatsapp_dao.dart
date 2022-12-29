import 'package:floor/floor.dart';
import 'package:floor_database_demo_sqlite/models/whatsapp_model.dart';

@dao
abstract class WhatsAppDao {
  @insert
  Future<void> insertWhatsApp(WhatsApp whatsApp);

  @Query('SELECT * FROM WhatsApp')
  Future<List<WhatsApp>> selectAllWhatsAppData();

  @Query('DELETE FROM WhatsApp where id=:id')
  Future<void> deleteWhatsAppById(int id);

  @update
  Future<void> updateWhatsApp(WhatsApp whatsApp);
}
