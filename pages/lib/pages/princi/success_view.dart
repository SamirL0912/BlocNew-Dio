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
            "Cristiano Dos Santos Aveiro",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
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
                    'https://s3.abcstatics.com/media/deportes/2018/07/10/cristiano-ronaldo-kNlH--620x349@abc.jpg',
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
