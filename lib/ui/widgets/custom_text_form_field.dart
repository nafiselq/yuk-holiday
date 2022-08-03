import 'package:flutter/material.dart';

import '../../shared/theme.dart';

class CustomTextFormField extends StatelessWidget {
  final String label;
  final String hintText;
  final bool isObscure;
  final TextEditingController controller;
  const CustomTextFormField({
    Key? key,
    required this.label,
    required this.hintText,
    required this.controller,
    this.isObscure = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: blackTextStyle.copyWith(
              fontSize: 14,
              fontWeight: regular,
            ),
          ),
          const SizedBox(
            height: 6,
          ),
          TextFormField(
            controller: controller,
            obscureText: isObscure,
            cursorColor: kBlackColor,
            decoration: InputDecoration(
              hintText: hintText,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(defaultRadius),
                borderSide: BorderSide(
                  color: kPrimaryColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
