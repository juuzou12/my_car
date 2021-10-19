import 'package:bnbs_project/pages/walkthrough_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  initializeDefault();
  runApp(const MyApp());
}

Future<void> initializeDefault() async {
  WidgetsFlutterBinding.ensureInitialized();
  FirebaseApp app = await Firebase.initializeApp();
  assert(app != null);
  print('Initialized default app $app');
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'BnBs',

      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
      initialRoute: "/",
      getPages: [
        GetPage(name: "/", page: ()=> walkthrough_page()),
      ],
    );
  }
}

