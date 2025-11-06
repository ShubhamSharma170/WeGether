import 'package:chat_app/components/edit_profile_items.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/bio.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/display_name.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/email.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/phone.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/photo.dart';
import 'package:chat_app/pages/settings/edit_profile_pages/user_name.dart';
import 'package:flutter/material.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    List<EditProfileItems> profileItems = [
      EditProfileItems(iconData: Icons.photo, itemName: "Profile Picture"),
      EditProfileItems(iconData: Icons.person, itemName: "Display Name"),
      EditProfileItems(iconData: Icons.perm_identity, itemName: "Username"),
      EditProfileItems(iconData: Icons.info, itemName: "Bio"),
      EditProfileItems(iconData: Icons.phone, itemName: "Phone Number"),
      EditProfileItems(iconData: Icons.email, itemName: "Email"),
    ];

    ColorScheme color = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // childAspectRatio: 1.3,
          mainAxisExtent: 150,
        ),
        itemCount: profileItems.length,
        itemBuilder: (context, index) {
          final item = profileItems[index];
          return GestureDetector(
            onTap: () {
              switch (item.itemName) {
                case "Profile Picture":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserPhoto()),
                  );
                  break;
                case "Display Name":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const DisplayName()),
                  );
                  break;
                case "Username":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const UserName()),
                  );
                  break;
                case "Bio":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const BioPage()),
                  );
                  break;
                case "Phone Number":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const PhonePage()),
                  );
                  break;
                case "Email":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const EmailPage()),
                  );
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: color.secondary,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(item.iconData, size: 30),
                    SizedBox(height: 8),
                    Text(item.itemName),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
