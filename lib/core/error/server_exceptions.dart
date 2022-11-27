import 'package:movies_app/core/error/failure.dart';

import '../network/error_message_model.dart';

class ServerException implements Exception {
  final ErrorMessageModel errorMessageModel;
  const ServerException({required this.errorMessageModel});
}

class ServerFailure extends Failure {
  const ServerFailure(super.message);
  }