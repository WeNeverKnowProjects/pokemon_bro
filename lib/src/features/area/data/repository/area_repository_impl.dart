import 'package:injectable/injectable.dart';
import 'package:pokemon/src/core/exceptions/exceptions.dart';
import 'package:pokemon/src/core/failure/failure.dart';
import 'package:pokemon/src/core/log/logger.dart';
import 'package:pokemon/src/core/mapper/record_mapper.dart';
import 'package:pokemon/src/features/area/data/datasource/area_datasource.dart';

import 'package:pokemon/src/features/area/domain/entities/area.dart';

import '../../domain/repository/area_repository.dart';

@LazySingleton(as: AreaRepository)
class AreaRepositoryImpl implements AreaRepository {
  final AreaDatasource datasource;
  AreaRepositoryImpl(this.datasource);
  @override
  Future<(Failure?, List<Area>?)> fetchAreas() async {
    try {
      final items = await datasource.getAreas();

      List<Area>? areas;
      if (items != null) {
        Logger.d("items $items");
        areas = items.map((e) => Area.fromJson(e)).toList();
      }
      Logger.d("areas ${areas?.length} $areas");
      return getItems<List<Area>?>(areas);
    } on UnsupportedFormatException catch (e) {
      return getError(FetchFailure(e.message));
    } on FetchException catch (e) {
      return getError(FetchFailure(e.message));
    }
  }
}
