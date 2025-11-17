import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/pages/setting.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        // backgroundColor: color.secondary,
        actions: [
          IconButton(
            iconSize: 20,

            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: Icon(Icons.logout),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.tertiary),
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return SettingPage();
                  },
                ),
              );
            },
            icon: Icon(Icons.settings),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.tertiary),
            ),
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(children: [CustomSearchBar()]),
        ),
      ),
    );
  }
}
