import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/pages/login pages/services/api_services.dart';
import 'package:pages/pages/login pages/widgets/initial_view.dart';
import 'cubit/login_cubit.dart';
import '../home pages/success_view.dart' as home;
import 'widgets/failed_view.dart';
import 'widgets/loading_view.dart';

class InicialView extends StatelessWidget {
  const InicialView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => LoginCubit(LoginService()),
      child: Scaffold(
        body: BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccess) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const home.SuccessView()),
              );
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) return const LoadingView();
            if (state is LoginFailure)
              return FailureView(message: state.message);
            return const InitialLoginView();
          },
        ),
      ),
    );
  }
}
