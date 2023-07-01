import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sportapp/page/Homescreen.dart';
import 'package:sportapp/page/match_page.dart';

void main() {
  runApp(const ProviderScope(child: MainApp()));
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false, home: const HomeScreen(),
        routes: { 
          MatchPage.routeName: (context) => MatchPage()
        },
        );
  }
}
