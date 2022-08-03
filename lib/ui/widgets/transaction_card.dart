import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/transaction_model.dart';
import '../../shared/theme.dart';
import 'booking_details_item.dart';
import 'destination_tile.dart';

class TransactionCard extends StatelessWidget {
  final TransactionModel transaction;

  const TransactionCard(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      margin: const EdgeInsets.only(top: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: kWhiteColor,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // NOTE : DESTINATION TILE
          DestinationTile(transaction.destination),

          // NOTE : BOOKING DETAILS TEXT
          Container(
            margin: const EdgeInsets.only(top: 20),
            child: Text(
              "Booking Details",
              style: blackTextStyle.copyWith(
                fontSize: 16,
                fontWeight: semiBold,
              ),
            ),
          ),

          // NOTE : BOOKING INTEREST
          Container(
            margin: const EdgeInsets.only(top: 10),
            child: Column(
              children: [
                BookingDetailsItem(
                  title: "Traveler",
                  valueText: "${transaction.amountOfTraveler} Person",
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: "Seat",
                  valueText: transaction.selectedSeats,
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: "Insurance",
                  valueText: transaction.insurance ? 'YES' : 'NO',
                  valueColor: transaction.insurance ? kGreenColor : kRedColor,
                ),
                BookingDetailsItem(
                  title: "Refundable",
                  valueText: transaction.refundable ? "YES" : "NO",
                  valueColor: transaction.refundable ? kGreenColor : kRedColor,
                ),
                BookingDetailsItem(
                  title: "VAT",
                  valueText: "${(transaction.vat * 100).toStringAsFixed(0)}%",
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: "Price",
                  valueText: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transaction.price),
                  valueColor: kBlackColor,
                ),
                BookingDetailsItem(
                  title: "Grand Total",
                  valueText: NumberFormat.currency(
                    locale: 'id',
                    symbol: 'IDR ',
                    decimalDigits: 0,
                  ).format(transaction.grandTotal),
                  valueColor: kPurpleColor,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
