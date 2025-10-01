import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/views/failed_view.dart';
import 'package:pages/views/initial_view.dart';
import 'package:pages/views/loading_view.dart';
import 'package:pages/views/success_view.dart';
import 'bloc/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<HomeBloc, HomeState>(
          listener: (context, state) {
            if (state is HomeSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessView()),
              );
            }
          },
          builder: (context, state) {
            if (state is HomeInitial) {
              return const InicialView();
            } else if (state is HomeLoading) {
              return const LoadingView();
            } else if (state is HomeFailure) {
              return const FailureView();
            }
            return const InicialView();
          },
        ),
      ),
    );
  }
}
