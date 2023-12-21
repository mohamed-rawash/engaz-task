import 'package:engas_task/core/helpers/extensions.dart';
import 'package:engas_task/features/login/logic/login_cubit.dart';
import 'package:engas_task/features/login/logic/login_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/routing/routes.dart';
import '../../../../core/themes/colors.dart';
import '../../../../core/themes/text_styles.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginLoadingState) {
          showDialog(
            context: context,
            builder: (_) => const Center(
              child: CircularProgressIndicator(
                color: ColorsManager.mainBlue,
              ),
            ),
          );
        }
        if (state is LoginSuccessState) {
          context.pop();
          context.pushNamedAndRemoveUntil(
            Routes.homeScreen,
            predicate: (_) => false,
          );
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsManager.green,
              behavior: SnackBarBehavior.floating,
              content: Text(
                "Welcome ${state.loginResponse.userName ?? ''} You Logged In Successful",
                style: TextStyles.font16DarkBlueMedium,
              ),
            ),
          );
        }
        if (state is LoginErrorState) {
          context.pop();
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: ColorsManager.red,
              behavior: SnackBarBehavior.floating,
              content: Text(
                state.errorMessage,
                style: TextStyles.font16DarkBlueMedium,
              ),
            ),
          );
        }
      },
      child: const SizedBox.shrink(),
    );
  }
}
