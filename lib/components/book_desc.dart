import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';

class BookDesc extends StatelessWidget {
  final String? tag;
  final String data;
  const BookDesc({
    Key? key,
    this.tag,
    this.data = 'Not available',
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      child: Text.rich(
        TextSpan(
          text: "$tag : ",
          style: const TextStyle(
              color: AppColors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold),
          children: [
            TextSpan(
              text: data,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w500),
            ),
          ],
        ),
      ),
    );
  }
}
