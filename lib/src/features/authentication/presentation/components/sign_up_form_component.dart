import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/messages/messages.dart';
import 'package:pokemon/src/core/widgets/buttons/default_button.dart';
import 'package:pokemon/src/core/widgets/inputs/text_input_field.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_validation_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/widgets/authentication_widget.dart';

class SignUpFormComponent extends StatelessWidget {
  SignUpFormComponent({super.key});

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return buildField("Email",
                child: (TextInputField(
                    errorText: state.signUpFormatValidation != null &&
                            !state.signUpFormatValidation!.emailFormatValid
                        ? errorEmailFormat
                        : null,
                    controller: _emailController,
                    onChanged: (val) {
                      context
                          .read<AuthValidationCubit>()
                          .validateSignUp(email: val);
                    },
                    prefixIcon: const Icon(
                      Icons.mail_outline_rounded,
                      color: Colors.white,
                    ))).child);
          },
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return buildField("Password",
                child: (TextInputField(
                    obscureText: true,
                    errorText: state.signUpFormatValidation != null &&
                            !state.signUpFormatValidation!.passwordLengthValid
                        ? errorPasswordLength
                        : null,
                    controller: _passwordController,
                    onChanged: (val) {
                      context
                          .read<AuthValidationCubit>()
                          .validateSignUp(password: val);
                    },
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ))).child);
          },
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return buildField("Confirm Password",
                child: (TextInputField(
                    obscureText: true,
                    errorText:
                        state.signUpFormatValidation?.confirmPasswordError,
                    controller: _confirmPasswordController,
                    onChanged: (val) {
                      context
                          .read<AuthValidationCubit>()
                          .validateSignUp(confirmPassword: val);
                    },
                    prefixIcon: const Icon(
                      Icons.lock_outline_rounded,
                      color: Colors.white,
                    ))).child);
          },
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return (DefaultButton(
                    text: "CREATE ACCOUNT",
                    onPressed: (state.signUpValidation?.isFormValid ?? false)
                        ? () {
                            context
                                .read<AuthValidationCubit>()
                                .validateSignUpFormat(
                                  email: _emailController.text,
                                  password: _passwordController.text,
                                  confirmPassword:
                                      _confirmPasswordController.text,
                                );
                          }
                        : null))
                .child;
          },
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        buildLink(
          "have an account?",
          "Sign In",
          onTap: () {
            context.go("/login");
          },
        ),
      ],
    );
  }
}
