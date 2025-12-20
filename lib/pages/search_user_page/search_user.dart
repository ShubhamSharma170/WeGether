import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/provider/search_user_provider.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchUser extends StatefulWidget {
  final UserModel? searchedUser;
  final User? firebaseAuth;
  const SearchUser({this.searchedUser, this.firebaseAuth, super.key});

  @override
  State<SearchUser> createState() => _SearchUserState();
}

class _SearchUserState extends State<SearchUser> {
  TextEditingController emailController = TextEditingController();
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
                CustomSearchBar(controller: emailController),
                SizedBox(height: 20),
                MyButton(
                  buttonName: "Search",
                  onTap: () {
                    // setState(() {});
                    provider.setSearchEmail(emailController.text);
                  },
                ),
                SizedBox(height: 20),
                StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("users")
                      .where("gmail", isEqualTo: emailController.text)
                      .where("gmail", isNotEqualTo: widget.searchedUser!.gmail)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.active) {
                      if (snapshot.hasData) {
                        QuerySnapshot querySnapshot =
                            snapshot.data as QuerySnapshot;
                        if (querySnapshot.docs.isNotEmpty) {
                          Map<String, dynamic> mapSnapshot =
                              querySnapshot.docs[0].data()
                                  as Map<String, dynamic>;

                          UserModel searchedUser = UserModel.fromMap(
                            mapSnapshot,
                          );

                          return ListTile(
                            title: Text(
                              searchedUser.displayName!.isEmpty
                                  ? "No Name"
                                  : searchedUser.displayName!,
                            ),
                            titleTextStyle: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w500,
                              color: Colors.black,
                            ),
                            subtitle: Text(searchedUser.gmail ?? "No Email"),
                            subtitleTextStyle: TextStyle(
                              fontSize: 18,
                              color: Colors.black,
                              fontWeight: FontWeight.w500,
                            ),
                            trailing: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.arrow_forward_ios_rounded),
                            ),
                          );
                        } else {
                          return Text("No User Found!");
                        }
                      } else if (snapshot.hasError) {
                        return Text("Error is Occured ");
                      } else {
                        return Text("No Data Found");
                      }
                    } else {
                      return CircularProgressIndicator();
                    }
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
