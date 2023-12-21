import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

abstract class Failure extends Equatable  {
  final String errorMessage;
  const Failure(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}
class ServerFailure extends Failure {
  const ServerFailure(super.errorMessage);
  factory ServerFailure.fromDioError(DioException dioException) {
    switch(dioException.type) {
      case DioExceptionType.connectionTimeout:
        return const ServerFailure("Connection Timeout With Api Server");
      case DioExceptionType.sendTimeout:
        return const ServerFailure("Send Timeout With Api Server");
      case DioExceptionType.receiveTimeout:
        return const ServerFailure("Receive Timeout With Api Server");
      case DioExceptionType.badCertificate:
        return const ServerFailure("Connection Timeout With Api Server");
        // I return string message because api not return failure response
      case DioExceptionType.badResponse:
        return const ServerFailure("Plase check email or Password");
      case DioExceptionType.cancel:
        return const ServerFailure("Request was canceled");
      case DioExceptionType.connectionError:
        return const ServerFailure("Connection error, Please check your internet connection");
      case DioExceptionType.unknown:
        return const ServerFailure('Opps there was an error, Please try later!');
    }
  }
}