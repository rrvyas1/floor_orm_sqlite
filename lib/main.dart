import 'package:floor_database_demo_sqlite/db/dao/whatsapp_dao.dart';
import 'package:floor_database_demo_sqlite/models/project_model.dart';
import 'package:floor_database_demo_sqlite/db/services/services.dart';
import 'package:floor_database_demo_sqlite/provider/whatsapp_provider.dart';
import 'package:floor_database_demo_sqlite/screens/whatsapp_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WhatsAppProvider(),),
      ],
      child:const MaterialApp(
        home: WhatsAppUi(),
      ),
    );
  }
}

class FirstScreen extends StatefulWidget {
  const FirstScreen({
    super.key,
  });

  @override
  State<FirstScreen> createState() => _FirstScreenState();
}

class _FirstScreenState extends State<FirstScreen> {
  TextEditingController projectNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Floor Demo')),
      body: Column(
        children: [
          TextField(
            controller: projectNameController,
          ),
          TextField(
            controller: addressController,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              MaterialButton(
                onPressed: () {
                  // widget.dao.insertProject(
                  //   ProjectMaster(
                  //     projectName: projectNameController.text,
                  //     address: addressController.text,
                  //   ),
                  // );
                },
                child: const Text('Save'),
              ),
              MaterialButton(
                onPressed: () {
                  // widget.dao.updateProject(
                  //   ProjectMaster(
                  //     projectName: projectNameController.text,
                  //     address: addressController.text,
                  //   ),
                  // );
                },
                child: const Text('Update'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
