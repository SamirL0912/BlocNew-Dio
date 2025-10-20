import 'package:flutter/material.dart';
import 'package:pages/pages/princi/success_view.dart';
import 'pages/login/inicial_view.dart';
import 'pages/login/widgets/BackgroundLogin.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Stack(
          children: [
            BackgroundLogin(),
            SafeArea(child: Center(child: SuccessView())),
          ],
        ),
      ),
    );
  }
}
