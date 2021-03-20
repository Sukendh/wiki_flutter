import 'package:flutter/material.dart';
import 'package:toast/toast.dart';
import 'package:wiki_flutter/models/wiki_response.dart';
import 'package:wiki_flutter/utils/api_service.dart';

class SearchBloc extends ChangeNotifier {
  List<Pages> pages = new List<Pages>();
  bool isLoading = false;

  searchWiki({BuildContext context, String value}) {
    isLoading = true;
    notifyListeners();
    APIService().getSearchResult(value).then((response) {
      isLoading = false;
      notifyListeners();
      if (response.statusCode == 200) {
        try {
          WikiResponse wikiResponse = WikiResponse.fromJson(response.data);
          if (wikiResponse == null) {
            pages.clear();
          } else {
            pages = wikiResponse.query.pages;
          }
          notifyListeners();
        } catch (e) {
          pages.clear();
          notifyListeners();
          print(e);
          showToast("No Result Found", context);
        }
      }
    });
  }

  static showToast(String msg, BuildContext context) {
    Toast.show(msg, context,
        duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  }
}
