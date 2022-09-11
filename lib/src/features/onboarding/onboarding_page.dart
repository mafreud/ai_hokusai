import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:url_launcher/url_launcher.dart';

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
                title: GestureDetector(
                  onTap: () {
                    _launchUrl();
                  },
                  child: const Text(
                    '利用規約に同意する',
                    style: TextStyle(color: Colors.blue),
                  ),
                ),
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

  Future<void> _launchUrl() async {
    const url = 'https://www.notion.so/e20a6130ea104fff82a86937e4f4528d';
    if (!await launchUrl(Uri.parse(url))) {
      throw 'Could not launch ${Uri.parse(url)}}';
    }
  }
}
