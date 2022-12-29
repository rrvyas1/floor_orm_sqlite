import 'package:floor/floor.dart';

@entity
class WhatsApp {
  @PrimaryKey(autoGenerate: true)
  int? id;

  String contactName, message;

  WhatsApp({
    this.id,
    required this.contactName,
    required this.message,
  });
}
