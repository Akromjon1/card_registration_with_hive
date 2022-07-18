import 'package:card_registration_with_hive/pages/card_page.dart';
import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'pages/home_page.dart';
import 'service/hive_service.dart';

void main(){
  WidgetsFlutterBinding.ensureInitialized();
  // await Hive.initFlutter();
  // await Hive.openBox(HiveService.dbName);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.cyan,
      ),
      home: HomePage(),
      routes: {
        HomePage.id:(context)=> HomePage(),
        CardPage.id:(context)=> CardPage(),
      },
    );
  }
}
