import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:mvvm_books_app/components/colors.dart';
import 'package:mvvm_books_app/components/my_back_button.dart';
import 'package:mvvm_books_app/model/book_model.dart';
import '../components/book_desc.dart';

class BookDescView extends StatelessWidget {
  BookModel? bookModel;
  BookDescView({super.key, this.bookModel});

  String arrageListItemsToString(List data) {
    String items = "";
    for (String item in data) {
      items = "$item, $items";
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: const MyBackButton(),
      backgroundColor: AppColors.black,

      // BODY
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CachedNetworkImage(
              imageUrl: bookModel!.thumbnailUrl ?? "",
              placeholder: (context, url) {
                return Image.asset('assets/R.jpeg');
              },
              width: double.infinity,
              fit: BoxFit.fitHeight,
              errorWidget: (context, url, error) {
                return AspectRatio(
                  aspectRatio: 2 / 3,
                  child: Image.asset(
                    'assets/R.jpeg',
                    height: double.infinity,
                    fit: BoxFit.cover,
                  ),
                );
              },
            ),
            // TITLE
            BookDesc(tag: "Title", data: bookModel!.title ?? 'Not available'),

            // AUTHOR
            BookDesc(
                tag: "Author",
                data: bookModel!.authors != null
                    ? arrageListItemsToString(bookModel!.authors!)
                    : "Not available"),

            // PAGE COUNT
            BookDesc(
                tag: "Page Count",
                data:
                    (bookModel!.pageCount == null || bookModel!.pageCount == 0)
                        ? "Not available"
                        : bookModel!.pageCount!.toString()),

            // ISBN
            BookDesc(tag: "ISBN", data: bookModel!.isbn ?? "Not available"),

            // PUBLISH DATE

            BookDesc(
                tag: "Published Date",
                data: formatDate(bookModel!.publishedDate!.date.toString())),

            // STATUS
            BookDesc(tag: "Status", data: bookModel!.status ?? 'Not available'),

            // CATEGORIES
            BookDesc(
                tag: "Categories",
                data: bookModel!.categories!.isNotEmpty
                    ? arrageListItemsToString(bookModel!.categories!)
                    : "Not available"),

            // DESCRIPTION
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: Text.rich(
                TextSpan(
                  text: "Description : \n",
                  style: const TextStyle(
                      color: AppColors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                  children: [
                    TextSpan(
                        text: bookModel!.longDescription ??
                            "No description available",
                        style: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

//DATE FORMATTING
String formatDate(String formattedString) {
  if (formattedString == "0000-00-00T00:00:00.000-0000") {
    return "Not available";
  } else {
    final date = DateTime.parse(formattedString);
    final formatted = DateFormat("yyyy/MM/dd").format(date);
    return formatted;
  }
}
