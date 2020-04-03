class Transfer {
  final double amount;
  final int accountNumber;

  Transfer(this.amount, this.accountNumber);

  @override
  String toString() {
    return 'Transferência{amount: $amount, accountNumber: $accountNumber}';
  }
}