import 'package:flutter/material.dart';
import 'package:movvcont/Pages/home_page.dart';
import 'package:movvcont/Pages/login_page.dart';
//import 'package:movecont/Pages/login_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState(){
    _closedSplash();
    super.initState();
  }

  Future<void> _closedSplash() async {
    var future = Future.delayed(const Duration(seconds: 1), () async {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));
    });
  }




  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Image(image: AssetImage("assets/images/movie-frame.png")),

      ),
    );
  }
}