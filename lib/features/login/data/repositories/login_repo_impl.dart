import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:engas_task/core/networking/api_constants.dart';
import 'package:engas_task/core/networking/error.dart';
import 'package:engas_task/features/login/data/models/login_request_body.dart';
import 'package:engas_task/features/login/data/models/login_response.dart';
import 'package:engas_task/features/login/data/repositories/login_repo.dart';

import '../../../../core/networking/api_service.dart';

class LoginRepoImpl implements LoginRepo {
  final ApiService apiService;

  LoginRepoImpl(this.apiService);
  @override
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody loginRequestBody) async {
    try{
      final response = await apiService.post(endPoint: ApiConstants.login, data: loginRequestBody.toJson());
      return Right(LoginResponse.fromJson(response['data']));
    } on DioException catch(error) {
      return Left(ServerFailure.fromDioError(error));
    } catch(error) {
      return Left(ServerFailure(error.toString()));
    }
  }
}