import 'dart:async';

import 'package:floor/floor.dart';
import 'package:floor_database_demo_sqlite/db/dao/party_dao.dart';
import 'package:floor_database_demo_sqlite/db/dao/project_dao.dart';
import 'package:floor_database_demo_sqlite/db/dao/whatsapp_dao.dart';
import 'package:floor_database_demo_sqlite/models/party_model.dart';
import 'package:floor_database_demo_sqlite/models/project_model.dart';
import 'package:floor_database_demo_sqlite/models/whatsapp_model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
part 'services.g.dart';

@Database(version: 1, entities: [PartyMaster, ProjectMaster, WhatsApp])
abstract class AppDatabase extends FloorDatabase {
  static const String dbName='local_db.db';
  PartyDao get partyDao;
  ProjectDao get projectDao;
  WhatsAppDao get whatsAppDao;
}
