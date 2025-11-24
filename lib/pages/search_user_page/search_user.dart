import 'package:chat_app/components/search_bar.dart';
import 'package:flutter/material.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search User")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Column(
          children: [
            CustomSearchBar(),
            SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Search")),
          ],
        ),
      ),
    );
  }
}
