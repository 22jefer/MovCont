import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
/*

import 'package:movecont/Pages/search_book_page.dart';
import 'package:movecont/Pages/splash_page.dart';

 */
import 'package:firebase_core/firebase_core.dart';
import 'package:movvcont/Pages/login_page.dart';
import 'package:movvcont/Pages/search_book_page.dart';
import 'package:movvcont/firebase_options.dart';
import 'firebase_options.dart';

  Future<void> main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'M',
      localizationsDelegates: const [
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
      ],
      supportedLocales: const[
        Locale("en","US"),
        Locale("es", "CO")
      ],
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const LoginPage(),
    );
  }
}
