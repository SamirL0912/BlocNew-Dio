import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/views/failed_view.dart';
import 'package:pages/views/initial_view.dart';
import 'package:pages/views/loading_view.dart';
import 'package:pages/views/success_view.dart';
import 'bloc/login_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LoginBloc(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<LoginBloc, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => SuccessView()),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginInitial) {
              return const InicialView();
            } else if (state is LoginLoading) {
              return const LoadingView();
            } else if (state is LoginFailure) {
              return const FailureView();
            }
            return const InicialView();
          },
        ),
      ),
    );
  }
}