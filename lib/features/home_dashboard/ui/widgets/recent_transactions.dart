// import 'package:eps_pay/core/theming/colors.dart';
// import 'package:flutter/material.dart';

// class RecentTransactions extends StatelessWidget {
//   const RecentTransactions({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return                  
//      SliverToBoxAdapter(
//                     child: Padding(
//                       padding: const EdgeInsets.symmetric(horizontal: 24),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           const Text(
//                             'Recent Transactions',
//                             style: TextStyle(
//                               fontSize: 18,
//                               fontWeight: FontWeight.bold,
//                               color: AppColors.textPrimary,
//                             ),
//                           ),
//                           TextButton(
//                             onPressed: () {
//                               Navigator.pushNamed(context, '/transactions');
//                             },
//                             child: const Text('See All'),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                   SliverPadding(
//                     padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
//                     sliver: SliverList(
//                       delegate: SliverChildBuilderDelegate((context, index) {
//                         final transaction = _recentTransactions[index];
//                         return Container(
//                           margin: const EdgeInsets.only(bottom: 12),
//                           padding: const EdgeInsets.all(16),
//                           decoration: BoxDecoration(
//                             color: Colors.white,
//                             borderRadius: BorderRadius.circular(12),
//                             border: Border.all(color: AppColors.border),
//                           ),
//                           child: Row(
//                             children: [
//                               Container(
//                                 width: 40,
//                                 height: 40,
//                                 decoration: BoxDecoration(
//                                   color: transaction.isReceived
//                                       ? AppColors.success.withOpacity(0.1)
//                                       : AppColors.error.withOpacity(0.1),
//                                   shape: BoxShape.circle,
//                                 ),
//                                 child: Icon(
//                                   transaction.isReceived
//                                       ? Icons.arrow_downward
//                                       : Icons.arrow_upward,
//                                   color: transaction.isReceived
//                                       ? AppColors.success
//                                       : AppColors.error,
//                                   size: 20,
//                                 ),
//                               ),
//                               const SizedBox(width: 12),
//                               Expanded(
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       transaction.recipient,
//                                       style: const TextStyle(
//                                         fontSize: 14,
//                                         fontWeight: FontWeight.w600,
//                                         color: AppColors.textPrimary,
//                                       ),
//                                     ),
//                                     const SizedBox(height: 2),
//                                     Text(
//                                       '${_formatDate(transaction.date)}, ${transaction.time}',
//                                       style: const TextStyle(
//                                         fontSize: 12,
//                                         color: AppColors.textSecondary,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                               Column(
//                                 crossAxisAlignment: CrossAxisAlignment.end,
//                                 children: [
//                                   Text(
//                                     '${transaction.isReceived ? '+' : '-'}${transaction.amount.toStringAsFixed(2)} SDG',
//                                     style: TextStyle(
//                                       fontSize: 14,
//                                       fontWeight: FontWeight.bold,
//                                       color: transaction.isReceived
//                                           ? AppColors.success
//                                           : AppColors.textPrimary,
//                                     ),
//                                   ),
//                                   const SizedBox(height: 2),
//                                   Text(
//                                     transaction.category,
//                                     style: const TextStyle(
//                                       fontSize: 12,
//                                       color: AppColors.textSecondary,
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         );
//                       }, childCount: _recentTransactions.length),
//                     ),
//                   ),
//                 ],
//               );
//   }
// }