import 'package:dartz/dartz.dart';
import 'package:engas_task/features/login/data/models/login_request_body.dart';
import 'package:engas_task/features/login/data/models/login_response.dart';

import '../../../../core/networking/error.dart';

abstract class LoginRepo{
  Future<Either<Failure, LoginResponse>> login(LoginRequestBody loginRequestBody);
}