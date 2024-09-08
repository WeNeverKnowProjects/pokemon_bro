import 'package:pokemon/src/core/failure/failure.dart';

(Failure?, T) getItems<T>(T response) {
  return (null, response);
}

(Failure?, T?) getError<T>(Failure error) {
  return (error, null);
}
