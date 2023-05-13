import 'package:flutter/material.dart';
//import 'package:movecont/Pages/login_page.dart';
//import 'package:movecont/models/user.dart';
import 'package:movvcont/Pages/login_page.dart';
import 'package:movvcont/models/user.dart';
import 'dart:convert';
import "package:shared_preferences/shared_preferences.dart";

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}
enum Gene{masculino,femenino}

class _RegisterPageState extends State<RegisterPage> {

  final _name = TextEditingController();
  final _gmail = TextEditingController();
  final _password = TextEditingController();
  final _rePassword = TextEditingController();


  Gene? _gene = Gene.masculino;


  // ScackBar( Notificacion de Contraseña incorrecta, incluye la linea 49 ( _showMensaje("La contraseña no coincide"); ) )
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

  void saveUser(User user) async{
    SharedPreferences sharedPre = await SharedPreferences.getInstance();
    sharedPre.setString("user", jsonEncode(user));
  }



  void buttonInfo(){
    setState(() {
      if(_password.text == _rePassword.text){
        String tipoGene = "Masculino";

        if(_gene==Gene.femenino){
          tipoGene = "femenino";
        }

        var user = User(_name.text, _gmail.text, _password.text);

        saveUser(user);
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const LoginPage()));

      }else{
        _showMensaje("La contraseña no coincide");
      }







      //validar Informacion ingresada ( Incluye:               //Text(
                                                                  //_info,//inicializar variable
                                                                  //style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
                                                              // ),

      //_info = "nombre: ${_name.text} \nGmail: ${_gmail.text} \n Genero: ${tipoGene}";

    });
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(

      body: Padding(

        padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
        child: SingleChildScrollView(

          child: Column(

            mainAxisAlignment: MainAxisAlignment.center,

            children: <Widget>[

              //const Image(image: AssetImage("assets/images/movie-frame.png")),

              const SizedBox(
                height: 40,
              ),

              TextFormField(
                controller: _name,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                  labelText: "Nombre: ",
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _gmail,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    labelText: "Gmail"
                ),
                keyboardType: TextInputType.emailAddress,
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _password,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    labelText: "Contraseña"
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(
                height: 10,
              ),

              TextFormField(
                controller: _rePassword,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic),
                    labelText: "Vuela a ingresar su contraseña"
                ),
                keyboardType: TextInputType.text,
              ),

              const SizedBox(
                height: 15,
              ),

              ElevatedButton(
                  style: TextButton.styleFrom(
                      textStyle: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic)
                  ),
                  onPressed: (){
                    buttonInfo();
                  },
                  child: const  Text("Crear Cuenta")
              ),

              const SizedBox(
                height: 15,
              ),

              Row(
                  children: [

                    Expanded(
                      child:
                      ListTile(
                        title: const Text("M"),
                        leading: Radio<Gene>(
                          value: Gene.masculino,
                          groupValue: _gene,
                          onChanged: (Gene? value){
                            setState(() {
                              _gene = value;
                            });
                          },
                        ),
                      ),
                    ),

                    Expanded(
                      child:
                      ListTile(
                        title: const Text("F"),
                        leading: Radio<Gene>(

                          value: Gene.femenino,
                          groupValue: _gene,
                          onChanged: (Gene? value){
                            setState(() {
                              _gene = value;
                            });
                          },
                        ),
                      ),
                    ),
                  ]),

              //Text(
                //_info,
                //style: const TextStyle(fontSize: 12, fontStyle: FontStyle.italic),
              //),
            ],
          ),
        ),
      ),
    );
  }
}