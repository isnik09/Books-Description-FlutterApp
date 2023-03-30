import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mvvm_books_app/data/response/api_response.dart';
import 'package:mvvm_books_app/model/book_model.dart';
import 'package:mvvm_books_app/repo/home_repo_model.dart';

class HomeViewVModel with ChangeNotifier {
  final _homeRepo = HomeRepository();

  ApiResponse<List<BookModel>> booksList = ApiResponse.loading();

// SETTING RESPONSE TO A LIST FROM FETCHED DATA
  setBooksList(ApiResponse<List<BookModel>> response) {
    booksList = response;
    notifyListeners();
  }

  // FETCHING BOOK LIST FROM LINK

  Future<void> fetchBooksListApi() async {
    setBooksList(ApiResponse.loading());

    _homeRepo.fetchBooksLists().then((value) {
      setBooksList(ApiResponse.completed(value));
    }).onError((error, stackTrace) {
      setBooksList(ApiResponse.error(error.toString()));
    });
  }
}
