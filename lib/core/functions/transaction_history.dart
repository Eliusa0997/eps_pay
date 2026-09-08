import 'package:easy_localization/easy_localization.dart';
import 'package:eps_pay/core/constant/month_names.dart';
import 'package:eps_pay/features/home_dashboard/data/model/transactions_history_response_model.dart';

Map<String, List<TransactionHistoryResponseModel>> groupByDate(
  List<TransactionHistoryResponseModel> transactions,
) {
  final Map<String, List<TransactionHistoryResponseModel>> groups = {};
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);

  for (var transaction in transactions) {
    final date = DateTime(
      transaction.date.year,
      transaction.date.month,
      transaction.date.day,
    );

    String label;
    if (date == today) {
      label = 'Today';
    } else if (date == yesterday) {
      label = 'Yesterday';
    } else {
      label =
          '${monthNames(transaction.date.month)} ${transaction.date.day}, ${transaction.date.year}';
    }

    if (!groups.containsKey(label)) {
      groups[label] = [];
    }
    groups[label]!.add(transaction);
  }

  return groups;
}

String formatDate(DateTime date) {
  final now = DateTime.now();
  final today = DateTime(now.year, now.month, now.day);
  final yesterday = DateTime(now.year, now.month, now.day - 1);
  final dateToCheck = DateTime(date.year, date.month, date.day);
  if (dateToCheck == now) return 'Now'.tr();
  if (dateToCheck == today) return 'Today'.tr();
  if (dateToCheck == yesterday) return 'Yesterday'.tr();
  return '${date.month}/${date.day}/${date.year}';
}
