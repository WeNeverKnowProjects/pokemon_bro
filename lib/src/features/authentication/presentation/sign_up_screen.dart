import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/widgets/app_background.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/features/authentication/presentation/components/sign_up_form_component.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_validation_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/signup_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});
  static Widget create() {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthValidationCubit(),
        ),
        BlocProvider(
          create: (context) => getIt<SignupCubit>(),
        ),
      ],
      child: const SignUpScreen(),
    );
  }

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthValidationCubit, AuthValidationState>(
          listener: (context, state) {
            if (state.signUpFormatValidation != null) {
              if (state.signUpFormatValidation!.isFormValid) {
                context.read<SignupCubit>().createAccount(
                      state.signUpFormatValidation!.email,
                      state.signUpFormatValidation!.password,
                    );
              }
            }
          },
        ),
        BlocListener<SignupCubit, SignupState>(
          listener: (context, state) {
            if (state.loading) {
              showLoadingDialog(context);
            }
            if (state.failed) {
              context.pop();
              showErrorDialog(context,
                  title: "Failed",
                  message: state.errorMessage ?? "Something went wrong.");
            }
            if (state.success) {
              context.pop();
            }
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            const AppBackground(
                assetImage: "assets/images/cartoon-dragon-character.jpg"),
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Padding _buildForm() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(
              height: defaultPadding * 2,
            ),
            const Text(
              "Let's Join Us!",
              style: TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: defaultPadding,
            ),
            SignUpFormComponent(),
          ],
        ),
      ),
    );
  }
}
