import 'package:bookapp/constants/api_constants.dart';
import 'package:bookapp/network/respone/serach_respone/search_respone.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'search_api.g.dart';

@RestApi(baseUrl: kBASE_URL_SEARCH)
abstract class SearchApi {
  factory SearchApi(Dio dio) => _SearchApi(dio);

  @GET(kSerachEndPoint)
  Future<SearchRespone> getSearchRespone(@Query(kSerachKey) String search);
}
