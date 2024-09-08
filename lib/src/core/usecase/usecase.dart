import 'package:equatable/equatable.dart';
import 'package:pokemon/src/core/failure/failure.dart';

abstract class Usecase<Type, Params> {
  Future<(Failure?, Type?)> call(Params params);
}

class NoParam extends Equatable {
  @override
  // TODO: implement props
  List<Object?> get props => [];
}
