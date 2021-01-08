class TransactionModel{
  String transactionName;
  String date;
  String paymentType;
  String transactionNominal;
  int status;

  TransactionModel({this.transactionName, this.date, this.paymentType,
      this.transactionNominal, this.status});
}