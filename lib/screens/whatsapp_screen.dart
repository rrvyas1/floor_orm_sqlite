import 'package:floor_database_demo_sqlite/db/local_database.dart';
import 'package:floor_database_demo_sqlite/models/whatsapp_model.dart';
import 'package:floor_database_demo_sqlite/provider/whatsapp_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WhatsAppUi extends StatefulWidget {
  const WhatsAppUi({super.key});

  @override
  State<WhatsAppUi> createState() => _WhatsAppUiState();
}

class _WhatsAppUiState extends State<WhatsAppUi> {
  TextEditingController txtContactNameController = TextEditingController();
  TextEditingController txtMessageController = TextEditingController();

  @override
  void initState() {
    Provider.of<WhatsAppProvider>(context, listen: false).fetchAllPlan();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Floor Demo'),
      ),
      body: Consumer<WhatsAppProvider>(
        builder: (context, obj, child) => obj.whatsAppData.isEmpty
            ? const Center(
                child: Text('There Is No Data'),
              )
            : ListView.builder(
                itemCount: obj.whatsAppData.length,
                itemBuilder: (context, index) => ListTile(
                      title: Text(obj.whatsAppData[index].contactName),
                      subtitle: Text(obj.whatsAppData[index].message),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          GestureDetector(
                              onTap: () {
                                txtContactNameController.text =
                                    obj.whatsAppData[index].contactName;
                                    txtMessageController.text =
                                    obj.whatsAppData[index].message;
                                showDialog(
                                  context: context,
                                  builder: (context) => SimpleDialog(
                                    title: const Text('Edit Data'),
                                    contentPadding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    children: [
                                      TextField(
                                        controller: txtContactNameController,
                                      ),
                                      TextField(
                                        controller: txtMessageController,
                                      ),
                                      MaterialButton(
                                        onPressed: () {
                                          Provider.of<WhatsAppProvider>(context,
                                                  listen: false)
                                              .updateRecord(
                                            recordId:
                                                obj.whatsAppData[index].id!,
                                            contactName:
                                                txtContactNameController.text,
                                            message: txtMessageController.text,
                                          );
                                          txtContactNameController.clear();
                                          txtMessageController.clear();
                                          Navigator.pop(context);
                                          print('Data Updated');
                                        },
                                        child: const Text('Update'),
                                      ),
                                    ],
                                  ),
                                );
                              },
                              child: const Icon(Icons.edit)),
                          const SizedBox(
                            width: 20,
                          ),
                          GestureDetector(
                              onTap: () async {
                                Provider.of<WhatsAppProvider>(context,
                                        listen: false)
                                    .removedRecordById(
                                        obj.whatsAppData[index].id!, index);
                              },
                              child: const Icon(Icons.delete)),
                        ],
                      ),
                    )),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (context) => SimpleDialog(
              title: const Text('Add Data'),
              contentPadding:
                  const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              children: [
                TextField(
                  controller: txtContactNameController,
                ),
                TextField(
                  controller: txtMessageController,
                ),
                MaterialButton(
                  onPressed: () {
                    Provider.of<WhatsAppProvider>(context, listen: false)
                        .insertRecord(
                      contactName: txtContactNameController.text,
                      message: txtMessageController.text,
                    );
                    txtContactNameController.clear();
                    txtMessageController.clear();
                    Navigator.pop(context);
                    print('Data Added');
                  },
                  child: const Text('Save'),
                ),
              ],
            ),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
