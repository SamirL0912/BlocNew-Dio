import 'dart:async';
import 'package:flutter/material.dart';

class SuccessView extends StatefulWidget {
  final String username;

  const SuccessView({super.key, required this.username});

  @override
  State<SuccessView> createState() => _SuccessViewState();
}

class _SuccessViewState extends State<SuccessView> {
  bool showInfo = false;

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () {
      setState(() {
        showInfo = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text("Bienvenido"),
        backgroundColor: Colors.green,
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen fija
            Image.network(
              "https://upload.wikimedia.org/wikipedia/commons/9/96/Real_Madrid_CF.svg",
              height: 150,
              width: 150,
            ),
            const SizedBox(height: 20),

            // Info que aparece con delay
            AnimatedOpacity(
              opacity: showInfo ? 1 : 0,
              duration: const Duration(seconds: 1),
              child: Column(
                children: [
                  Text(
                    "¡Hola ${widget.username}!",
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    "Has iniciado sesión correctamente 🎉",
                    style: TextStyle(fontSize: 16),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
