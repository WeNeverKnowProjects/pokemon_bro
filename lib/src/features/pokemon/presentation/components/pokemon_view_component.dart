import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/components/pokemon_card_component.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/catch_pokemon_cubit.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokemon_cubit.dart';

class PokemonViewComponent extends StatefulWidget {
  const PokemonViewComponent({super.key});

  @override
  State<PokemonViewComponent> createState() => _PokemonViewComponentState();
}

class _PokemonViewComponentState extends State<PokemonViewComponent> {
  double _currentPageValue = 0;
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 0.6);
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        _currentPageValue = _pageController.page ?? 0;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonCubit, PokemonState>(
        builder: (context, snapshot) {
      return switch (snapshot.state) {
        LoadState.success => _buildPageViewBuilder(snapshot.pokemons ?? []),
        LoadState.failed => Center(
            child: Text(snapshot.errorMessage ?? ""),
          ),
        _ => const SizedBox.shrink(),
      };
    });
  }

  Widget _buildPageViewBuilder(List<Pokemon> items) {
    return PageView.builder(
        controller: _pageController,
        itemCount: items.length,
        itemBuilder: (context, index) {
          double diff = index - _currentPageValue;
          if (diff < 0) {
            diff *= -1;
          }
          diff = min(1, diff);
          var po = items[index];
          return Center(
            child: PokemonCardComponent(
              scale: 1 - (diff * 0.3),
              pokemon: po,
              backgroundColor: index.isEven
                  ? const Color.fromARGB(108, 21, 82, 132)
                  : const Color.fromARGB(162, 158, 121, 9),
              onDragCompleted: () {
                Logger.d("drag completed");
                final member = context.read<AuthChangeCubit>();
                if (member.state != null) {
                  Logger.d("catch executed");
                  context
                      .read<CatchPokemonCubit>()
                      .catchPokemon(member.state!, items[index]);
                }
              },
            ),
          );
          // return Container(
          //   decoration: BoxDecoration(
          //       color: index.isEven
          //           ? const Color.fromARGB(108, 21, 82, 132)
          //           : const Color.fromARGB(162, 158, 121, 9),
          //       borderRadius: BorderRadius.circular(12)),
          //   margin: const EdgeInsets.symmetric(
          //     horizontal: 50,
          //     vertical: 70,
          //   ),
          //   alignment: Alignment.bottomCenter,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       Row(
          //         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          //         children: [
          //           Text(
          //             "Min. Level ${po.minLevel}",
          //             style: const TextStyle(
          //               fontStyle: FontStyle.italic,
          //             ),
          //           ),
          //           Text(
          //             "Max. Level ${po.maxLevel}",
          //             style: const TextStyle(
          //               fontStyle: FontStyle.italic,
          //             ),
          //           )
          //         ],
          //       ),
          //       Draggable(
          //         feedback: ImageNetworkWrapper(
          //           imageUrl: items[index].imageUrl,
          //           height: 120,
          //           width: 120,
          //           fit: BoxFit.cover,
          //         ),
          //         onDraggableCanceled: (velocity, offset) {},
          //         child: ImageNetworkWrapper(
          //           imageUrl: items[index].imageUrl,
          //           height: 220,
          //           width: 190,
          //           fit: BoxFit.cover,
          //         ),
          //         onDragCompleted: () {
          //           Logger.d("drag completed");
          //           final member = context.read<AuthChangeCubit>();
          //           if (member.state != null) {
          //             Logger.d("catch executed");
          //             context
          //                 .read<CatchPokemonCubit>()
          //                 .catchPokemon(member.state!, items[index]);
          //           }
          //         },
          //       ),
          //       Text(
          //         (items[index].name ?? "-").toUpperCase(),
          //         style: const TextStyle(
          //           fontSize: 28,
          //           fontWeight: FontWeight.bold,
          //         ),
          //       ),
          //     ],
          //   ),
          // );
        });
  }
}
