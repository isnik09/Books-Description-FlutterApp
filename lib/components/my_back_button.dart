import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';

class MyBackButton extends StatelessWidget {
  const MyBackButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlurContainerWidget(
      borderRadius: BorderRadius.circular(12),
      width: 60,
      height: 60,
      child: InkWell(
        highlightColor: Colors.black,
        enableFeedback: true,
        onTap: () {
          Navigator.pop(context);
        },
        child: const Icon(
          Icons.chevron_left_rounded,
          color: AppColors.white,
          size: 60,
        ),
      ),
    );
  }
}
