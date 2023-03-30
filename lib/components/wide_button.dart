import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';

class WideButton extends StatelessWidget {
  const WideButton({
    super.key,
    required this.onTapFunction,
    required this.buttonTitle,
    required this.buttonIcon,
  });
  final void Function()? onTapFunction;
  final String? buttonTitle;
  final IconData? buttonIcon;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTapFunction,
      child: Container(
        height: 50,
        width: 250,
        decoration: BoxDecoration(
          color: AppColors.accent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Text(
              "$buttonTitle",
              style: const TextStyle(color: AppColors.black, fontSize: 18),
            ),
            Icon(
              buttonIcon,
              color: AppColors.black,
            ),
          ],
        ),
      ),
    );
  }
}
