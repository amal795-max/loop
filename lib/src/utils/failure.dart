import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable {
  final String message;
  final dynamic error;
  final int? code;

  const Failure(this.message, {this.error, this.code});

  @override
  List<Object?> get props => [message, error, code];

  @override
  String toString() => message;
}

class ServerFailure extends Failure {
  const ServerFailure(super.message, {super.error, super.code});
}

class CacheFailure extends Failure {
  const CacheFailure(super.message, {super.error, super.code});
}

class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.error, super.code});
}

class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.error, super.code});
}
