import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/widgets/app_background.dart';
import 'package:pokemon/src/core/widgets/buttons/default_outlined_button.dart';
import 'package:pokemon/src/core/widgets/image_network_wrapper.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokeball_gift_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/features/area/domain/entities/area.dart';
import 'package:pokemon/src/features/area/presentation/cubit/area_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({super.key});

  static Widget create() {
    return BlocProvider.value(
      // create: (context) => getIt<AreaCubit>(),
      value: getIt<AreaCubit>()..init(),
      child: const AreaScreen(),
    );
  }

  @override
  State<AreaScreen> createState() => _AreaScreenState();
}

class _AreaScreenState extends State<AreaScreen> {
  @override
  void initState() {
    addMember();

    super.initState();
  }

  addMember() {
    final auth = context.read<AuthChangeCubit>();
    auth.addMember(auth.state?.email ?? "");
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthChangeCubit, Member?>(listener: (context, snapshot) {
          if (snapshot != null && snapshot.loginAt != null) {
            context.read<AreaCubit>().loadArea();
          }
        }),
        BlocListener<AreaCubit, AreaState>(
          listener: (context, state) {
            Logger.d("state //${state.state}");
          },
        ),
        BlocListener<PokeballGiftCubit, PokeballGiftState>(
          listener: (context, state) {
            if (state.timerState == TimerState.triggered) {
              context.read<AuthChangeCubit>().updateMember(state.email ?? "");
            }
          },
        ),
      ],
      child: Scaffold(
        body: Stack(
          children: [
            const AppBackground(assetImage: "assets/images/area-bg.jpg"),
            ListView(
              children: [
                const SizedBox(
                  height: defaultPadding * 2,
                ),
                BlocBuilder<AreaCubit, AreaState>(builder: (context, snapshot) {
                  return switch (snapshot.state) {
                    LoadState.failed => Center(
                        child: Text(snapshot.errorMessage ?? ""),
                      ),
                    LoadState.success => buildListBuilder(snapshot.areas ?? []),
                    _ => const SizedBox.shrink()
                  };
                }),
              ],
            ),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const SizedBox(
                    height: defaultPadding / 2,
                  ),
                  BlocBuilder<AuthChangeCubit, Member?>(
                    builder: (context, state) {
                      return Align(
                        alignment: Alignment.topRight,
                        child: InkWell(
                          onTap: () {
                            if (state != null && state.pokeball != null) {
                              showSetting();
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
                                BlocBuilder<AuthChangeCubit, Member?>(
                                    builder: (context, snapshot) {
                                  if (snapshot != null) {
                                    return Container(
                                      padding: const EdgeInsets.all(1),
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black,
                                      ),
                                      margin: const EdgeInsets.all(8),
                                      alignment: Alignment.center,
                                      child: Text(
                                        snapshot.pokeball == null
                                            ? ""
                                            : "${snapshot.pokeballBalance}",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.w900,
                                          color: Colors.amber,
                                          fontSize: 10,
                                        ),
                                        textAlign: TextAlign.center,
                                      ),
                                    );
                                  }
                                  return const SizedBox.shrink();
                                }),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),

        // body: BlocBuilder<AreaCubit, AreaState>(builder: (context, snapshot) {
        //   return switch (snapshot.state) {
        //     LoadState.failed => Center(
        //         child: Text(snapshot.errorMessage ?? ""),
        //       ),
        //     LoadState.success => buildListBuilder(snapshot.areas ?? []),
        //     _ => const SizedBox.shrink()
        //   };
        // }),
      ),
    );
  }

  showSetting() {
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
                  child: Column(
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
                            Flexible(
                                child: BlocBuilder<AuthChangeCubit, Member?>(
                              builder: (context, state) {
                                if (state == null &&
                                    (state?.pokemons ?? []).isEmpty) {
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
                                          right: index ==
                                                  ((state?.pokemons!.length ??
                                                          0) -
                                                      1)
                                              ? 30
                                              : 0,
                                        ),
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
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
                                                    imageUrl:
                                                        "$baseImageUrl/${po?.id}.png",
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
                                        ),
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
                          onPressed: () {
                            context.read<AuthChangeCubit>().signOut();
                          })).child,
                    ],
                  ),
                ),
              ),
            ),
          );
        });
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

  Widget buildListBuilder(List<Area> areas) {
    return MasonryGridView.count(
        itemCount: areas.length,
        crossAxisCount: 3,
        mainAxisSpacing: defaultPadding / 4,
        crossAxisSpacing: defaultPadding / 4,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var area = areas[index];
          return buildListAreaCard(
            area,
            index,
            onTap: (area) {
              Logger.d("area url ${area.url}");
              context.go('/pokemons', extra: area.url as String);
            },
          );
        });
  }

  Widget buildListAreaCard(Area area, int index, {Function(Area area)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(area);
        }
        Logger.d("pokemon clicked");
      },
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            height: (index % 3 + 1) * 80,
            padding: const EdgeInsets.all(4),
            decoration: BoxDecoration(
              color: Color((((index % 5 + 1) * 30) * 0xFFFF00).toInt())
                  .withOpacity(0.5),
              borderRadius: BorderRadius.circular(10),
            ),
            alignment: Alignment.center,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Text(
              area.name ?? "",
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
