import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            ElevatedButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
              },
              child: const Text('ログアウト'),
            ),
            ElevatedButton(
              onPressed: () async {
                setState(() {
                  isLoading = true;
                });
                final qs = await FirebaseFirestore.instance
                    .collection('collections')
                    .where('userId',
                        isEqualTo: FirebaseAuth.instance.currentUser!.uid)
                    .get();

                for (final doc in qs.docs) {
                  await FirebaseFirestore.instance
                      .collection('collections')
                      .doc(doc.id)
                      .delete();
                }
                await FirebaseAuth.instance.currentUser!.delete();
                setState(() {
                  isLoading = false;
                });
              },
              child: const Text('アカウント削除'),
            ),
          ]),
        ),
      ),
    );
  }
}
