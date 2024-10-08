import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/themes/cubit/themes_cubit.dart';
import 'package:pokemon/src/core/themes/themes.dart';
import 'package:pokemon/src/core/widgets/app_background.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';

import 'package:pokemon/src/features/authentication/presentation/components/login_form_component.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_validation_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/login_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});
  static Widget create() {
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
    var apptheme = context.watch<ThemesCubit>();
    return MultiBlocListener(
      listeners: [
        BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state.member != null && state.success) {
              context.pop();
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
                context.read<LoginCubit>().login(
                    state.loginFormatValidation!.email,
                    state.loginFormatValidation!.password);
              }
            }
          },
        ),
      ],
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: [
            AppBackground(
              assetImage: (apptheme.state?.darkMode ?? false)
                  ? "assets/images/cartoon-dragon-character.jpg"
                  : "assets/images/light-bg.jpg",
              blurColor: (apptheme.state?.darkMode ?? false)
                  ? Colors.black.withOpacity(0.5)
                  : Colors.white.withOpacity(0.2),
            ),
            _buildTitle(
              (apptheme.state?.darkMode ?? false)
                  ? "assets/images/pokemon-label.png"
                  : "assets/images/pokemon-label-light.png",
              (apptheme.state?.darkMode ?? false)
                  ? "assets/images/pokemon-sub-label.png"
                  : "assets/images/pokemon-sub-label-light.png",
            ),
            // _buildBody(),
          ],
        ),
      ),
    );
  }

  Widget _buildTitle(String imageLabel, String imageSubLabel) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(
            horizontal: defaultPadding, vertical: defaultPadding * 1.5),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(imageLabel),
              Image.asset(imageSubLabel),
              _buildBody(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildBody() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: defaultPadding * 2,
        ),
        LoginFormComponent()
      ],
    );
  }
}
