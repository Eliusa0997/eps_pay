import 'package:eps_pay/features/bills_payment/data/model/bill_payment_response.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/bills_and_payment_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/bills_and_payment_state.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/bills_payment_header.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/categories_grid_section.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/recent_bills_list_section.dart';
import 'package:eps_pay/features/bills_payment/ui/widgets/recent_bills_title_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BillsPaymentsScreen extends StatelessWidget {
  const BillsPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<BillsAndPaymentCubit, BillsAndPaymentState>(
          builder: (context, state) {
            if (state is Loading) {
              return Center(child: CircularProgressIndicator());
            }
            if (state is Success) {
              late List<BillPaymentResponse> bills = context
                  .read<BillsAndPaymentCubit>()
                  .myBills;
              return CustomScrollView(
                slivers: [
                  // Header Section
                  BillsPaymentHeader(),

                  // Categories Grid Section
                  CategoriesGridSection(),

                  // Recent Bills Title Section
                  RecentBillsTitleSection(),
                  // Recent Bills List Section
                  RecentBillsListSection(bills: bills),
                ],
              );
            } else {
              return Text("error");
            }
          },
        ),
      ),
    );
  }
}
