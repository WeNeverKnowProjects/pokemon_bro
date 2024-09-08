import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/usecase/usecase.dart';
import 'package:pokemon/src/features/area/domain/entities/area.dart';
import 'package:pokemon/src/features/area/domain/repository/area_repository.dart';

@lazySingleton
class FetchAreaUsecase implements Usecase<List<Area>?, NoParam> {
  final AreaRepository repository;
  FetchAreaUsecase(this.repository);

  @override
  Future<(Failure?, List<Area>?)> call(NoParam params) async {
    return repository.fetchAreas();
  }
}
