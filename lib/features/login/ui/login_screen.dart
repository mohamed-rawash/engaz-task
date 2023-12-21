import 'package:engas_task/core/helpers/spacing.dart';
import 'package:engas_task/core/themes/colors.dart';
import 'package:engas_task/core/themes/text_styles.dart';
import 'package:engas_task/core/widgets/engaz_task_text_form_field.dart';
import 'package:engas_task/features/login/logic/login_cubit.dart';
import 'package:engas_task/features/login/ui/widgets/email_and_password.dart';
import 'package:engas_task/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/models/login_request_body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                verticalSpacing(height: 30),
                Container(
                  width: 150,
                  height: 150,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                        image: AssetImage("assets/images/logo.png")),
                    borderRadius: BorderRadius.circular(75),
                  ),
                ),
                verticalSpacing(height: 100),
                Align(
                  alignment: AlignmentDirectional.centerStart,
                  child: Text(
                    "Login",
                    style: TextStyles.font32BlueBold,
                    textAlign: TextAlign.start,
                  ),
                ),
                verticalSpacing(height: 20),
                const EmailAndPassword(),
                verticalSpacing(height: 40),
                ElevatedButton(
                  onPressed: () {
                    validateThenDoLogin(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorsManager.mainBlue,
                    foregroundColor: ColorsManager.white,
                    minimumSize: Size(300.w, 50.h),
                  ),
                  child: Text(
                    "login",
                    style: TextStyles.font18WhiteBold.copyWith(
                      letterSpacing: 3,
                    ),
                  ),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenDoLogin(BuildContext context) {
    if(context.read<LoginCubit>().formKey.currentState!.validate()){
      context.read<LoginCubit>().emitLoginStates(
        LoginRequestBody(
          email: context.read<LoginCubit>().emailController.text,
          password: context.read<LoginCubit>().passwordController.text,
        ),
      );
    }
  }
}
