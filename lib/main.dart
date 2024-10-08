import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/core/config/environment.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/routes/router.dart';
import 'package:pokemon/src/core/themes/cubit/themes_cubit.dart';
import 'package:pokemon/src/core/themes/themes.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokeball_gift_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

initTimer(BuildContext context) async {
  final member = context.read<AuthChangeCubit>().state;
  Logger.d("init timer $member");
  if (member?.loginAt != null && member!.pokeball! >= 20) return;
  context.read<PokeballGiftCubit>().pokeballGiftListen(
        email: member?.email,
        loginAt: member?.loginAt,
      );
}

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  //GetIt Injection
  await configureDependencies();

  //Provide App Environment
  getIt<AppEnvironment>().getEnv();

  Bloc.observer = DefaultBlocObserver();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(
        value: getIt<AuthChangeCubit>(),
        // create: (context) => getIt<AuthChangeCubit>(),
      ),
      BlocProvider.value(
        value: getIt<PokeballGiftCubit>(),
        // create: (context) => getIt<PokeballGiftCubit>(),
      ),
      BlocProvider.value(
        value: getIt<ThemesCubit>(),
        // create: (context) => getIt<PokeballGiftCubit>(),
      ),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    context.read<ThemesCubit>().getTheme(context, ThemeMode.system);
    return StreamBuilder<Member?>(
        stream: context.read<AuthChangeCubit>().authStateChange(),
        builder: (context, snapshot) {
          Logger.d("data ${snapshot.data}");
          var redirect = snapshot.data == null ? null : "/";

          return MultiBlocListener(
            listeners: [
              BlocListener<AuthChangeCubit, Member?>(
                listener: (context, state) {
                  if (state?.loginAt != null) {
                    initTimer(context);
                  }
                },
              ),
            ],
            child: BlocBuilder<ThemesCubit, AppTheme?>(
              builder: (context, state) {
                Logger.d("AppTheme ${ThemeMode.system.name} ${state?.mode}");
                return MaterialApp.router(
                  title: 'Pokemon App',
                  debugShowCheckedModeBanner: false,
                  // themeMode: ThemeMode.system,
                  theme: state?.themes,
                  // theme: ThemeData(
                  //   textTheme: Theme.of(context).textTheme.apply(
                  //         bodyColor: Colors.white,
                  //         displayColor: Colors.white,
                  //       ),
                  //   colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
                  //   useMaterial3: true,
                  // ),
                  routerConfig: router(redirect: redirect),
                );
              },
            ),
          );
        });
  }
}

class DefaultBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    Logger.d("bloc ${bloc.runtimeType} $change");
    super.onChange(bloc, change);
  }
}
