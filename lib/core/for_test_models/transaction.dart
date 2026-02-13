class Transaction {
  final String id;
  final String type; // 'sent' or 'received'
  final String recipient;
  final double amount;
  final DateTime date;
  final String time;
  final String category;
  final String status;

  Transaction({
    required this.id,
    required this.type,
    required this.recipient,
    required this.amount,
    required this.date,
    required this.time,
    required this.category,
    required this.status,
  });

  bool get isSent => type == 'sent';
  bool get isReceived => type == 'received';
  bool get isCompleted => status == 'completed';
}
