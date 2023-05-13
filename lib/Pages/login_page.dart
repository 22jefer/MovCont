import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:movecont/Pages/home_page.dart';
//import 'package:movecont/Pages/register_page.dart';
//import 'package:movecont/models/user.dart';
import 'package:movvcont/Pages/home_page.dart';
import 'package:movvcont/Pages/register_page.dart';
import 'package:movvcont/Pages/search_book_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../models/user.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _gmail = TextEditingController();
  final _password = TextEditingController();

  void _showMensaje(String mensaje){
    final scaffold = ScaffoldMessenger.of(context);
    scaffold.showSnackBar(
        SnackBar(content: Text(mensaje),
          action: SnackBarAction(
            label: "Aceptar", onPressed: scaffold.hideCurrentSnackBar,
          ),
        )
    );
  }

  User userLoad = User.Empty();

  _getUser() async {
    SharedPreferences shareP = await SharedPreferences.getInstance();
    Map<String, dynamic> userMap = jsonDecode(shareP.getString("user")!);
    userLoad = User.fromJson(userMap);
  }

  @override
  void initState(){
    super.initState();
    _getUser();
  }

  void _validatedUser(){
    if(_gmail.text == userLoad.gmail && _password.text == userLoad.password){
      Navigator.pushReplacement( context , MaterialPageRoute(builder: (context) => const SearchBookPage()));
    }else{
      _showMensaje("Correo o Contraseña Incorrecta");
    }
  }




  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(

        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),

        child: Column(

          children: <Widget>[


            const SizedBox(
              height: 50,
            ),
            TextFormField(
              controller: _gmail,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                labelText: "Correo Electrónico",
              ),
              keyboardType: TextInputType.emailAddress,
            ),

            const SizedBox(
              height: 10,
            ),

            TextFormField(
              controller: _password,
              style: const TextStyle(fontSize: 20),
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                  labelText: "Contraseña"
              ),
              keyboardType: TextInputType.text,
            ),

            const SizedBox(
              height: 15,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic)
                    ),
                    onPressed: (){

                      _validatedUser();

                    },
                    child: const Text("Iniciar Sesión")
                ),

                const SizedBox(
                  width: 10,
                ),

                ElevatedButton(
                    style: TextButton.styleFrom(
                        textStyle: const TextStyle(fontSize: 13, fontStyle: FontStyle.italic)
                    ),
                    onPressed: (){

                      Navigator.push(
                          context, MaterialPageRoute(
                          builder: (context) => const RegisterPage()));
                    },
                    child: const Text("Registrarse")
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}