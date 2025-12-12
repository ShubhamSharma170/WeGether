import 'package:chat_app/pages/home.dart';
import 'package:chat_app/pages/login.dart';
import 'package:chat_app/pages/setting.dart';
import 'package:chat_app/pages/settings/editprofile.dart';
import 'package:chat_app/pages/settings/help&support.dart';
import 'package:chat_app/pages/settings/theme.dart';
import 'package:chat_app/pages/splash.dart';
import 'package:chat_app/routes/routes_name.dart';
import 'package:flutter/material.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.splash:
        return MaterialPageRoute(
          builder: (BuildContext context) => SplashPage(),
        );
      case RouteName.login:
        return MaterialPageRoute(
          builder: (BuildContext context) => LoginPage(),
        );
      case RouteName.setting:
        return MaterialPageRoute(
          builder: (BuildContext context) => SettingPage(),
        );
      case RouteName.editprofile:
        return MaterialPageRoute(
          builder: (BuildContext context) => EditProfilePage(),
        );
      case RouteName.theme:
        return MaterialPageRoute(
          builder: (BuildContext context) => ThemePage(),
        );
      case RouteName.helpAndSupport:
        return MaterialPageRoute(
          builder: (BuildContext context) => HelpAndSupportPage(),
        );
      case RouteName.home:
        return MaterialPageRoute(builder: (BuildContext context) => HomePage());
      default:
        return MaterialPageRoute(
          builder: (_) =>
              const Scaffold(body: Center(child: Text("No Route Found"))),
        );
    }
  }
}
