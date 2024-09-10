import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pokemon/src/core/constants/constants.dart';
import 'package:pokemon/src/core/enums/enums.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/widgets/app_background.dart';
import 'package:pokemon/src/core/widgets/dialog_widget.dart';
import 'package:pokemon/src/features/authentication/presentation/cubit/auth_change_cubit.dart';
import 'package:pokemon/src/features/pokemon/presentation/components/pokemon_view_component.dart';
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
        ),
        BlocProvider.value(
          value: getIt<CatchPokemonCubit>(),
        ),
      ],
      child: const PokemonScreen(),
    );
  }

  @override
  State<PokemonScreen> createState() => _PokemonScreenState();
}

class _PokemonScreenState extends State<PokemonScreen> {
  showToast(String message) async {
    Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.TOP,
        backgroundColor: const Color.fromARGB(255, 165, 31, 21),
        textColor: Colors.white,
        fontSize: 16.0);
  }

  @override
  void dispose() {
    Fluttertoast.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<CatchPokemonCubit, CatchPokemonState>(
      listener: (context, state) {
        if (state.catchState == LoadState.loading) {
          showLoadingDialog(context);
        }
        if (state.catchState == LoadState.success) {
          context.pop();
          context.read<AuthChangeCubit>().loadMember();
          showToast(
              "Pokemon ${(state.pokemon?.name ?? "").toUpperCase()} caught.");
        }
        if (state.catchState == LoadState.failed) {
          context.pop();
          showErrorDialog(context,
              title: "Failed",
              message: state.errorMessage ?? "Catch pokemon failed.");
        }
      },
      child: Scaffold(
        body: Stack(
          children: [
            const AppBackground(assetImage: "assets/images/area-bg.jpg"),
            SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _buildBackButton(context),
                  const Flexible(
                      fit: FlexFit.tight,
                      flex: 4,
                      child: PokemonViewComponent()),
                  Flexible(flex: 1, fit: FlexFit.tight, child: _buildPokeball())
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPokeball() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        DragTarget<Widget>(
          builder: (context, candidateData, rejectedData) {
            return candidateData.isNotEmpty
                ? Center(
                    child: Lottie.asset(
                        "assets/lotties/pokeball-animation.json",
                        width: 60,
                        height: 60),
                  )
                : Center(
                    child: Image.asset(
                      "assets/images/pokegift.png",
                      width: 60,
                      height: 60,
                    ),
                  );
          },
        )
      ],
      // color: Colors.amber,
    );
  }

  InkWell _buildBackButton(BuildContext context) {
    return InkWell(
      onTap: () {
        Logger.d("back");
        context.pop();
      },
      child: Container(
        margin: const EdgeInsets.symmetric(
          horizontal: defaultPadding / 2,
          vertical: defaultPadding / 2,
        ),
        decoration: BoxDecoration(
          color: Colors.black45,
          borderRadius: BorderRadius.circular(6),
        ),
        padding: const EdgeInsets.all(8),
        child: const Icon(
          Icons.close_rounded,
          color: Colors.white,
        ),
      ),
    );
  }
}
