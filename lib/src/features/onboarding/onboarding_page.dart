import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  bool isLoading = false;
  bool isAgreed = false;
  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Welcome'),
        ),
        body: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            const Text(
              'AI 北斎',
              style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            ElevatedButton(
              onPressed: isAgreed
                  ? () async {
                      setState(() {
                        isLoading = true;
                      });
                      await FirebaseAuth.instance.signInAnonymously();
                      setState(() {
                        isLoading = false;
                      });
                    }
                  : null,
              child: const Text('はじめる'),
            ),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              width: 300,
              child: CheckboxListTile(
                title: const Text('利用規約に同意する'),
                value: isAgreed,
                onChanged: (value) {
                  setState(() {
                    isAgreed = value!;
                  });
                },
              ),
            )
          ]),
        ),
      ),
    );
  }
}
