import 'dart:io';
import 'package:get/route_manager.dart';
import 'package:stock_easy/db/db_helper.dart';
import 'package:flutter/material.dart';
import 'package:stock_easy/pages/deal/real_time_trade_page.dart';
import 'package:stock_easy/pages/home_page.dart';
import 'package:window_manager/window_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DbHelper().getDb();

  if (Platform.isMacOS || Platform.isWindows || Platform.isLinux) {
    WidgetsFlutterBinding.ensureInitialized();

    await windowManager.ensureInitialized();

    WindowOptions windowOptions = const WindowOptions(
      size: Size(720, 540),
      center: true,
      skipTaskbar: true,
      title: 'Flutter',
      titleBarStyle: TitleBarStyle.hidden,
    );
    windowManager.waitUntilReadyToShow(windowOptions, () async {
      await windowManager.show();
      await windowManager.focus();
    });
  }
  runApp(const GetMaterialApp(
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: '',
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'yzz'),
      home: const HomePage(),
      
    );
  }
}
