import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/features/area/domain/entities/area.dart';

abstract class AreaRepository {
  Future<(Failure?, List<Area>?)> fetchAreas();
}
