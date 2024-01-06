import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:x_vpn/app_prefrences/app_prefrencese.dart';
import 'package:x_vpn/screens/home/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  //initializing hive database in starting of the application
  AppPrefrencese.initHive().then((_) => runApp(const App()));
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "VPNX",
      debugShowCheckedModeBanner: false,
      themeMode: AppPrefrencese.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 3),
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(centerTitle: true, elevation: 3),
      ),
      home: HomeScreen(),
    );
  }
}
