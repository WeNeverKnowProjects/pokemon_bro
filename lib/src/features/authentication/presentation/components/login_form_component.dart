import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/messages/messages.dart';
import 'package:pokemon/src/core/routes/router.dart';
import 'package:pokemon/src/core/widgets/buttons/default_button.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/core/widgets/inputs/text_input_field.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_validation_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/widgets/authentication_widget.dart';

class LoginFormComponent extends StatelessWidget {
  const LoginFormComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: BlocProvider.of<LoginCubit>(context),
      // create: (context) => SubjectBloc(),
      child: buildForm(context),
    );
  }

  Widget buildForm(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        buildField(
          "Email",
          child: BlocBuilder<AuthValidationCubit, AuthValidationState>(
            builder: (context, state) {
              return (TextInputField(
                  errorText: state.loginFormatValidation != null &&
                          !state.loginFormatValidation!.emailFormatValid
                      ? errorEmailFormat
                      : null,
                  onChanged: (val) {
                    context.read<AuthValidationCubit>().validateLogin(
                          email: val,
                        );
                  },
                  prefixIcon: const Icon(
                    Icons.mail_outline_rounded,
                  ))).child;
            },
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        buildField(
          "Password",
          child: BlocBuilder<AuthValidationCubit, AuthValidationState>(
            builder: (context, state) {
              return (TextInputField(
                  errorText: state.loginFormatValidation != null &&
                          !state.loginFormatValidation!.passwordLengthValid
                      ? errorPasswordLength
                      : null,
                  onChanged: (val) {
                    context
                        .read<AuthValidationCubit>()
                        .validateLogin(password: val);
                  },
                  obscureText: true,
                  prefixIcon: const Icon(
                    Icons.lock_outline_rounded,
                  ))).child;
            },
          ),
        ),
        const SizedBox(
          height: defaultPadding,
        ),
        BlocBuilder<AuthValidationCubit, AuthValidationState>(
          builder: (context, state) {
            return (DefaultButton(
              text: "SIGN IN",
              onPressed: (state.loginValidation?.isFormValid ?? false)
                  ? () {
                      // showLoadingDialog(context);
                      context.read<AuthValidationCubit>().validateLoginFormat();
                    }
                  : null,
            )).child;
          },
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        buildLink("don't have an account?", "Create an Account", onTap: () {
          context.go("/signup");
        })
      ],
    );
  }
}
