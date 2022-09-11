import 'dart:convert';

import 'package:ai_hokusai/src/features/generate_image/generate_image_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:uuid/uuid.dart';

import 'generate_image_api/generate_image_api_client.dart';

class GenerateImagePage extends HookConsumerWidget {
  const GenerateImagePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final repo = ref.watch(generateImageApiClientProvider);
    final controller = ref.watch(generateImageControllerProvider.notifier);
    final state = ref.watch(generateImageControllerProvider);
    final textController = useTextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('画像を生成'),
      ),
      body: ModalProgressHUD(
        inAsyncCall: state.isLoading,
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Visibility(
              visible: state.image != '',
              child: Image.memory(
                base64Decode(state.image),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: textController,
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                controller.switchLoadingState();
                final result = await repo.generateImage(
                  {
                    "prompts": textController.text,
                    "scale": 7.5,
                  },
                );

                final image = result['image'] as String;
                final newImage = image.substring(22);
                controller.setImage(newImage);
                const uuid = Uuid();
                final docId = uuid.v4();

                await FirebaseFirestore.instance
                    .collection('collections')
                    .doc(docId)
                    .set({
                  'id': docId,
                  'userId': FirebaseAuth.instance.currentUser!.uid,
                  'image': newImage,
                  'inputString': textController.text,
                  'createdAt': DateTime.now(),
                  'isBlockedBy': []
                });
                controller.switchLoadingState();
              },
              child: const Text('画像を生成'),
            ),
          ]),
        ),
      ),
    );
  }
}
