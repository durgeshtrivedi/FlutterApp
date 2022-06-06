import 'package:apple_apps/screens/Home.dart';
import 'package:apple_apps/screens/login.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static Map<String, WidgetBuilder> navigationRoutes(BuildContext context) {
    return {
      Routes.home.route: Routes.home.widget(),
      Routes.login.route: Routes.login.widget()
    };
  }
}

enum Routes {
  login("/login", Login()),
  home("/", Home(title: "App Home"));

  final String route;
  final Widget screen;
  const Routes(this.route, this.screen);

  WidgetBuilder widget() {
    return (context) => screen;
  }
}
