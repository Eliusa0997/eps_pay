import 'package:eps_pay/core/helpers/extensions.dart';
import 'package:eps_pay/core/routing/routes.dart';
import 'package:eps_pay/core/theming/app_fonts.dart';
import 'package:eps_pay/core/theming/colors.dart';
import 'package:eps_pay/features/bills_payment/data/model/bill_payment_response.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/bills_and_payment_cubit.dart';
import 'package:eps_pay/features/bills_payment/logic/cubit/bills_and_payment_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecentBills extends StatelessWidget {
  late List<BillPaymentResponse> bills;
  RecentBills({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BillsAndPaymentCubit, BillsAndPaymentState>(
      builder: (context, state) {
        if (state is Loading) {
          return Center(child: CircularProgressIndicator());
        }
        if (state is Success) {
          bills = context.read<BillsAndPaymentCubit>().myBills;
          return SliverPadding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate((context, index) {
                final bill = bills[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.border),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 8,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              // Container(
                              //   width: 40,
                              //   height: 40,
                              //   decoration: BoxDecoration(
                              //     // color: bill['bgColor'] as Color,
                              //     shape: BoxShape.circle,
                              //   ),
                              //   child: Icon(
                              //     bill.transactionType == "water"
                              //         ? Icons.water_drop
                              //         : Icons.wifi,
                              //     size: 20,
                              //     // color: bill['iconColor'] as Color,
                              //   ),
                              // ),
                              const SizedBox(width: 12),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    bill.transactionType,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w600,
                                      color: AppColors.textPrimary,
                                    ),
                                  ),
                                  const SizedBox(height: 2),
                                  Text(
                                    "10000012",
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: AppColors.textSecondary,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 6,
                            ),
                            decoration: BoxDecoration(
                              // color: (bill['statusColor'] as Color).withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Text(
                              'paid',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                // color: bill['statusColor'] as Color,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            bill.date.toString(),
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                          Text(
                            '${(bill.amount as double).toStringAsFixed(0)} SDG',
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimary,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              }, childCount: bills.length),
            ),
          );
        } else {
          return Text("error");
        }
      },
    );
  }
}
