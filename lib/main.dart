// ignore_for_file: prefer_const_constructors

import 'package:expense_tracker/Model/Model/DataModel.dart';
import 'package:expense_tracker/Model/firebase_options.dart';
import 'package:expense_tracker/Model/Functions.dart';
import 'package:expense_tracker/View/LoginPages/Splash.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';

import 'package:provider/provider.dart';


// import 'Model/DataModel.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(DataModelAdapter().typeId)) {
    Hive.registerAdapter(DataModelAdapter());
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => Calc(),
        )
      ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home:

              // FirstPage(),
              Splash()),
    );
  }
}
