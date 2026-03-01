import 'package:dio/dio.dart';
import 'package:eps_pay/core/networking/api_constant.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/login_response.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_request_body.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_response.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_response.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_response.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstant.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  // Auth
  @POST(ApiConstant.login)
  Future<LoginResponse> login(@Body() LoginRequestBody loginRequestBody);
  @POST(ApiConstant.signup)
  Future<SignupResponse> signup(@Body() SignupRequestBody signupRequestBody);

  // Transfer
  @POST(ApiConstant.Transfer)
  Future<TransferRespone> transfer(
    @Body() TransferRequestBody transferRequestBody,
  );
  @GET(ApiConstant.getReciverData)
  Future<ReciverResponse> getReciverData(
    @Body() ReciverRequestBody reciverRequestBody,
  );

  // Home
  @GET(ApiConstant.getProfileData)
  Future<ProfileModel> getProfileData();
}
