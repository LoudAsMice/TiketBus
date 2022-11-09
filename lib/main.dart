import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tokokita/bloc/theme_bloc.dart';
import 'package:tokokita/helpers/user_info.dart';
import 'package:tokokita/ui/home_screen.dart';
import 'package:tokokita/ui/login_page.dart';
import 'package:tokokita/ui/menu_utama.dart';
import 'package:tokokita/helpers/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Widget page = CircularProgressIndicator();

  @override
  void initState() {
    super.initState();
    isLogin();
  }

  void isLogin() async {
    var token = await UserInfo().getToken();
    if (token != null) {
      setState(() {
        page = MenuUtama();
      });
    } else {
      setState(() {
        page = LoginPage();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ThemeManager(),
      child: Consumer<ThemeManager>(
        builder: (_, manager, __) {
          return MaterialApp(
            title: 'Toko Kita',
            debugShowCheckedModeBanner: false,
            theme: manager.themeData,
            home: page,
          );
        },
      ),
    );
  }
}
