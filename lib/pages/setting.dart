import 'package:chat_app/components/setting_items.dart';
import 'package:chat_app/pages/settings/aboutUs.dart';
import 'package:chat_app/pages/settings/editprofile.dart';
import 'package:chat_app/pages/settings/help&support.dart';
import 'package:chat_app/pages/settings/theme.dart';
import 'package:flutter/material.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    ColorScheme colorScheme = Theme.of(context).colorScheme;
    List<SettingItems> settingsOptions = [
      SettingItems(icon: Icons.edit, name: "Edit Profile"),
      SettingItems(icon: Icons.color_lens, name: "Theme"),
      SettingItems(icon: Icons.support_agent, name: "Help & Support"),
      SettingItems(icon: Icons.info, name: "About Us"),
    ];
    return Scaffold(
      appBar: AppBar(
        // title: Text("Settings"),
        backgroundColor: colorScheme.surface,
      ),
      body: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          // childAspectRatio: 1.3,
          mainAxisExtent: 150,
        ),
        itemCount: settingsOptions.length,
        itemBuilder: (context, index) {
          final item = settingsOptions[index];
          return GestureDetector(
            onTap: () {
              if (!context.mounted) return;
              switch (item.name) {
                case "Edit Profile":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfilePage(),
                    ),
                  );
                  break;
                case "Theme":
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ThemePage()),
                  );
                  break;
                case "Help & Support":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HelpAndSupportPage(),
                    ),
                  );
                  break;
                case "About Us":
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AboutUsPage(),
                    ),
                  );
                  break;
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: colorScheme.secondary,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(item.icon, size: 30),
                      SizedBox(height: 10),
                      Text(item.name!),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
