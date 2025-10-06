import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/bloc/home_bloc.dart';

class SuccessView extends StatelessWidget {
	const SuccessView({super.key});

	@override
	Widget build(BuildContext context) {
		return BlocProvider(
			create: (_) => HomeBloc()..add(LoadStats()),
			child: Scaffold(
				appBar: AppBar(title: const Text("Cristiano Ronaldo Dos Santos Aveiro")),
				body: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center,
						children: [
							Image.network(
								"https://s3.abcstatics.com/media/deportes/2018/07/10/cristiano-ronaldo-kNlH--620x349@abc.jpg",
								height: 200,
							),
							const SizedBox(height: 20),
							BlocBuilder<HomeBloc, HomeState>(
								builder: (context, state) {
									if (state is HomeInitial || state is HomeLoading) {
										return const CircularProgressIndicator();
									} else if (state is HomeSuccess) {
										return Column(
											children: [
												Text(
													"Partidos: ${state.partidos}",
													style: const TextStyle(fontSize: 20),
												),
												Text(
													"Goles: ${state.goles}",
													style: const TextStyle(fontSize: 20),
												),
												Text(
													"Asistencias: ${state.asistencias}",
													style: const TextStyle(fontSize: 20),
												),
											],
										);
									} else if (state is HomeFailure) {
										return Text(
											"Error: ${state.message}",
											style: const TextStyle(color: Colors.red),
										);
									}
									return const SizedBox();
								},
							),
						],
					),
				),
			),
		);
	}
}