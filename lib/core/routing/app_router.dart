import 'package:engas_task/core/routing/routes.dart';
import 'package:engas_task/features/home/ui/home_screen.dart';
import 'package:engas_task/features/login/logic/login_cubit.dart';
import 'package:engas_task/features/login/ui/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../di/dependency_injection.dart';

class AppRouter {
  static Route generateRoute(RouteSettings setting) {
    switch (setting.name) {
      case Routes.loginScreen:
        return MaterialPageRoute(builder: (context) =>
            BlocProvider(
              create: (context) => sl<LoginCubit>(),
              child: const LoginScreen(),
            ),);
      case Routes.homeScreen:
        return MaterialPageRoute(builder: (context) => const HomeScreen(),);
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                body: Center(
                  child: Text("The route name ${setting.name} not found"),
                ),
              ),
        );
    }
  }
}
