import 'package:flutter/material.dart';
import 'package:movvcont/models/local_book.dart';
import 'package:movvcont/models/result.dart';
import 'package:movvcont/repository/boxes.dart';

class DetailSearchBookPage extends StatefulWidget {

  final Items book;
  const DetailSearchBookPage(this.book, {super.key} );

  @override
  State<DetailSearchBookPage> createState() => _DetailSearchBookPageState();
}

class _DetailSearchBookPageState extends State<DetailSearchBookPage>{

  var isFavorite = false;

  @override
  void initState(){
    _getLocalBook();
    super.initState();
  }

  void _getLocalBook(){
    final box = Boxes.getFavoritesBox();
    box.values.forEach((element) {
      if(element.id == widget.book.id){
        isFavorite = true;
      }
    });
  }

  void _onFavoritesButtonClicked() async {

    var localBook = LocalBook()
    ..id = widget.book.id
    ..name = widget.book.volumeInfo?.title
    ..author = widget.book.volumeInfo?.authors?[0]
    ..publishedData = widget.book.volumeInfo?.publishedDate
    ..description = widget.book.volumeInfo?.description
    ..imageLink = widget.book.volumeInfo?.imageLinks?.smallThumbnail;

    final box = Boxes.getFavoritesBox();
    //box.add(localBook);

    if (isFavorite){
      box.delete(localBook.id);
    } else {
      box.put(localBook.id, localBook);
    }

    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.book.volumeInfo?.title ?? "Detalles"),

      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.network(
                  widget.book.volumeInfo?.imageLinks?.smallThumbnail ??"",
                  errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                    return const Image(image: AssetImage("assets/images/Libros.jpg"));
                  }
              ),

              Row(
                children: [
                  Expanded(
                    child: IconButton(
                      alignment: Alignment.topRight,
                      icon: Icon(isFavorite? Icons.favorite : Icons.favorite_border),
                      color: Colors.red,
                      onPressed: ((){
                        _onFavoritesButtonClicked();
                      }),
                    ),
                  ),
                ],
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Autor: ${widget.book.volumeInfo?.authors?[0]}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17, fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  "Publicacion: ${widget.book.volumeInfo?.publishedDate}",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17, fontStyle: FontStyle.italic,
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.all(8),
                child: Text(
                  widget.book.volumeInfo?.description ?? "no hay Descripcion del libro",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 17, fontStyle: FontStyle.italic,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
