import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/bloc/home_bloc.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cristiano Ronaldo Dos Santos Aveiro"),
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 164, 199, 255),
      ),
      body: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xFF6A11CB), Color(0xFF2575FC)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Imagen con bordes redondeados
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                "https://s3.abcstatics.com/media/deportes/2018/07/10/cristiano-ronaldo-kNlH--620x349@abc.jpg",
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 30),

            // Stats juntas en un contenedor
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeInitial || state is HomeLoading) {
                  return const CircularProgressIndicator(
                    color: Colors.white,
                  );
                } else if (state is HomeSuccess) {
                  return Container(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 15),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.9),
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 8,
                          offset: Offset(0, 4),
                        ),
                      ],
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        _statItem("Partidos", state.partidos.toString()),
                        _statItem("Goles", state.goles.toString()),
                        _statItem("Asistencias", state.asistencias.toString()),
                      ],
                    ),
                  );
                } else if (state is HomeFailure) {
                  return Text(
                    "Error: ${state.message}",
                    style: const TextStyle(
                      color: Colors.redAccent,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _statItem(String title, String value) {
    return Column(
      children: [
        Text(
          value,
          style: const TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}
