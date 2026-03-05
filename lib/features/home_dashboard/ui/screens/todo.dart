// Column(
//           children: [
//             // Header
//             Container(
//               decoration: const BoxDecoration(
//                 gradient: AppColors.primaryGradient,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(32),
//                   bottomRight: Radius.circular(32),
//                 ),
//               ),
//               child: Padding(
//                 padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
//                 child: Column(
//                   children: [
//                     Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       children: [
//                         IconButton(
//                           onPressed: () => Navigator.pop(context),
//                           icon: const Icon(Icons.arrow_back),
//                           color: Colors.white,
//                           style: IconButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.1),
//                           ),
//                         ),
//                         const Text(
//                           'Transaction History',
//                           style: TextStyle(
//                             fontSize: 20,
//                             fontWeight: FontWeight.bold,
//                             color: Colors.white,
//                           ),
//                         ),
//                         IconButton(
//                           onPressed: () {},
//                           icon: const Icon(Icons.calendar_today),
//                           color: Colors.white,
//                           style: IconButton.styleFrom(
//                             backgroundColor: Colors.white.withOpacity(0.1),
//                           ),
//                         ),
//                       ],
//                     ),
//                     const SizedBox(height: 24),
//                     // Search
//                     TextField(
//                       controller: _searchController,
//                       onChanged: (value) => setState(() {}),
//                       decoration: InputDecoration(
//                         hintText: 'Search transactions...',
//                         prefixIcon: const Icon(Icons.search),
//                         filled: true,
//                         fillColor: Colors.white,
//                         border: OutlineInputBorder(
//                           borderRadius: BorderRadius.circular(12),
//                           borderSide: BorderSide.none,
//                         ),
//                         contentPadding: const EdgeInsets.symmetric(
//                           horizontal: 16,
//                           vertical: 16,
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),

//             // Filters
//             Padding(
//               padding: const EdgeInsets.all(16),
//               child: SingleChildScrollView(
//                 scrollDirection: Axis.horizontal,
//                 child: Row(
//                   children: [
//                     const Icon(
//                       Icons.filter_list,
//                       color: AppColors.textSecondary,
//                       size: 20,
//                     ),
//                     const SizedBox(width: 12),
//                     _buildFilterChip('All', 'all'),
//                     const SizedBox(width: 8),
//                     _buildFilterChip('Sent', 'sent'),
//                     const SizedBox(width: 8),
//                     _buildFilterChip('Received', 'received'),
//                     const SizedBox(width: 8),
//                     _buildFilterChip('Bills', 'bills'),
//                   ],
//                 ),
//               ),
//             ),

//             // Transactions List
//             Expanded(
//               child: groupedTransactions.isEmpty
//                   ? Center(
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             width: 64,
//                             height: 64,
//                             decoration: BoxDecoration(
//                               color: AppColors.background,
//                               shape: BoxShape.circle,
//                             ),
//                             child: const Icon(
//                               Icons.search,
//                               size: 32,
//                               color: AppColors.textSecondary,
//                             ),
//                           ),
//                           const SizedBox(height: 16),
//                           const Text(
//                             'No transactions found',
//                             style: TextStyle(
//                               fontSize: 16,
//                               fontWeight: FontWeight.w600,
//                               color: AppColors.textSecondary,
//                             ),
//                           ),
//                           const SizedBox(height: 8),
//                           const Text(
//                             'Try adjusting your search or filters',
//                             style: TextStyle(
//                               fontSize: 14,
//                               color: AppColors.textTertiary,
//                             ),
//                           ),
//                         ],
//                       ),
//                     )
//                   : ListView.builder(
//                       padding: const EdgeInsets.fromLTRB(24, 8, 24, 24),
//                       itemCount: groupedTransactions.length,
//                       itemBuilder: (context, index) {
//                         final dateLabel = groupedTransactions.keys.elementAt(
//                           index,
//                         );
//                         final transactions = groupedTransactions[dateLabel]!;

//                         return Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(
//                                 left: 8,
//                                 bottom: 12,
//                                 top: 12,
//                               ),
//                               child: Text(
//                                 dateLabel,
//                                 style: const TextStyle(
//                                   fontSize: 14,
//                                   fontWeight: FontWeight.w600,
//                                   color: AppColors.textSecondary,
//                                 ),
//                               ),
//                             ),
//                             ...transactions.map((transaction) {
//                               return Container(
//                                 margin: const EdgeInsets.only(bottom: 8),
//                                 padding: const EdgeInsets.all(16),
//                                 decoration: BoxDecoration(
//                                   color: Colors.white,
//                                   borderRadius: BorderRadius.circular(12),
//                                   border: Border.all(color: AppColors.border),
//                                 ),
//                                 child: Column(
//                                   children: [
//                                     Row(
//                                       children: [
//                                         Container(
//                                           width: 40,
//                                           height: 40,
//                                           decoration: BoxDecoration(
//                                             color: transaction.isReceived
//                                                 ? AppColors.success.withOpacity(
//                                                     0.1,
//                                                   )
//                                                 : AppColors.error.withOpacity(
//                                                     0.1,
//                                                   ),
//                                             shape: BoxShape.circle,
//                                           ),
//                                           child: Icon(
//                                             transaction.isReceived
//                                                 ? Icons.arrow_downward
//                                                 : Icons.arrow_upward,
//                                             color: transaction.isReceived
//                                                 ? AppColors.success
//                                                 : AppColors.error,
//                                             size: 20,
//                                           ),
//                                         ),
//                                         const SizedBox(width: 12),
//                                         Expanded(
//                                           child: Column(
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.start,
//                                             children: [
//                                               Text(
//                                                 transaction.recipient,
//                                                 style: const TextStyle(
//                                                   fontSize: 14,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: AppColors.textPrimary,
//                                                 ),
//                                                 maxLines: 1,
//                                                 overflow: TextOverflow.ellipsis,
//                                               ),
//                                               const SizedBox(height: 4),
//                                               Row(
//                                                 children: [
//                                                   Text(
//                                                     transaction.time,
//                                                     style: const TextStyle(
//                                                       fontSize: 12,
//                                                       color: AppColors
//                                                           .textSecondary,
//                                                     ),
//                                                   ),
//                                                   const SizedBox(width: 8),
//                                                   Container(
//                                                     width: 4,
//                                                     height: 4,
//                                                     decoration:
//                                                         const BoxDecoration(
//                                                           color: AppColors
//                                                               .textTertiary,
//                                                           shape:
//                                                               BoxShape.circle,
//                                                         ),
//                                                   ),
//                                                   const SizedBox(width: 8),
//                                                   Text(
//                                                     transaction.category,
//                                                     style: const TextStyle(
//                                                       fontSize: 12,
//                                                       color: AppColors
//                                                           .textSecondary,
//                                                     ),
//                                                   ),
//                                                 ],
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         Column(
//                                           crossAxisAlignment:
//                                               CrossAxisAlignment.end,
//                                           children: [
//                                             Text(
//                                               '${transaction.isReceived ? '+' : '-'}${transaction.amount.toStringAsFixed(2)}',
//                                               style: TextStyle(
//                                                 fontSize: 14,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: transaction.isReceived
//                                                     ? AppColors.success
//                                                     : AppColors.textPrimary,
//                                               ),
//                                             ),
//                                             const SizedBox(height: 2),
//                                             const Text(
//                                               'SDG',
//                                               style: TextStyle(
//                                                 fontSize: 12,
//                                                 color: AppColors.textSecondary,
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                     const SizedBox(height: 12),
//                                     const Divider(height: 1),
//                                     const SizedBox(height: 12),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Container(
//                                           padding: const EdgeInsets.symmetric(
//                                             horizontal: 8,
//                                             vertical: 4,
//                                           ),
//                                           decoration: BoxDecoration(
//                                             color: AppColors.success
//                                                 .withOpacity(0.1),
//                                             borderRadius: BorderRadius.circular(
//                                               6,
//                                             ),
//                                           ),
//                                           child: Row(
//                                             children: [
//                                               Icon(
//                                                 Icons.check_circle,
//                                                 size: 14,
//                                                 color: AppColors.success,
//                                               ),
//                                               const SizedBox(width: 4),
//                                               Text(
//                                                 transaction.status ==
//                                                         'completed'
//                                                     ? 'Completed'
//                                                     : transaction.status,
//                                                 style: const TextStyle(
//                                                   fontSize: 11,
//                                                   fontWeight: FontWeight.w600,
//                                                   color: AppColors.success,
//                                                 ),
//                                               ),
//                                             ],
//                                           ),
//                                         ),
//                                         TextButton(
//                                           onPressed: () {},
//                                           child: const Text(
//                                             'View Details',
//                                             style: TextStyle(
//                                               fontSize: 12,
//                                               fontWeight: FontWeight.w600,
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             }),
//                           ],
//                         );
//                       },
//                     ),
//             ),
//           ],
//         ),
