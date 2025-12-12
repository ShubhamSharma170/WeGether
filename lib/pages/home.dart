import 'package:chat_app/components/search_bar.dart';
import 'package:chat_app/firebase_functions/firebase_helper.dart';
import 'package:chat_app/firebase_functions/search_user.dart';
import 'package:chat_app/model/user_model.dart';
import 'package:chat_app/pages/search_user_page/search_user.dart';
import 'package:chat_app/routes/routes_name.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatData {
  final String name;
  final String lastMessage;
  final String time;
  final int unreadCount;

  ChatData(this.name, this.lastMessage, this.time, this.unreadCount);
}

final List<ChatData> dummyChats = [
  ChatData('Alice', 'Hey, are you free today?', '10:30 AM', 2),
  ChatData('Bob', 'Meeting at 2 PM. Don\'t forget!', 'Yesterday', 0),
  ChatData('Charlie', 'Sounds good! On you way?', 'Fri AM', 1),
];

final List<String> catName = [
  "Chat",
  "Group",
  "Status",
  "Calls",
  "Favorite",
  "Unread",
];

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  UserModel? userModel;
  @override
  initState() {
    fetchUserData();
    super.initState();
  }

  void fetchUserData() async {
    User? user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      userModel = await FirebaseHelper.getUserDetails(user.uid);
      // Fetch user data from Firestore using user.uid
      // and update the userModel variable
    }
  }

  @override
  Widget build(BuildContext context) {
    ColorScheme color = Theme.of(context).colorScheme;
    TextEditingController controller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('WeGether'),
        actions: [
          // Settings Button (Already tha)
          IconButton(
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => SettingPage()),
              // );
              Navigator.pushNamed(context, RouteName.setting);
            },
            icon: const Icon(Icons.settings),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.tertiary),
            ),
          ),

          IconButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            icon: const Icon(Icons.logout),
            style: ButtonStyle(
              backgroundColor: WidgetStatePropertyAll(color.tertiary),
            ),
          ),
        ],
      ),

      // BODY: Search Bar aur Chat List
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(8.0),
            child: CustomSearchBar(controller: controller),
          ),

          // horizontal scroll widget
          SizedBox(
            height: 60,
            width: MediaQuery.of(context).size.width,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: catName.length,
              itemBuilder: (context, index) {
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: color.tertiary,
                  ),
                  margin: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
                  // width: 100,
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 8,
                        horizontal: 12,
                      ),
                      child: Text(
                        catName[index],
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),

          // 2. Chat List (ListView.builder)
          Expanded(
            child: ListView.builder(
              itemCount: dummyChats.length,
              itemBuilder: (context, index) {
                final chat = dummyChats[index];
                return ListTile(
                  // Profile Picture
                  leading: CircleAvatar(
                    backgroundColor: color.primary,
                    child: Text(chat.name[0]), // First letter of name
                  ),

                  // User/Group Name
                  title: Text(
                    chat.name,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),

                  // Last Message Preview
                  subtitle: Text(
                    chat.lastMessage,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  // Time and Unread Count
                  trailing: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        chat.time,
                        style: TextStyle(
                          fontSize: 12,
                          color: chat.unreadCount > 0
                              ? color.primary
                              : Colors.grey,
                        ),
                      ),

                      if (chat.unreadCount > 0)
                        Container(
                          margin: const EdgeInsets.only(top: 4),
                          padding: const EdgeInsets.all(6),
                          decoration: BoxDecoration(
                            color: color.primary,
                            shape: BoxShape.circle,
                          ),
                          child: Text(
                            chat.unreadCount.toString(),
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                    ],
                  ),

                  onTap: () {},
                );
              },
            ),
          ),
        ],
      ),

      // 3. Floating Action Button
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // SearchUserFunction.searchUser("");
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(builder: (context) => SearchUser()),
          // );
          
        },
        backgroundColor: color.primary,
        child: const Icon(Icons.message, color: Colors.white),
      ),
    );
  }
}
