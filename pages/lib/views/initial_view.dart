import 'package:flutter/material.dart';

class InitialView extends StatelessWidget {
  const InitialView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Formulario")),
      body: Padding(
        padding: const EdgeInsets.all(19.0),
        child: Column(
          children: const [
            TextField(
              decoration: InputDecoration(
                labelText: "Nombre",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            TextField(
              decoration: InputDecoration(
                labelText: "Telefono",
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16),

            ElevatedButton(
              onPressed: null,
              child: Text("Enviar"),
            ),
          ],
        ),
      ),
    );
  }
}
