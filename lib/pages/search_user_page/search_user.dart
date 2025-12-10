import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/provider/search_user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUser extends StatefulWidget {
  const SearchUser({super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Search User")),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
        child: Consumer<SearchUserProvider>(
          builder: (ctx, provider, child) {
            return Column(
              children: [
                CustomSearchBar(controller: controller, onChanged: (_) {}),
                SizedBox(height: 20),
                // StreamBuilder(
                //   stream: FirebaseFirestore.instance
                //       .collection("users")
                //       .snapshots(),
                //   builder: builder,
                // ),
              ],
            );
          },
        ),
      ),
    );
  }
}
