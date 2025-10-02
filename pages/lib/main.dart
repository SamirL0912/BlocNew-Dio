import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/views/failed_view.dart';
import 'package:pages/views/initial_view.dart';
import 'package:pages/views/loading_view.dart';
import 'package:pages/views/success_view.dart';
import 'bloc/home_bloc.dart';
import 'cubit/login_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => LoginCubit()),
        BlocProvider(create: (_) => HomeBloc()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (_) => BlocProvider.value(
                        value: context.read<HomeBloc>()..add(LoadStats()),
                        child: const SuccessView(),
                      ),
                ),
              );
            } else if (state is LoginFailure) {
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(state.message)));
            }
          },
          builder: (context, state) {
            if (state is LoginInitial) {
              return const InicialView();
            } else if (state is LoginLoading) {
              return const LoadingView();
            } else if (state is LoginFailure) {
              return FailureView(message: state.message);
            }
            return const InicialView();
          },
        ),
      ),
    );
  }
}
