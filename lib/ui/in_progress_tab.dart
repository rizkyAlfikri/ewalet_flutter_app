import 'package:ewalet_flutter_app/custom_view.dart';
import 'package:ewalet_flutter_app/model/transaction_model.dart';
import 'package:ewalet_flutter_app/ui/detail_transaction.dart';
import 'package:flutter/material.dart';

class InProgressTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        children: _transactionModels.map((transaction) {
          return FlatButton(
            onPressed: () {
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => TransactionDetail(transactionModel: transaction,)));
            },
            child: customCardView(transactionModel: transaction),
          );
        }).toList(),
      ),
    );
  }
}

final List<TransactionModel> _transactionModels = [
  TransactionModel(
      transactionName: "Mobile Charge",
      date: "17 June 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Internet Charge",
      date: "27 June 2020",
      paymentType: "Mini Market",
      transactionNominal: "Rp.150.000",
      status: 0),
  TransactionModel(
      transactionName: "Steam Wallet",
      date: "17 August 2020",
      paymentType: "Virtual Account",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Health Assurance",
      date: "20 August 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.80.000",
      status: 0),
  TransactionModel(
      transactionName: "Mobile Charge",
      date: "17 June 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Internet Charge",
      date: "27 June 2020",
      paymentType: "Mini Market",
      transactionNominal: "Rp.150.000",
      status: 0),
  TransactionModel(
      transactionName: "Steam Wallet",
      date: "17 August 2020",
      paymentType: "Virtual Account",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Health Assurance",
      date: "20 August 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.80.000",
      status: 0),
  TransactionModel(
      transactionName: "Mobile Charge",
      date: "17 June 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Internet Charge",
      date: "27 June 2020",
      paymentType: "Mini Market",
      transactionNominal: "Rp.150.000",
      status: 0),
  TransactionModel(
      transactionName: "Steam Wallet",
      date: "17 August 2020",
      paymentType: "Virtual Account",
      transactionNominal: "Rp.200.000",
      status: 0),
  TransactionModel(
      transactionName: "Health Assurance",
      date: "20 August 2020",
      paymentType: "Bank Transfer",
      transactionNominal: "Rp.80.000",
      status: 0),
];
