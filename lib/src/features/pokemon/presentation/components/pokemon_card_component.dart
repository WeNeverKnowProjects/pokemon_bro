import 'package:flutter/material.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';

class PokemonCardComponent extends StatelessWidget {
  const PokemonCardComponent({
    super.key,
    required this.pokemon,
    this.backgroundColor,
    this.onDragCompleted,
    this.scale = 1,
  });
  final Pokemon pokemon;
  final Color? backgroundColor;
  final Function()? onDragCompleted;
  final double scale;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250 * scale,
      height: 320 * scale,
      decoration: BoxDecoration(
          color: backgroundColor, borderRadius: BorderRadius.circular(12)),
      // padding: const EdgeInsets.symmetric(
      //   vertical: defaultPadding,
      // ),
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                "Min. Level ${pokemon.minLevel}",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              ),
              Text(
                "Max. Level ${pokemon.maxLevel}",
                style: const TextStyle(
                  fontStyle: FontStyle.italic,
                ),
              )
            ],
          ),
          Draggable(
            feedback: ImageNetworkWrapper(
              imageUrl: pokemon.imageUrl,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
            onDraggableCanceled: (velocity, offset) {},
            onDragCompleted: onDragCompleted,
            child: ImageNetworkWrapper(
              imageUrl: pokemon.imageUrl,
              height: 220 * scale,
              width: 190 * scale,
              fit: BoxFit.cover,
            ),
          ),
          Text(
            (pokemon.name ?? "-").toUpperCase(),
            style: const TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
