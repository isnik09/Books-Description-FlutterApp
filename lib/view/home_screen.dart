import 'package:flutter/material.dart';
import 'package:mvvm_books_app/components/colors.dart';
import 'package:mvvm_books_app/components/wide_button.dart';
import 'package:mvvm_books_app/data/response/status.dart';
import 'package:mvvm_books_app/model/book_model.dart';
import 'package:mvvm_books_app/utils/routes/routes.dart';
import 'package:mvvm_books_app/view/book_desc_screen.dart';
import 'package:mvvm_books_app/view_model/home_view_model.dart';
import 'package:mvvm_books_app/components/my_card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  HomeViewVModel homeViewViewModel = HomeViewVModel();

  @override
  void initState() {
    // FETCHING BOOKS FROM URL
    homeViewViewModel.fetchBooksListApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.black,
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ChangeNotifierProvider<HomeViewVModel>(
          create: (BuildContext context) => homeViewViewModel,
          child: Consumer<HomeViewVModel>(
            builder: (context, value, _) {
              switch (value.booksList.status!) {
                case Status.LOADING:
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.white,
                      strokeWidth: 5,
                    ),
                  );

                case Status.ERROR:
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          value.booksList.message.toString(),
                          style: const TextStyle(
                              color: AppColors.accent, fontSize: 20),
                          textAlign: TextAlign.center,
                        ),
                        WideButton(
                            onTapFunction: () {
                              Navigator.popAndPushNamed(
                                  context, RoutesName.home);
                            },
                            buttonTitle: "Retry",
                            buttonIcon: Icons.refresh)
                      ],
                    ),
                  );

                case Status.COMPLETED:
                  return GridView.builder(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 2 / 3,
                      crossAxisSpacing: 5,
                      mainAxisSpacing: 5,
                    ),
                    itemCount: value.booksList.data!.length,
                    itemBuilder: (BuildContext context, int index) {
                      BookModel book = value.booksList.data![index];
                      return MyCard(
                        imageUrl: book.thumbnailUrl,
                        name: book.title,
                        onTapFunction: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BookDescView(
                                bookModel: book,
                              ),
                            ),
                          );
                        },
                      );
                    },
                  );

                default:
                  return const Center(
                    child: Text(
                      "Something went wrong",
                      style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: AppColors.accent),
                    ),
                  );
              }
            },
          ),
        ),
      ),
    );
  }
}
