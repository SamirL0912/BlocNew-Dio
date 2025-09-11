import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/cubit/home_cubit.dart';

import 'bloc/crear_bloc.dart';
import 'bloc/crear_state.dart';
import 'bloc/crear_event.dart';

import 'views/initial_view.dart';
import 'views/loading_view.dart';
import 'views/failed_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Bloc + Cubit Demo',
      home: BlocProvider(
        create: (_) => CrearBloc(),
        child: BlocListener<CrearBloc, CrearState>(
          listener: (context, state) {
            if (state is CrearLoading) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const LoadingView()),
              );
            } else if (state is CrearSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => BlocProvider(
                    create: (_) => HomeCubit(),
                    child: const HomeView(),
                  ),
                ),
              );
            } else if (state is CrearFailure) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const FailedView()),
              );
            }
          },
          child: const InitialView(),
        ),
      ),
    );
  }
}
