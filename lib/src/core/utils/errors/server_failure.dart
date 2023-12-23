import 'package:pokdmon/src/core/utils/errors/failure.dart';

class ServerFailure extends Failure {
  ServerFailure({required String errorMessage})
      : super(errorMessage: errorMessage);
}
