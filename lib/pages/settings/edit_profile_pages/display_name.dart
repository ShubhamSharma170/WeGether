import 'package:chat_app/components/button.dart';
import 'package:chat_app/components/notification_bar.dart';
import 'package:chat_app/components/textfield.dart';
import 'package:chat_app/provider/display_name_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DisplayName extends StatefulWidget {
  const DisplayName({super.key});

  @override
  State<DisplayName> createState() => _DisplayNameState();
}

class _DisplayNameState extends State<DisplayName> {
  late TextEditingController controller;
  late DisplayNameProvider _displayNameProvider;

  @override
  void initState() {
    super.initState();
    // initialize display name provider
    _displayNameProvider = Provider.of<DisplayNameProvider>(
      context,
      listen: false,
    );

    // initialize text editing controller with current display name
    controller = TextEditingController(text: _displayNameProvider.displayName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Display Name")),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Consumer<DisplayNameProvider>(
            builder: (ctx, provider, child) {
              return Column(
                children: [
                  MyTextField(
                    hintText: "Enter Display Name",
                    controller: controller,
                  ),
                  SizedBox(height: 20),
                  provider.isLoading
                      ? CircularProgressIndicator()
                      : MyButton(
                          buttonName: "Save",
                          onTap: () async {
                            // final user = FirebaseAuth.instance.currentUser;
                            // if (user != null) {
                            //   log(user.toString());
                            // }
                            String? errorMsg = await provider.updateDisplayName(
                              controller.text,
                            );
                            if (!ctx.mounted) return;
                            if (errorMsg != null) {
                              NotificationBar.showSnackBar(ctx, errorMsg);
                            }
                          },
                        ),
                ],
              );
            },
          ),
        ),
      ),
    );
  }
}
