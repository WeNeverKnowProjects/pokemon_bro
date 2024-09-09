import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/area/presentation/area_screen.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/catch_pokemon_cubit.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokemon_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});
  static Widget create(String url) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<PokemonCubit>()..fetch(url),
          // create: (context) => getIt<PokemonCubit>()..fetch(url),
        ),
        BlocProvider.value(
          value: getIt<CatchPokemonCubit>(),
          // create: (context) => SubjectBloc(),
        ),
      ],
      child: const PokemonScreen(),
    );
  }

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocListener<CatchPokemonCubit, CatchPokemonState>(
      listener: (context, state) {
        if (state.catchState == LoadState.loading) {
          showLoadingDialog(context);
        }
        if (state.catchState == LoadState.success) {
          context.pop();
        }
        if (state.catchState == LoadState.failed) {
          context.pop();
          showErrorDialog(context,
              title: "Failed",
              message: state.errorMessage ?? "Catch pokemon failed.");
        }

        // TODO: implement listener
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Pokemons"),
        ),
        body: BlocBuilder<PokemonCubit, PokemonState>(
            builder: (context, snapshot) {
          return switch (snapshot.state) {
            LoadState.success => buildListBuilder(snapshot.pokemons ?? []),
            LoadState.failed => Center(
                child: Text(snapshot.errorMessage ?? ""),
              ),
            _ => const SizedBox.shrink(),
          };
        }),
      ),
    );
  }

  Widget buildListBuilder(List<Pokemon> items) {
    final size = MediaQuery.of(context).size;
    return PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) =>
            buildPokemonCard(items[index], size, onDoubleTap: () {
              Logger.d("pokemon ${items[index].toJson()}");
              final member = context.read<AuthChangeCubit>();
              if (member.state != null) {
                Logger.d("catch executed");
                context
                    .read<CatchPokemonCubit>()
                    .catchPokemon(member.state!, items[index]);
              }
            }));
  }

  Widget buildPokemonCard(Pokemon pokemon, Size size,
      {Function()? onDoubleTap}) {
    return InkWell(
      onDoubleTap: onDoubleTap,
      child: Column(
        children: [
          ImageNetworkWrapper(
            imageUrl: pokemon.imageUrl,
            width: size.width * 0.5,
            height: size.height * 0.3,
            fit: BoxFit.contain,
          ),
          const SizedBox(
            height: defaultPadding / 2,
          ),
          Text(pokemon.name ?? "?")
        ],
      ),
    );
  }
}
