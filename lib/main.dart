import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
/*

import 'package:movecont/Pages/search_book_page.dart';
import 'package:movecont/Pages/splash_page.dart';

 */
import 'package:firebase_core/firebase_core.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movvcont/Pages/login_page.dart';
import 'package:movvcont/Pages/search_book_page.dart';
import 'package:movvcont/firebase_options.dart';
import 'package:movvcont/models/local_book.dart';
import 'firebase_options.dart';

  Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  await Hive.initFlutter(); // Relacionar page de favorites y libros buscados
  Hive.registerAdapter(LocalBookAdapter());// Relacionar page de favorites y libros buscados

  await Hive.openBox<LocalBook>('favorites'); // Relacionar page de favorites y libros buscados

  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
