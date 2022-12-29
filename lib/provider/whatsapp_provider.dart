import 'package:floor_database_demo_sqlite/db/local_database.dart';
import 'package:floor_database_demo_sqlite/models/whatsapp_model.dart';
import 'package:flutter/material.dart';

class WhatsAppProvider extends ChangeNotifier {
  List<WhatsApp> whatsAppData = [];

  void fetchAllPlan() async {
    whatsAppData =
        await (await LocalDatabase.whatsAppDAO).selectAllWhatsAppData();
    changeState;
  }

  void removedRecordById(int recordId, int index) async {
    await LocalDatabase.whatsAppDAO
        .then((dao) => dao.deleteWhatsAppById(whatsAppData[index].id!));
    whatsAppData.removeAt(index);

    changeState;
  }

  void insertRecord({required String contactName,required String message})async {
    LocalDatabase.whatsAppDAO.then(
          (dao) => dao.insertWhatsApp(
        WhatsApp(
            contactName: contactName,
            message: message),
      ),
    );
    whatsAppData = await LocalDatabase.whatsAppDAO
        .then((dao) => dao.selectAllWhatsAppData());
    changeState;
  }

  void updateRecord({required int recordId,required String contactName,required String message})async {
    (await LocalDatabase.whatsAppDAO).updateWhatsApp(
      WhatsApp(
          id: recordId,
          contactName: contactName,
          message: message),
    );
    whatsAppData= await (await LocalDatabase.whatsAppDAO)
        .selectAllWhatsAppData();
    changeState;
  }

  void get changeState => notifyListeners();
}
