import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/features/authentication/domain/entities/member.dart';
import 'package:pokemon/src/features/pokemon/presentation/cubit/pokeball_gift_cubit.dart';
import 'package:pokemon/src/injectable_service.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/features/area/domain/entities/area.dart';
import 'package:pokemon/src/features/area/presentation/cubit/area_cubit.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';

class AreaScreen extends StatefulWidget {
  const AreaScreen({super.key});

  static Widget create() {
    return BlocProvider.value(
      value: getIt<AreaCubit>(),
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
    WidgetsBinding.instance.addPostFrameCallback((event) {
      context.read<AreaCubit>().loadArea();
    });

    super.initState();
  }

  addMember() {
    final auth = context.read<AuthChangeCubit>();
    auth.addMember(auth.state?.email ?? "");
  }

  initTimer() async {
    final member = context.read<AuthChangeCubit>().state;
    Logger.d("init timer $member");
    context.read<PokeballGiftCubit>().pokeballGiftListen(
          email: member?.email,
          loginAt: member?.loginAt,
        );
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AreaCubit, AreaState>(
          listener: (context, state) {
            Logger.d("state //${state.state}");
            if (state.state == LoadState.loading) {
              showLoadingDialog(context);
            } else {
              if (context.canPop()) {
                context.pop();
              }
            }
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
        appBar: AppBar(
          title: BlocBuilder<AuthChangeCubit, Member?>(
            builder: (context, state) {
              return Text("Pokemon Browser ${state?.pokeball}");
            },
          ),
          actions: [
            TextButton(
                onPressed: () {
                  context.read<AuthChangeCubit>().signOut();
                },
                child: const Text("SIGNOUT"))
          ],
        ),
        body: BlocBuilder<AreaCubit, AreaState>(builder: (context, snapshot) {
          return switch (snapshot.state) {
            LoadState.failed => Center(
                child: Text(snapshot.errorMessage ?? ""),
              ),
            LoadState.success => buildListBuilder(snapshot.areas ?? []),
            // ListView.builder(
            //     itemCount: snapshot.areas?.length,
            //     itemBuilder: (context, index) =>
            // buildListAreaCard(
            //   snapshot.areas![index],
            //   onTap: (area) {
            //     Logger.d("goes to ${area.url}");
            //     context.go('/pokemons', extra: area.url as String);
            //   },
            // ),
            //),
            _ => const SizedBox.shrink()
          };
        }),
      ),
    );
  }

  Widget buildListBuilder(List<Area> areas) {
    return GridView.count(
      crossAxisCount: 2,
      crossAxisSpacing: defaultPadding,
      mainAxisSpacing: defaultPadding,
      padding: const EdgeInsets.symmetric(
        horizontal: defaultPadding,
      ),
      childAspectRatio: 1.7,
      children: areas
          .map((area) => buildListAreaCard(
                area,
                onTap: (area) {
                  Logger.d("goes to ${area.url}");
                  context.go('/pokemons', extra: area.url as String);
                },
              ))
          .toList(),
    );
    // return StaggeredGridView.countBuilder(
    //   crossAxisCount: 4,
    //   itemCount: 30,
    //   itemBuilder: (context, index) {
    //     return ClipRRect(
    //       borderRadius: BorderRadius.circular(8),
    //       child: const ImageNetworkWrapper(
    //           imageUrl:
    //               "https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/2.png"),
    //     );
    //   },
    //   staggeredTileBuilder: (index) {
    //     return const StaggeredTile.count(2, 3);
    //   },
    //   mainAxisSpacing: defaultPadding / 2,
    //   crossAxisSpacing: defaultPadding / 2,
    // );
  }

  Widget buildListAreaCard(Area area, {Function(Area area)? onTap}) {
    return InkWell(
      onTap: () {
        if (onTap != null) {
          onTap(area);
        }
      },
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: const Color.fromARGB(255, 42, 42, 38),
            border: Border.all(
              color: const Color.fromARGB(255, 188, 214, 236),
              width: 0.8,
            )),
        padding: const EdgeInsets.symmetric(horizontal: defaultPadding / 4),
        alignment: Alignment.center,
        child: Text(
          "${area.name}",
          style: const TextStyle(
            color: Colors.white,
            fontSize: 18,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
    // return ListTile(
    //   title: Text(area.name ?? ""),
    //   onTap: () {
    //     if (onTap != null) {
    //       onTap(area);
    //     }
    //   },
    // );
  }
}
