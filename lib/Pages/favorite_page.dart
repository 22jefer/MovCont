import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:movvcont/Pages/detail_search_book_page.dart';
import 'package:movvcont/models/local_book.dart';
import 'package:movvcont/models/result.dart';
import 'package:movvcont/repository/boxes.dart';

class FavoritePage extends StatefulWidget {
  const FavoritePage({Key? key}) : super(key: key);

  @override
  State<FavoritePage> createState() => _FavoritePageState();
}

class _FavoritePageState extends State<FavoritePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: _buildListView(),
        ),
      ),
    );
  }

  Widget _buildListView(){
    return ValueListenableBuilder<Box<LocalBook>>(
        valueListenable: Boxes.getFavoritesBox().listenable(),
        builder: (context, box, _){
          final bookBox = box.values.toList().cast<LocalBook>();
          return ListView.builder(

              itemCount: bookBox.length,
              itemBuilder: (BuildContext context, int index){

              final book = bookBox[index];
              return Card(
                child: ListTile(
                  leading: Image.network(
                      book.imageLink??"",
                      errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                        return const Image(image: AssetImage("assets/images/Libros.jpg"));
                      }
                  ),
                  title: Text(book.name ?? "no title"),
                  subtitle: Text(book.publishedData ?? "No publishedDate"),
                  onLongPress: (){
                    setState(() {
                      book.delete();
                    });
                  }
                ),
              );
            }
          );
        }
    );
  }
}
