import 'package:ai_hokusai/src/features/collections/everyones_collections/everyones_collections_page.dart';
import 'package:ai_hokusai/src/features/collections/my_collections/my_collections_page.dart';
import 'package:ai_hokusai/src/features/generate_image/generate_image_page.dart';
import 'package:ai_hokusai/src/features/settings/settings_page.dart';
import 'package:flutter/material.dart';

class NavigationBarPage extends StatefulWidget {
  const NavigationBarPage({super.key});

  @override
  State<NavigationBarPage> createState() => _NavigationBarPageState();
}

class _NavigationBarPageState extends State<NavigationBarPage> {
  int currentPageIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        onDestinationSelected: (int index) {
          setState(() {
            currentPageIndex = index;
          });
        },
        selectedIndex: currentPageIndex,
        destinations: const <Widget>[
          NavigationDestination(
            icon: Icon(Icons.draw),
            label: '絵を描く',
          ),
          NavigationDestination(
            icon: Icon(Icons.person),
            label: '自分の作品',
          ),
          NavigationDestination(
            icon: Icon(Icons.people),
            label: 'みんなの作品',
          ),
          NavigationDestination(
            icon: Icon(Icons.settings),
            label: '設定',
          ),
        ],
      ),
      body: <Widget>[
        const GenerateImagePage(),
        const MyCollectionsPage(),
        const EveryonesCollectionsPage(),
        const SettingsPage()
      ][currentPageIndex],
    );
  }
}
