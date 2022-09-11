import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class MyCollectionsPage extends ConsumerWidget {
  const MyCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('自分の作品')),
      body: FirestoreQueryBuilder<dynamic>(
        query: FirebaseFirestore.instance
            .collection('collections')
            .where('userId', isEqualTo: FirebaseAuth.instance.currentUser!.uid)
            .orderBy('createdAt', descending: true),
        builder: (context, snapshot, _) {
          if (snapshot.isFetching) {
            return const CircularProgressIndicator.adaptive();
          }
          if (snapshot.hasError) {
            debugPrint(snapshot.error.toString());
            return Text('error ${snapshot.error}');
          }

          return GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
            ),
            itemCount: snapshot.docs.length,
            itemBuilder: (context, index) {
              if (snapshot.hasMore && index + 1 == snapshot.docs.length) {
                snapshot.fetchMore();
              }

              final docs = snapshot.docs[index];
              final data = docs.data();
              return Card(
                child: SizedBox(
                  width: 300,
                  height: 200,
                  child: Center(
                    child: Column(
                      children: [
                        Image.memory(
                          base64Decode(data['image']),
                          height: 170,
                        ),
                        Text(data['inputString'])
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
