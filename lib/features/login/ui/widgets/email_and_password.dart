import 'package:engas_task/features/login/logic/login_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/helpers/spacing.dart';
import '../../../../core/widgets/engaz_task_text_form_field.dart';

class EmailAndPassword extends StatelessWidget {
  const EmailAndPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubit>().formKey,
      child: Column(
        children: [
          EngazTaskTextFormField(
            hintText: "Email",
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
            controller: context.read<LoginCubit>().emailController,
          ),
          verticalSpacing(height: 20),
          EngazTaskTextFormField(
            hintText: "Password",
            validator: (value) {
              if(value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            controller: context.read<LoginCubit>().passwordController,
          ),
        ],
      ),
    );
  }
}
