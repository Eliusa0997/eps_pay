import 'package:eps_pay/core/theming/colors.dart';
import 'package:flutter/material.dart';

class RecentTransactionsHistoryHeader extends StatefulWidget {
  TextEditingController searchController = TextEditingController();
  RecentTransactionsHistoryHeader({super.key, required this.searchController});

  @override
  State<RecentTransactionsHistoryHeader> createState() =>
      _RecentTransactionsHistoryHeaderState();
}

class _RecentTransactionsHistoryHeaderState
    extends State<RecentTransactionsHistoryHeader> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: AppColors.primaryGradient,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(32),
          bottomRight: Radius.circular(32),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 24, 24, 24),
        child: Column(
          children: [
            Row(
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
                  'Transaction History',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.calendar_today),
                  color: Colors.white,
                  style: IconButton.styleFrom(
                    backgroundColor: Colors.white.withOpacity(0.1),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 24),
            // Search
            TextField(
              controller: widget.searchController,
              onChanged: (value) => setState(() {}),
              decoration: InputDecoration(
                hintText: 'Search transactions...',
                prefixIcon: const Icon(Icons.search),
                filled: true,
                fillColor: Colors.white,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
