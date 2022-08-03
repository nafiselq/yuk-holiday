import 'package:airplane/shared/theme.dart';
import 'package:flutter/material.dart';

class InterestItem extends StatelessWidget {
  final String labelItem;
  const InterestItem({super.key, required this.labelItem});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            margin: EdgeInsets.only(right: 6),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  "assets/ic-checklist.png",
                ),
              ),
            ),
          ),
          Text(
            labelItem,
            style: blackTextStyle,
          ),
        ],
      ),
    );
  }
}
