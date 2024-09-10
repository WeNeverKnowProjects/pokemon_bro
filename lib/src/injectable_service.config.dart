// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:cloud_firestore/cloud_firestore.dart' as _i974;
import 'package:firebase_auth/firebase_auth.dart' as _i59;
import 'package:firebase_core/firebase_core.dart' as _i982;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import 'core/config/environment.dart' as _i320;
import 'core/firebase/authentication/firebase_authentication.dart' as _i1022;
import 'core/firebase/firestore/firestore_service.dart' as _i948;
import 'core/firebase/module/firebase_module.dart' as _i25;
import 'core/graphql/parser.dart' as _i603;
import 'core/request/fetch_request.dart' as _i295;
import 'core/themes/cubit/themes_cubit.dart' as _i742;
import 'features/area/data/datasource/area_datasource.dart' as _i192;
import 'features/area/data/repository/area_repository_impl.dart' as _i383;
import 'features/area/domain/repository/area_repository.dart' as _i101;
import 'features/area/domain/usecase/fetch_area_usecase.dart' as _i593;
import 'features/area/presentation/cubit/area_cubit.dart' as _i315;
import 'features/authentication/data/datasource/authentication_datasource.dart'
    as _i845;
import 'features/authentication/data/repository/authentication_repository_impl.dart'
    as _i207;
import 'features/authentication/domain/repository/authentication_repository.dart'
    as _i972;
import 'features/authentication/domain/usecase/add_member_usecase.dart'
    as _i498;
import 'features/authentication/domain/usecase/auth_state_change_member_usecase.dart'
    as _i590;
import 'features/authentication/domain/usecase/load_member_usecase.dart'
    as _i245;
import 'features/authentication/domain/usecase/login_with_email_usecase.dart'
    as _i953;
import 'features/authentication/domain/usecase/sign_out_usecase.dart' as _i211;
import 'features/authentication/domain/usecase/sign_up_usecase.dart' as _i862;
import 'features/authentication/domain/usecase/update_member_usecase.dart'
    as _i718;
import 'features/authentication/presentation/cubit/auth_change_cubit.dart'
    as _i57;
import 'features/authentication/presentation/cubit/login_cubit.dart' as _i618;
import 'features/authentication/presentation/cubit/signup_cubit.dart' as _i1;
import 'features/pokemon/data/datasource/pokemon_datasource.dart' as _i995;
import 'features/pokemon/data/repository/pokemon_repository.dart' as _i175;
import 'features/pokemon/domain/repository/pokemon_repository.dart' as _i743;
import 'features/pokemon/domain/usecase/catch_pokemon_usecase.dart' as _i686;
import 'features/pokemon/domain/usecase/fetch_pokemons_usecase.dart' as _i488;
import 'features/pokemon/presentation/cubit/catch_pokemon_cubit.dart' as _i859;
import 'features/pokemon/presentation/cubit/pokeball_gift_cubit.dart' as _i112;
import 'features/pokemon/presentation/cubit/pokemon_cubit.dart' as _i446;

extension GetItInjectableX on _i174.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i174.GetIt> init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i526.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final firebaseModule = _$FirebaseModule();
    await gh.factoryAsync<_i982.FirebaseApp>(
      () => firebaseModule.initFirebaseApp,
      preResolve: true,
    );
    gh.singleton<_i320.AppEnvironment>(() => _i320.AppEnvironment());
    gh.singleton<_i59.FirebaseAuth>(() => firebaseModule.auth);
    gh.singleton<_i974.FirebaseFirestore>(() => firebaseModule.firestore);
    gh.singleton<_i742.ThemesCubit>(() => _i742.ThemesCubit());
    gh.lazySingleton<_i112.PokeballGiftCubit>(() => _i112.PokeballGiftCubit());
    gh.singleton<_i1022.FirebaseAuthentication>(
        () => _i1022.FirebaseAuthenticationImpl(gh<_i59.FirebaseAuth>()));
    gh.singleton<_i948.FirestoreService>(
        () => _i948.FirestoreServiceImpl(gh<_i974.FirebaseFirestore>()));
    gh.factoryParam<_i603.GqlParser, String?, dynamic>((
      rootPath,
      _,
    ) =>
        _i603.GqlParser(rootPath: rootPath));
    gh.singleton<_i295.FetchRequest>(
        () => _i295.FetchRequest(gh<_i603.GqlParser>()));
    gh.lazySingleton<_i845.AuthenticationDatasource>(
        () => _i845.AuthenticationDatasourceImpl(
              gh<_i1022.FirebaseAuthentication>(),
              gh<_i948.FirestoreService>(),
            ));
    gh.lazySingleton<_i192.AreaDatasource>(
        () => _i192.AreaDatasourceImpl(gh<_i295.FetchRequest>()));
    gh.lazySingleton<_i972.AuthenticationRepository>(() =>
        _i207.AuthenticationRepositoryImpl(
            gh<_i845.AuthenticationDatasource>()));
    gh.lazySingleton<_i718.UpdateMemberUsecase>(
        () => _i718.UpdateMemberUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i498.AddMemberUsecase>(
        () => _i498.AddMemberUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i590.AuthStateChangeMemberUsecase>(() =>
        _i590.AuthStateChangeMemberUsecase(
            gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i953.LoginWithEmailUsecase>(() =>
        _i953.LoginWithEmailUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i245.LoadMemberUsecase>(
        () => _i245.LoadMemberUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i862.SignUpUsecase>(
        () => _i862.SignUpUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i211.SignOutUsecase>(
        () => _i211.SignOutUsecase(gh<_i972.AuthenticationRepository>()));
    gh.lazySingleton<_i101.AreaRepository>(
        () => _i383.AreaRepositoryImpl(gh<_i192.AreaDatasource>()));
    gh.factory<_i57.AuthChangeCubit>(() => _i57.AuthChangeCubit(
          gh<_i590.AuthStateChangeMemberUsecase>(),
          gh<_i211.SignOutUsecase>(),
          gh<_i718.UpdateMemberUsecase>(),
          gh<_i498.AddMemberUsecase>(),
          gh<_i245.LoadMemberUsecase>(),
        ));
    gh.lazySingleton<_i995.PokemonDatasource>(() => _i995.PokemonDatasourceImpl(
          gh<_i295.FetchRequest>(),
          gh<_i948.FirestoreService>(),
        ));
    gh.lazySingleton<_i743.PokemonRepository>(
        () => _i175.PokemonRepositoryImpl(gh<_i995.PokemonDatasource>()));
    gh.lazySingleton<_i488.FetchPokemonsUsecase>(
        () => _i488.FetchPokemonsUsecase(gh<_i743.PokemonRepository>()));
    gh.lazySingleton<_i686.CatchPokemonUsecase>(
        () => _i686.CatchPokemonUsecase(gh<_i743.PokemonRepository>()));
    gh.lazySingleton<_i593.FetchAreaUsecase>(
        () => _i593.FetchAreaUsecase(gh<_i101.AreaRepository>()));
    gh.lazySingleton<_i618.LoginCubit>(
        () => _i618.LoginCubit(gh<_i953.LoginWithEmailUsecase>()));
    gh.lazySingleton<_i1.SignupCubit>(
        () => _i1.SignupCubit(gh<_i862.SignUpUsecase>()));
    gh.lazySingleton<_i859.CatchPokemonCubit>(
        () => _i859.CatchPokemonCubit(gh<_i686.CatchPokemonUsecase>()));
    gh.lazySingleton<_i446.PokemonCubit>(
        () => _i446.PokemonCubit(gh<_i488.FetchPokemonsUsecase>()));
    gh.lazySingleton<_i315.AreaCubit>(
        () => _i315.AreaCubit(gh<_i593.FetchAreaUsecase>()));
    return this;
  }
}

class _$FirebaseModule extends _i25.FirebaseModule {}
