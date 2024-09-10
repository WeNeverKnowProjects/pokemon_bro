import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/widgets/buttons/default_outlined_button.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/area/presentation/cubit/area_cubit.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/pokemon/domain/entities/pokemon.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokeball_gift_cubit.dart';

class AreaHeaderComponent extends StatelessWidget {
  const AreaHeaderComponent({super.key, required this.member, this.onTap});
  final Member member;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topRight,
      child: InkWell(
        onTap: () {
          if (member.pokeball != null) {
            showSetting(context);
          }
        },
        child: Container(
          height: 34,
          width: 34,
          alignment: Alignment.center,
          margin: const EdgeInsets.fromLTRB(
              0, defaultPadding / 4, defaultPadding, 0),
          child: Stack(
            alignment: Alignment.center,
            children: [
              Image.asset(
                "assets/images/pokeball.png",
                width: 35,
                height: 35,
              ),
              Container(
                padding: const EdgeInsets.all(1),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                margin: const EdgeInsets.all(8),
                alignment: Alignment.center,
                child: Text(
                  "${member.pokeballBalance}",
                  style: const TextStyle(
                    fontWeight: FontWeight.w900,
                    color: Colors.amber,
                    fontSize: 10,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  showSetting(BuildContext context) {
    showModalBottomSheet(
        isScrollControlled: true,
        barrierColor: Colors.transparent,
        backgroundColor: const Color.fromARGB(219, 46, 10, 10),
        context: context,
        builder: (_) {
          return MultiBlocProvider(
            providers: [
              BlocProvider.value(
                value: BlocProvider.of<AuthChangeCubit>(context, listen: false),
              ),
              BlocProvider.value(
                value:
                    BlocProvider.of<PokeballGiftCubit>(context, listen: false),
              ),
              BlocProvider.value(
                value: BlocProvider.of<AreaCubit>(context, listen: false),
              ),
            ],
            child: FractionallySizedBox(
              heightFactor: 0.3,
              child: Dialog(
                elevation: 0,
                backgroundColor: Colors.transparent,
                insetPadding: EdgeInsets.zero,
                child: Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: defaultPadding,
                    vertical: defaultPadding / 2,
                  ),
                  decoration: const BoxDecoration(
                      // color: Colors.black38,
                      borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  )),
                  child: _buildSettingsCard(context),
                ),
              ),
            ),
          );
        });
  }

  Widget _buildSettingsCard(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Flexible(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  BlocBuilder<AuthChangeCubit, Member?>(
                    builder: (context, state) {
                      return _buildPokeballNumber(
                          const Icon(
                            Icons.arrow_circle_up_rounded,
                            color: Colors.red,
                            size: 28,
                          ),
                          "out ",
                          state?.numbers ?? 0);
                    },
                  ),
                  const Text("Pokeball Numbers"),
                  BlocBuilder<AuthChangeCubit, Member?>(
                    builder: (context, state) {
                      return _buildPokeballNumber(
                          const Icon(
                            Icons.arrow_circle_down_rounded,
                            color: Colors.green,
                            size: 28,
                          ),
                          "in",
                          state?.pokeballBalance ?? 0);
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: defaultPadding,
              ),
              Flexible(child: BlocBuilder<AuthChangeCubit, Member?>(
                builder: (context, state) {
                  if (state == null && (state?.pokemons ?? []).isEmpty) {
                    return const SizedBox.shrink();
                  }
                  return ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: state?.pokemons?.length,
                      itemBuilder: (context, index) {
                        var po = state?.pokemons![index];
                        return Padding(
                          padding: EdgeInsets.only(
                            left: index == 0 ? 0 : 30,
                          ),
                          child: _buildPokeball(po, index),
                        );
                      });
                },
              ))
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding / 2,
        ),
        (DefaultOutlinedButton(
            text: "EXIT APP",
            onPressed: () async {
              exitApp(context);
              // context.read<AuthChangeCubit>().signOut();
            })).child,
      ],
    );
  }

  exitApp(BuildContext context) async {
    showLoadingDialog(context);
    await Future.delayed(const Duration(seconds: 2));
    if (!context.mounted) return;
    context.pop();

    context.read<AuthChangeCubit>().signOut();
    context.read<AreaCubit>().reset();
  }

  Column _buildPokeball(Pokemon? po, int index) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 42,
          height: 42,
          decoration: const BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
          ),
          child: Stack(
            children: [
              ImageNetworkWrapper(
                imageUrl: "$baseImageUrl/${po?.id}.png",
              ),
              Text("${index + 1}"),
            ],
          ),
        ),
        const SizedBox(
          height: defaultPadding / 4,
        ),
        Text(
          "${po?.name}",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          "lev => ${po?.level}",
          style: const TextStyle(
            fontSize: 12,
          ),
        )
      ],
    );
  }

  Widget _buildPokeballNumber(Widget icon, String status, int numbers) {
    return Row(
      children: [
        icon,
        const SizedBox(
          width: defaultPadding / 4,
        ),
        RichText(
          text: TextSpan(children: [
            TextSpan(
                text: "$status ",
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  color: Colors.grey.shade400,
                )),
            TextSpan(
                text: "$numbers",
                style: const TextStyle(
                  fontWeight: FontWeight.w600,
                ))
          ]),
        ),
      ],
    );
  }
}
