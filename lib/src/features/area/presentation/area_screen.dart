import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/widgets/app_background.dart';
import 'package:pokemon/src/features/area/presentation/components/area_header_component.dart';
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
                      return state == null
                          ? const SizedBox.shrink()
                          : AreaHeaderComponent(member: state);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
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
