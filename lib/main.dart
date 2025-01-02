//
// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// import 'Daily_task_1/Todo_Provider/Todo_Provider.dart';
// import 'Daily_task_1/Todo_Screen/Todo_Screen.dart';
//
// bool isDark = false;
//
// Future<void> main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
//   sharedPreferences.getBool('isDarkTheme') ?? false;
//
//   runApp(
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(
//           create: (context) => TodoProvider(),
//         ),
//       ],
//       child: const MyApp(),
//     ),
//   );
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     final provider = Provider.of<TodoProvider>(context);
//     return MaterialApp(
//       themeMode: provider.isDarkTheme ? ThemeMode.dark : ThemeMode.light,
//       theme: ThemeData.light(),
//       darkTheme: ThemeData.dark(),
//       debugShowCheckedModeBanner: false,
//       home: const TodoScreen(),
//     );
//   }
// }

import 'dart:convert';
import 'package:daily_task/Daily_task_2/server.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Daily_task_2/api.dart';
import 'Daily_task_2/details.dart';
import 'Daily_task_2/home_page.dart';
import 'Daily_task_2/home_page_1.dart';
import 'Daily_task_2/login_page.dart';

// void main() {
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login System App',
//       theme: ThemeData(primarySwatch: Colors.blue),
//       home: LoginScreen(),
//     );
//   }
// }

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final userDetails = await StorageHelper.getUserDetails();
  SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
  sharedPreferences.getBool('loginOrLogOut') ?? false;
  var con = Get.put(LoginController());
  runApp(
    GetMaterialApp(
      initialRoute: userDetails == null || con.loginOrLogOut != true ? '/login' : '/home',
      getPages: [
        GetPage(name: '/login', page: () => LoginScreen()),
        GetPage(name: '/home', page: () => HomeScreenData()),
        GetPage(name: '/logOutData', page: () => LogoutUser()),
        GetPage(name: '/details', page: () => DetailsScreen()),
      ],
    ),
  );
}
