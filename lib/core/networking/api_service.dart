import 'package:dio/dio.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: 'http/api')
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST('/login')
  Future<LoginRequestBody> login(@Body() LoginRequestBody loginRequestBody);
}
