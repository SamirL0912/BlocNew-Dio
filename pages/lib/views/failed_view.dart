import 'package:flutter/material.dart';

class FailedView extends StatelessWidget {
  const FailedView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Error")),
      body: const Center(
        child: Text(
          "Ha ocurrido un error",
          style: TextStyle(fontSize: 20, color: Colors.red),
        ),
      ),
    );
  }
}
