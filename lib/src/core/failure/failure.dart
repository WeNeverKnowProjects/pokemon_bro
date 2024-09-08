abstract class Failure {
  final String message;
  Failure(this.message);
}

class FetchFailure extends Failure {
  FetchFailure(super.message);
}

class SubmitFailure extends Failure {
  SubmitFailure(super.message);
}
