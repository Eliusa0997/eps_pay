import 'package:dio/dio.dart';
import 'package:eps_pay/core/networking/api_constant.dart';
import 'package:eps_pay/features/auth/login/data/model/login_request_body.dart';
import 'package:eps_pay/features/auth/login/data/model/login_response.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_request_body.dart';
import 'package:eps_pay/features/auth/siginup/data/model/signup_response.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_request_body.dart';
import 'package:eps_pay/features/bills_payment/data/model/bills_response.dart';
import 'package:eps_pay/features/home_dashboard/data/model/profile_model.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/reciver_response.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_request_body.dart';
import 'package:eps_pay/features/transfer/data/model/transfer_response.dart';
import 'package:retrofit/retrofit.dart';

import '../../features/home_dashboard/data/model/transactions_history_model.dart';
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
  @POST(ApiConstant.transfer)
  Future<TransferRespone> transfer(
    @Body() TransferRequestBody transferRequestBody,
  );
  // Deposit
  @POST(ApiConstant.deposit)
  Future<TransferRespone> deposit(
    @Body() TransferRequestBody transferRequestBody,
  );

  // Withdraw
  @POST(ApiConstant.withdraw)
  Future<TransferRespone> withdraw(
    @Body() TransferRequestBody transferRequestBody,
  );

  // Electricity
  @POST(ApiConstant.electricity)
  Future<BillsResponse> electricity(@Body() BillsRequestBody billsRequestBody);

  // Water
  @POST(ApiConstant.water)
  Future<BillsResponse> water(@Body() BillsRequestBody billsRequestBody);

  // Internet
  @POST(ApiConstant.internet)
  Future<BillsResponse> internet(@Body() BillsRequestBody billsRequestBody);

  // Mobile Recharge
  @POST(ApiConstant.mobileRecharge)
  Future<BillsResponse> mobileRecharge(
    @Body() BillsRequestBody billsRequestBody,
  );

  // Transactions History
  @GET(ApiConstant.transactionsHistory)
  Future<List<TransactionHistoryModel>> getTransactionsHistory();

  @POST(ApiConstant.getReciverData)
  Future<ReciverResponse> getReciver(
    @Body() ReciverRequestBody reciverRequestBody,
  );

  // Home
  @GET(ApiConstant.getProfileData)
  Future<ProfileModel> getProfileData();
}
