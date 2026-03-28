import 'package:eps_pay/core/networking/api_result.dart';
import 'package:eps_pay/features/bills_payment/data/model/bill_payment_response.dart';
import 'package:eps_pay/features/bills_payment/data/repository/bills_payment_repo.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/bills_and_payment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsAndPaymentCubit extends Cubit<BillsAndPaymentState> {
  final BillPaymentRepo _billPaymentRepo;
  BillsAndPaymentCubit(this._billPaymentRepo)
    : super(const BillsAndPaymentState.initial());

  late List<BillPaymentResponse> myBills;

  void emitBillsAndPaymentState() async {
    emit(BillsAndPaymentState.loading());
    final response = await _billPaymentRepo.getBillsAndPayments();

    response.when(
      success: (billsAndPaymentResponse) {
        print("============  response  =================");
        emit(BillsAndPaymentState.success(billsAndPaymentResponse));
        myBills = billsAndPaymentResponse;
        print("=============================");
        print(billsAndPaymentResponse.first.transactionType);
        print("=============================");
      },
      failure: (failure) {
        emit(BillsAndPaymentState.error(message: failure.toString()));
      },
    );
  }
}
