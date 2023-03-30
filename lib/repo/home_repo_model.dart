import 'package:mvvm_books_app/data/network/BaseApiServices.dart';
import 'package:mvvm_books_app/data/network/NetworkApiServices.dart';
import 'package:mvvm_books_app/data/network/app_url.dart';
import 'package:mvvm_books_app/model/book_model.dart';

class HomeRepository {
  final BaseApiServices _apiService = NetworkServices();

  Future<List<BookModel>> fetchBooksLists() async {
    List<BookModel> books = [];
    try {
      final response =
          await _apiService.getGetApiResponse(AppUrl.baseUrl) as List;
      books = response
          .map((e) => BookModel.fromJson(e as Map<String, dynamic>))
          .toList();
    } catch (err) {
      rethrow;
    }

    return books;
  }
}
