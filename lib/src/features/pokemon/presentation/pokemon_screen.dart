import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokemon_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';

class PokemonScreen extends StatefulWidget {
  const PokemonScreen({super.key});
  static Widget create(String url) {
    return BlocProvider(
      create: (context) => getIt<PokemonCubit>()..fetch(url),
      child: const PokemonScreen(),
    );
  }

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Pokemons"),
      ),
      body:
          BlocBuilder<PokemonCubit, PokemonState>(builder: (context, snapshot) {
        return switch (snapshot.state) {
          LoadState.success => buildListBuilder(snapshot.pokemons ?? []),
          LoadState.failed => Center(
              child: Text(snapshot.errorMessage ?? ""),
            ),
          _ => const SizedBox.shrink(),
        };
      }),
    );
  }

  Widget buildListBuilder(List<Pokemon> items) {
    final size = MediaQuery.of(context).size;
    return PageView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) => Column(
              children: [
                // Image.network(
                //   items[index].imageUrl,
                //   width: 32,
                //   height: 32,
                // ),
                ImageNetworkWrapper(
                  imageUrl: items[index].imageUrl,
                  width: size.width * 0.5,
                  height: size.height * 0.3,
                  fit: BoxFit.contain,
                ),
                const SizedBox(
                  height: defaultPadding / 2,
                ),
                Text(items[index].name ?? "?")
              ],
            ));
  }
}
