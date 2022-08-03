import 'package:airplane/cubit/seat_cubit.dart';
import 'package:airplane/models/destionation_model.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/ui/pages/checkout_page.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/seat_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../shared/theme.dart';

class ChooseSeatPage extends StatelessWidget {
  DestinationModel destination;

  ChooseSeatPage(this.destination, {super.key});

  @override
  Widget build(BuildContext context) {
    Widget title() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Text(
          "Select Your\nFavorite Seat",
          style: blackTextStyle.copyWith(
            fontSize: 24,
            fontWeight: semiBold,
          ),
        ),
      );
    }

    Widget statusBook() {
      return Container(
        margin: const EdgeInsets.only(top: 30),
        child: Row(
          children: [
            // Note: Available
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/ic-available.png",
                  ),
                ),
              ),
            ),
            Text(
              "Available",
              style: blackTextStyle,
            ),

            // Note : Selected
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/ic-selected.png",
                  ),
                ),
              ),
            ),
            Text(
              "Selected",
              style: blackTextStyle,
            ),

            // Note : Unavailable
            Container(
              height: 16,
              width: 16,
              margin: const EdgeInsets.only(right: 6, left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(
                    "assets/ic-unavailable.png",
                  ),
                ),
              ),
            ),
            Text(
              "Unavailable",
              style: blackTextStyle,
            ),
          ],
        ),
      );
    }

    Widget selectSeat() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return Container(
            margin: const EdgeInsets.only(top: 30),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
              vertical: 30,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(18),
              color: kWhiteColor,
            ),
            child: Column(
              children: [
                // Note : SEAT ALFABHET
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'A',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'B',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          '',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'C',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                    Container(
                      width: 48,
                      height: 48,
                      child: Center(
                        child: Text(
                          'D',
                          style: greyTextStyle.copyWith(
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

                // Note : SEAT 1
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A1',
                        isAvailable: false,
                      ),
                      SeatItem(
                        id: 'B1',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '1',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C1',
                      ),
                      SeatItem(
                        id: 'D1',
                      ),
                    ],
                  ),
                ),

                // Note : SEAT 2
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A2',
                      ),
                      SeatItem(
                        id: 'B2',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '2',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C2',
                      ),
                      SeatItem(
                        id: 'D2',
                      ),
                    ],
                  ),
                ),

                // Note : SEAT 3
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A3',
                      ),
                      SeatItem(
                        id: 'B3',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '3',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C3',
                      ),
                      SeatItem(
                        id: 'D3',
                      ),
                    ],
                  ),
                ),

                // Note : SEAT 4
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A4',
                      ),
                      SeatItem(
                        id: 'B4',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '4',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C4',
                      ),
                      SeatItem(
                        id: 'D4',
                      ),
                    ],
                  ),
                ),

                // Note : SEAT 5
                Container(
                  margin: const EdgeInsets.only(
                    top: 16,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      SeatItem(
                        id: 'A5',
                      ),
                      SeatItem(
                        id: 'B5',
                      ),
                      Container(
                        height: 48,
                        width: 48,
                        child: Center(
                          child: Text(
                            '5',
                            style: greyTextStyle.copyWith(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                      SeatItem(
                        id: 'C5',
                      ),
                      SeatItem(
                        id: 'D5',
                      ),
                    ],
                  ),
                ),

                // NOTE : YOUR SEAT
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Your Seat",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        state.join(', '),
                        style: blackTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: medium,
                        ),
                      )
                    ],
                  ),
                ),

                // NOTE : TOTAL
                Container(
                  margin: const EdgeInsets.only(top: 16),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: greyTextStyle.copyWith(fontWeight: light),
                      ),
                      Text(
                        NumberFormat.currency(
                          locale: 'id',
                          symbol: 'IDR ',
                          decimalDigits: 0,
                        ).format(state.length * destination.price),
                        style: purpleTextStyle.copyWith(
                          fontSize: 16,
                          fontWeight: semiBold,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
      );
    }

    Widget checkoutButton() {
      return BlocBuilder<SeatCubit, List<String>>(
        builder: (context, state) {
          return CustomButton(
            margin: const EdgeInsets.only(top: 30, bottom: 46),
            title: "Continue to Checkout",
            onPressed: () {
              int price = destination.price * state.length;

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => CheckoutPage(
                    TransactionModel(
                      destination: destination,
                      amountOfTraveler: state.length,
                      selectedSeats: state.join(', '),
                      insurance: true,
                      refundable: false,
                      price: price,
                      vat: 0.45,
                      grandTotal: price + (price * 0.45).toInt(),
                    ),
                  ),
                ),
              );
            },
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: kWhiteColor,
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(
            horizontal: defaultMargin,
          ),
          children: [
            title(),
            statusBook(),
            selectSeat(),
            checkoutButton(),
          ],
        ),
      ),
    );
  }
}
