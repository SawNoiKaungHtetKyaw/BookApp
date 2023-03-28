import 'package:bookapp/constants/api_constants.dart';
import 'package:bookapp/network/respone/book_respone/book_respone.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'book_api.g.dart';

@RestApi(baseUrl: kBASE_URL_HOME)
abstract class BookApi {
  factory BookApi(Dio dio) => _BookApi(dio);

  @GET(kGetBookEndPoint)
  Future<BookRespone> getBookRespone(
      @Query(kPublishedDate) String publishDate, @Query(kApiKey) String apiKey);
}
