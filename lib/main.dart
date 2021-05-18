import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter_app_read_qr/pages/home_page.dart';
import 'package:flutter_app_read_qr/pages/map_page.dart';
import 'package:flutter_app_read_qr/providers/ui_provider.dart';
import 'package:flutter_app_read_qr/providers/scan_list_provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => new UiProvider()),
        ChangeNotifierProvider(create: (_) => new ScanListProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'QR App',
        initialRoute: 'home',
        routes: {'home': (_) => HomePage(), 'map': (_) => MapPage()},
        theme: ThemeData(
            primaryColor: Colors.deepPurple,
            floatingActionButtonTheme: FloatingActionButtonThemeData(
                backgroundColor: Colors.deepPurpleAccent)),
      ),
    );
  }
}
