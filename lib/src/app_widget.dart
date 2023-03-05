import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key? key}) : super(key: key);

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  ThemeData themeData = ThemeData.light();

  @override
  void initState() {
    super.initState();
    themeUserPreference();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      
      debugShowCheckedModeBanner: false,
      routerDelegate: Modular.routerDelegate,
      routeInformationParser: Modular.routeInformationParser,
      theme: themeData,
    );
  }

  Future<ThemeData> themeUserPreference() async {
    final prefs = await SharedPreferences.getInstance();
    var themeId = prefs.getInt("theme");
    if (themeId == null) {
      return ThemeData.light();
    } else {
      if (themeId == 1) {
        return ThemeData.dark();
      } else {
        return ThemeData.light();
      }
    }
  }
}
