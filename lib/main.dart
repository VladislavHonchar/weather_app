import 'package:flutter/material.dart';
import 'package:weather_app/widgets/auth/auth_widget.dart';
import 'package:weather_app/widgets/main_screen/main_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      //home: const AuthFormWidget(),
      routes: {
        '/auth' : (context) => const AuthFormWidget(),
        '/main_screen' : (context) => const MainScreenWidget(),
      },
      initialRoute: '/auth',
    );
  }
}


