import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';


class BookStorePage extends StatefulWidget {
  const BookStorePage({Key? key}) : super(key: key);

  @override
  State<BookStorePage> createState() => _BookStorePageState();
}

class _BookStorePageState extends State<BookStorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
          child: StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance
                .collection('stores')
                .snapshots(),
            builder: (context, snapshot) {
              if (!snapshot.hasData) return const Text('Loading');
              return ListView.builder(
                itemCount: snapshot.data?.docs.length,
                itemBuilder: (context, index) {
                  QueryDocumentSnapshot store = snapshot.data!.docs[index];
                  return Card(
                      child: ListTile(
                        leading: Image.network(
                          store['urlPicture']??"",
                          errorBuilder: (BuildContext context, Object exception, StackTrace? stackTrace) {
                            return const Image(image: AssetImage("assets/images/Libros.jpg"));
                          }
                        ),
                        title: Text(store['name']),
                        subtitle: Text(store['address']),
                      ));
                },
              );
            },
          )),
    );
  }
}
