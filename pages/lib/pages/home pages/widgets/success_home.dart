import 'package:flutter/material.dart';

class SuccessHome extends StatelessWidget {
  final int partidos;
  final int goles;
  final int asistencias;

  const SuccessHome({
    super.key,
    required this.partidos,
    required this.goles,
    required this.asistencias,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.network(
          "https://s3.abcstatics.com/media/deportes/2018/07/10/cristiano-ronaldo-kNlH--620x349@abc.jpg",
          height: 200,
        ),
        const SizedBox(height: 20),
        Text("Partidos: $partidos", style: const TextStyle(fontSize: 20)),
        Text("Goles: $goles", style: const TextStyle(fontSize: 20)),
        Text("Asistencias: $asistencias", style: const TextStyle(fontSize: 20)),
      ],
    );
  }
}
