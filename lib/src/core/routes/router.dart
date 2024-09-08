import 'package:go_router/go_router.dart';
import 'package:pokemon/src/features/area/presentation/area_screen.dart';
import 'package:pokemon/src/features/authentication/presentation/login_screen.dart';
import 'package:pokemon/src/features/authentication/presentation/sign_up_screen.dart';
import 'package:pokemon/src/features/pokemon/presentation/pokemon_screen.dart';

GoRouter router({String? redirect}) => GoRouter(
      initialLocation: redirect ?? "/login",
      routes: [
        GoRoute(
          path: '/login',
          builder: (context, state) => LoginScreen.create(context),
        ),
        GoRoute(
          path: '/signup',
          builder: (context, state) => SignUpScreen.create(),
        ),
        GoRoute(
            path: '/',
            builder: (context, state) => AreaScreen.create(),
            routes: [
              GoRoute(
                path: 'pokemons',
                builder: (context, state) =>
                    PokemonScreen.create(state.extra as String),
              )
            ]),
      ],
    );
