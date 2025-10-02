import 'package:flutter/material.dart';
import 'package:pages/views/initial_view.dart';

class FailureView extends StatelessWidget {
  final String message;

  const FailureView({super.key, required this.message});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(message, style: const TextStyle(color: Colors.red)),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const InicialView()),
                );
              },
              child: const Text("Reintentar"),
            ),
          ],
        ),
      ),
    );
  }
}
