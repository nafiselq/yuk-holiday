import 'package:airplane/cubit/auth_cubit.dart';
import 'package:airplane/cubit/transaction_cubit.dart';
import 'package:airplane/models/transaction_model.dart';
import 'package:airplane/shared/theme.dart';
import 'package:airplane/ui/pages/success_checkout_page.dart';
import 'package:airplane/ui/widgets/booking_details_item.dart';
import 'package:airplane/ui/widgets/custom_button.dart';
import 'package:airplane/ui/widgets/destination_tile.dart';
import 'package:airplane/ui/widgets/interest_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

class CheckoutPage extends StatelessWidget {
  final TransactionModel transaction;
  const CheckoutPage(this.transaction, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Widget route() {
      return Container(
        margin: const EdgeInsets.only(
          top: 50,
        ),
        child: Column(
          children: [
            Container(
              height: 65,
              width: 291,
              margin: const EdgeInsets.only(
                bottom: 10,
              ),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/image_checkout.png"),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "CGK",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Tangerang",
                      style: blackTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      "TLC",
                      style: blackTextStyle.copyWith(
                        fontSize: 24,
                        fontWeight: semiBold,
                      ),
                    ),
                    Text(
                      "Ciliwung",
                      style: blackTextStyle.copyWith(
                        fontWeight: light,
                      ),
                    )
                  ],
                )
              ],
            )
          ],
        ),
      );
    }

    Widget bookingDetails() {
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
                    valueColor:
                        transaction.refundable ? kGreenColor : kRedColor,
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

    Widget paymentDetails() {
      return BlocBuilder<AuthCubit, AuthState>(
        builder: (context, state) {
          if (state is AuthSucess) {
            return Container(
              margin: const EdgeInsets.only(top: 30),
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 30,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Payment Details",
                    style: blackTextStyle.copyWith(
                      fontSize: 16,
                      fontWeight: semiBold,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 16),
                    child: Row(
                      children: [
                        Container(
                          width: 100,
                          height: 70,
                          margin: const EdgeInsets.only(right: 16),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                            image: const DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/bg-container.png"),
                            ),
                          ),
                          child: Center(
                            child: Row(
                              children: [
                                Container(
                                  height: 24,
                                  width: 24,
                                  margin: const EdgeInsets.only(right: 6),
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                        "assets/logo.png",
                                      ),
                                    ),
                                  ),
                                ),
                                Text(
                                  "Pay",
                                  style: whiteTextStyle.copyWith(
                                    fontSize: 16,
                                    fontWeight: medium,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              NumberFormat.currency(
                                locale: 'id',
                                symbol: 'IDR ',
                                decimalDigits: 0,
                              ).format(state.user.balance),
                              style: blackTextStyle.copyWith(
                                fontSize: 18,
                                fontWeight: medium,
                              ),
                            ),
                            const SizedBox(
                              height: 5,
                            ),
                            Text(
                              "Current Balance",
                              style: greyTextStyle.copyWith(
                                fontWeight: light,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  )
                ],
              ),
            );
          } else {
            return const SizedBox();
          }
        },
      );
    }

    Widget payButton() {
      return BlocConsumer<TransactionCubit, TransactionState>(
        listener: (context, state) {
          if (state is TransactionSuccess) {
            Navigator.pushNamedAndRemoveUntil(
                context, '/success', (route) => false);
          } else if (state is TransactionFailed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.error),
                backgroundColor: kRedColor,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state is TransactionLoading) {
            return Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(top: 30),
              child: const CircularProgressIndicator(),
            );
          }
          return CustomButton(
            margin: const EdgeInsets.symmetric(vertical: 30),
            title: "Pay Now",
            onPressed: () {
              context.read<TransactionCubit>().createTransaction(transaction);
            },
          );
        },
      );
    }

    Widget tacButton() {
      return Container(
        alignment: Alignment.center,
        margin: const EdgeInsets.only(bottom: 30),
        child: TextButton(
          onPressed: () {},
          child: Text(
            'Term and Conditions',
            style: greyTextStyle.copyWith(
              fontSize: 16,
              fontWeight: light,
              decoration: TextDecoration.underline,
            ),
          ),
        ),
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
            route(),
            bookingDetails(),
            paymentDetails(),
            payButton(),
            tacButton(),
          ],
        ),
      ),
    );
  }
}
