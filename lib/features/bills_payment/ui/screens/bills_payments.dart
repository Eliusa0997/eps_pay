import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class BillsPaymentsScreen extends StatelessWidget {
  const BillsPaymentsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final categories = [
      {
        'icon': Icons.flash_on,
        'label': 'Electricity',
        'color': const LinearGradient(
          colors: [Color(0xFFFBBF24), Color(0xFFF59E0B)],
        ),
        'providers': 2,
      },
      {
        'icon': Icons.water_drop,
        'label': 'Water',
        'color': const LinearGradient(
          colors: [Color(0xFF60A5FA), Color(0xFF3B82F6)],
        ),
        'providers': 2,
      },
      {
        'icon': Icons.wifi,
        'label': 'Internet',
        'color': const LinearGradient(
          colors: [Color(0xFFA78BFA), Color(0xFF8B5CF6)],
        ),
        'providers': 3,
      },
      {
        'icon': Icons.smartphone,
        'label': 'Mobile Recharge',
        'color': const LinearGradient(
          colors: [Color(0xFF34D399), Color(0xFF10B981)],
        ),
        'providers': 3,
      },
      {
        'icon': Icons.description,
        'label': 'Government',
        'color': const LinearGradient(
          colors: [Color(0xFFF87171), Color(0xFFEF4444)],
        ),
        'providers': 3,
      },
      {
        'icon': Icons.business,
        'label': 'Other Services',
        'color': const LinearGradient(
          colors: [Color(0xFF9CA3AF), Color(0xFF6B7280)],
        ),
        'providers': 3,
      },
    ];

    final recentBills = [
      {
        'icon': Icons.flash_on,
        'label': 'Electricity Bill',
        'account': 'Account: 123456789',
        'status': 'Paid',
        'statusColor': AppColors.success,
        'date': 'Last payment: Feb 5, 2026',
        'amount': 250.00,
        'bgColor': const Color(0xFFFEF3C7),
        'iconColor': const Color(0xFFF59E0B),
      },
      {
        'icon': Icons.water_drop,
        'label': 'Water Bill',
        'account': 'Account: 987654321',
        'status': 'Pending',
        'statusColor': AppColors.warning,
        'date': 'Due: Feb 15, 2026',
        'amount': 180.00,
        'bgColor': const Color(0xFFDEEDFF),
        'iconColor': const Color(0xFF3B82F6),
      },
      {
        'icon': Icons.wifi,
        'label': 'Internet Bill',
        'account': 'Sudatel Fiber',
        'status': 'Paid',
        'statusColor': AppColors.success,
        'date': 'Last payment: Feb 1, 2026',
        'amount': 350.00,
        'bgColor': const Color(0xFFEDE9FE),
        'iconColor': const Color(0xFF8B5CF6),
      },
    ];

    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            // Header
            SliverToBoxAdapter(
              child: Container(
                decoration: const BoxDecoration(
                  gradient: AppColors.primaryGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(32),
                    bottomRight: Radius.circular(32),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(24, 24, 24, 32),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(Icons.arrow_back),
                        color: Colors.white,
                        style: IconButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.1),
                        ),
                      ),
                      const Text(
                        'Bills & Payments',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 40),
                    ],
                  ),
                ),
              ),
            ),

            // Categories Grid
            SliverPadding(
              padding: const EdgeInsets.all(24),
              sliver: SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                ),
                delegate: SliverChildBuilderDelegate((context, index) {
                  final category = categories[index];
                  return InkWell(
                    onTap: () {},
                    borderRadius: BorderRadius.circular(16),
                    child: Container(
                      padding: const EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
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
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 64,
                            height: 64,
                            decoration: BoxDecoration(
                              gradient: category['color'] as LinearGradient,
                              borderRadius: BorderRadius.circular(16),
                              boxShadow: [
                                BoxShadow(
                                  color: (category['color'] as LinearGradient)
                                      .colors
                                      .first
                                      .withOpacity(0.3),
                                  blurRadius: 8,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: Icon(
                              category['icon'] as IconData,
                              size: 32,
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            category['label'] as String,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.textPrimary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '${category['providers']} providers',
                            style: const TextStyle(
                              fontSize: 12,
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }, childCount: categories.length),
              ),
            ),

            // Recent Bills
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Bills',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimary,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],
                ),
              ),
            ),

            SliverPadding(
              padding: const EdgeInsets.fromLTRB(24, 0, 24, 24),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate((context, index) {
                  final bill = recentBills[index];
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
                                Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: bill['bgColor'] as Color,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    bill['icon'] as IconData,
                                    size: 20,
                                    color: bill['iconColor'] as Color,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      bill['label'] as String,
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w600,
                                        color: AppColors.textPrimary,
                                      ),
                                    ),
                                    const SizedBox(height: 2),
                                    Text(
                                      bill['account'] as String,
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
                                color: (bill['statusColor'] as Color)
                                    .withOpacity(0.1),
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Text(
                                bill['status'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w600,
                                  color: bill['statusColor'] as Color,
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
                              bill['date'] as String,
                              style: const TextStyle(
                                fontSize: 12,
                                color: AppColors.textSecondary,
                              ),
                            ),
                            Text(
                              '${(bill['amount'] as double).toStringAsFixed(0)} SDG',
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
                }, childCount: recentBills.length),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
