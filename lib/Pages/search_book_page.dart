import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:movvcont/models/result.dart';
import 'package:movvcont/repository/books_api.dart';

class SearchBookPage extends StatefulWidget {
  const SearchBookPage({Key? key}) : super(key: key);

  @override
  State<SearchBookPage> createState() => _SearchBookPageState();
}

class _SearchBookPageState extends State<SearchBookPage> {

  final _parametro = TextEditingController();

  final BooksApi _booksApi = BooksApi();

  List<Items> listBooks = <Items>[];

  Future _searchBook() async{
    Result resultFuture = await _booksApi.getBooks(_parametro.text);
    setState(() {
      resultFuture.items?.forEach(
        (element) {
          listBooks.add(element);
        }
      );
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscador de Google"),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Center(
          child: Column (children: [

            TextFormField(

            controller: _parametro,
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: "Buscar libro, autor o genero",
            ),
            keyboardType: TextInputType.text,
            ),

            const SizedBox(
              height: 5,
            ),

            ElevatedButton(

              style: TextButton.styleFrom(
                textStyle: const TextStyle(fontSize: 20)
              ),
                onPressed: (){

                _searchBook();

                },
                child: const Text("Buscar")

            ),
            Expanded(

              child: ListView.builder(
                itemCount: listBooks.length,
                itemBuilder: (BuildContext context, int index){

                  Items book = listBooks[index];
                  return Card(
                    child: ListTile(
                      leading: Image.network(
                        book.volumeInfo?.imageLinks?.smallThumbnail ??"",
                        errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                          return const Image(image: AssetImage("assets/images/Libros.jpg"));
                        }
                      ),
                      title: Text(book.volumeInfo?.title ?? "no title"),
                      subtitle: Text(book.volumeInfo?.publishedDate ?? "No publishedDate"),
                    ),
                  );
                }
              )
            )
          ]),
        ),
      ),
    );
  }
}
