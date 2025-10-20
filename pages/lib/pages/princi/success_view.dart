import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pages/pages/princi/bloc/home_event.dart';
import 'package:pages/pages/princi/bloc/home_state.dart';
import 'package:pages/pages/princi/services/home_services.dart';
import 'package:pages/pages/princi/widgets/BackgroundHome.dart';
import 'bloc/home_bloc.dart';
import 'widgets/loading_home.dart';
import 'widgets/failure_home.dart';
import 'widgets/success_home.dart';

class SuccessView extends StatelessWidget {
  const SuccessView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => HomeBloc(HomeService())..add(LoadStats()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "Cristiano Ronaldo Dos Santos Aveiro",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: false,
          backgroundColor: Color(0xFF1E3C72),
        ),
        body: Stack(
          children: [
            BackgroundHome(),
            Column(
              children: [
                const SizedBox(height: 40),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.network(
                    'https://assets.goal.com/images/v3/blt4af919f965d04df1/6c762af3969c53e9ce5018c338c9862fb1a2ab8d.jpg?auto=webp&format=pjpg&width=3840&quality=60',
                    height: 250,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: BlocBuilder<HomeBloc, HomeState>(
                    builder: (context, state) {
                      if (state is HomeLoading || state is HomeInitial) {
                        return const LoadingHome();
                      } else if (state is HomeFailure) {
                        return FailureHome(message: state.message);
                      } else if (state is HomeSuccess) {
                        return SuccessHome();
                      }
                      return const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
