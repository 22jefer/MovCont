import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:movvcont/Pages/book_store_page.dart';
import 'package:movvcont/Pages/favorite_page.dart';
import 'package:movvcont/Pages/login_page.dart';
import 'package:movvcont/Pages/my_books_page.dart';
import 'package:movvcont/Pages/search_book_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var currentPage = 0;
  late List<Widget> Pages;

  @override
  void initState(){
    _loadPage();
    super.initState();
  }

  void _loadPage(){

    Pages = [];
    Pages.add(MyBooksPage());
    Pages.add(SearchBookPage());
    Pages.add(FavoritePage());
    Pages.add(BookStorePage());

  }

  void _onItemTapped(int Page){
    setState(() {
      currentPage = Page;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Libreria"),
        titleTextStyle: TextStyle(decorationColor: Colors.white, fontSize: 20, fontStyle: FontStyle.italic),
        backgroundColor: Colors.teal,

        actions: [
          PopupMenuButton(
            onSelected: (Menu item){
              setState(() {
                if (item == Menu.logOut){
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacement(context, MaterialPageRoute(builder :(context) => const LoginPage()));
                }
              });
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<Menu>>[
              const PopupMenuItem(
                value: Menu.logOut,


                child: Text("Cerrar Sesión"),
                textStyle: TextStyle(fontSize: 15, fontStyle: FontStyle.italic, color: Colors.black, ),
              ),
            ],
          ),
        ],
      ),
      body: IndexedStack(
        index: currentPage,
        children: Pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentPage,
        type: BottomNavigationBarType.fixed, // compatibilidad para ocupar 4 botones de desplazamiento en el homePage
        onTap: (Page){
          _onItemTapped(Page);
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.book, size: 20),
            label: "Libreria"
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.searchengin, size: 20,),
            label: "Buscar"
          ),
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.heart, size: 20),
            label: "Favoritos"
          ),
          BottomNavigationBarItem(
              icon: Icon(FontAwesomeIcons.store, size: 20),
              label: "Tienda"
          ),
        ],
      ),
    );
  }
}
