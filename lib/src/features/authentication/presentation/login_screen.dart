import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/presentation/components/login_form_component.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_validation_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static Widget create(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(value: getIt<LoginCubit>()),
        BlocProvider(create: (context) => AuthValidationCubit())
      ],
      child: const LoginScreen(),
    );
  }

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        // BlocListener<AuthChangeCubit, Member?>(listener: (context, state) {
        //   if (state != null && state.loginAt != null) {
        //     if (context.canPop()) {
        //       context.pop();
        //     }
        //   }
        // }),
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.member != null && state.success) {
              context.pop();
              // context
              //     .read<AuthChangeCubit>()
              //     .updateMember(state.member?.email ?? "");
              // context.read<AuthChangeCubit>().setMember(state.member!);
            }
            if (state.failed) {
              //error logic here
              context.pop();
              showErrorDialog(
                context,
                title: "Failed",
                message: state.errorMessage ?? "Something went wrong.",
              );
            }
            if (state.loading) {
              //loading here
              showLoadingDialog(context);
            }
          },
        ),
        BlocListener<AuthValidationCubit, AuthValidationState>(
          listener: (context, state) {
            if (state.loginFormatValidation != null) {
              if (state.loginFormatValidation!.emailFormatValid &&
                  state.loginFormatValidation!.passwordLengthValid) {
                // BlocProvider.of<LoginCubit>(context).login(
                //     state.loginFormatValidation!.email,
                //     state.loginFormatValidation!.password);
                context.read<LoginCubit>().login(
                    state.loginFormatValidation!.email,
                    state.loginFormatValidation!.password);
              }
            }
          },
        ),
      ],
      child: SafeArea(
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                LoginFormComponent()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
