import 'package:dio/dio.dart';

class APIService {
  Dio dio = new Dio();

  var base_url = "https://en.wikipedia.org/w/api.php";

  Future<Response> getSearchResult(String search) async {
    var url = base_url;
    var queryparams = {
      "action": "query",
      "format": "json",
      "prop": "pageimages|pageterms",
      "titles": "Albert Einstein",
      "formatversion": "2",
      "generator": "prefixsearch",
      "redirects":"1",
      "piprop": "thumbnail",
      "pithumbsize":"80",
      "pilimit":"10",
      "wbptterms":"description",
      "gpssearch":"$search",
      "gpslimit":"10",
    };
    Response response = await dio.get(url, queryParameters: queryparams);
    print("RESPONSE:::" + response.data.toString());
    return response;
  }
}
