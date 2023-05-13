import 'package:movvcont/models/result.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
class BooksApi{

  Future<Result> getBooks(String parameter) async{

    final response = await http.get(Uri.parse("https://www.googleapis.com/books/v1/volumes?q=$parameter"));
    if (response.statusCode == 200){
      return Result.fromJson(jsonDecode(response.body));
    } else {
      throw Exception("Error al tomar datos");
    }
  }
}