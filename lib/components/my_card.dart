import 'package:blur_container/blur_container.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';
import 'package:mvvm_books_app/components/my_cached_image_loader.dart';

class MyCard extends StatelessWidget {
  MyCard({
    super.key,
    required this.imageUrl,
    required this.name,
    required this.onTapFunction,
  });
  String? imageUrl;
  String? name;
  final void Function()? onTapFunction;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      highlightColor: Colors.black,
      onTap: onTapFunction,
      child: Card(
        color: Colors.black,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            MyCachedNetworkImageLoader(imageUrl: imageUrl),
            BlurContainerWidget(
              color: Colors.black.withOpacity(.5),
              height: 90,
              width: double.infinity,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name != null ? name! : "No title available",
                    style: const TextStyle(
                      fontSize: 15,
                      color: AppColors.white,
                      fontWeight: FontWeight.w500,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
