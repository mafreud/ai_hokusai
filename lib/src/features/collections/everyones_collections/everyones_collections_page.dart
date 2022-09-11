import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/firestore.dart';

class EveryonesCollectionsPage extends ConsumerWidget {
  const EveryonesCollectionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(title: const Text('みんなの作品')),
      body: FirestoreQueryBuilder<dynamic>(
        query: FirebaseFirestore.instance
            .collection('collections')
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
              final currentUserId = FirebaseAuth.instance.currentUser!.uid;

              final docs = snapshot.docs[index];
              final data = docs.data();
              final docId = docs.id;
              final isBlockedBy = data['isBlockedBy'] as List<dynamic>;

              return Visibility(
                visible: !isBlockedBy.contains(currentUserId),
                child: GestureDetector(
                  onTap: () async {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('ブロック・通報'),
                        content: const Text('投稿をブロック or 通報しますか'),
                        actions: [
                          TextButton(
                            onPressed: () async {
                              await FirebaseFirestore.instance
                                  .collection('collections')
                                  .doc(docId)
                                  .update(
                                {
                                  'isBlockedBy': FieldValue.arrayUnion(
                                      [FirebaseAuth.instance.currentUser!.uid])
                                },
                              );
                              // TODO(mafreud): 通報ロジックを追加
                              // ignore: use_build_context_synchronously
                              Navigator.pop(context);
                            },
                            child: const Text('ブロック'),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('通報'),
                          ),
                        ],
                      ),
                    );
                  },
                  child: Card(
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
