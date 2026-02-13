class Account {
  final String id;
  final String name;
  final String type;
  final String accountNumber;
  final double balance;
  final String currency;

  Account({
    required this.id,
    required this.name,
    required this.type,
    required this.accountNumber,
    required this.balance,
    required this.currency,
  });

  String get formattedAccountNumber {
    return accountNumber.replaceAllMapped(
      RegExp(r'.{4}'),
      (match) => '${match.group(0)} ',
    ).trim();
  }

  String get maskedAccountNumber {
    return '**** **** **** ${accountNumber.substring(accountNumber.length - 4)}';
  }
}
