import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki_flutter/models/wiki_response.dart';
import 'package:wiki_flutter/search_bloc.dart';
import 'package:wiki_flutter/widgets/search_field.dart';

class SearchScreen extends StatelessWidget {
  var _searchController = new TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("WIKI SEARCH"),
        ),
        backgroundColor: Colors.grey[100],
        body: Consumer<SearchBloc>(
          builder: (context, bloc, child) => Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                KSearchField(
                  hintText: "Search",
                  controller: _searchController,
                  onSearchTap: (value) {
                    print(value);
                    bloc.searchWiki(context: context, value: value);
                  },
                ),
                !bloc.isLoading
                    ? Expanded(
                        child: ListView.builder(
                            itemCount: bloc.pages.length,
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return _showListItem(bloc.pages[index], index);
                            }),
                      )
                    : Expanded(
                        child: Center(
                        child: new CircularProgressIndicator(),
                      ))
              ],
            ),
          ),
        ));
  }

  Widget _showListItem(Pages page, int index) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: index % 2 == 0 ? Colors.grey[200] : Colors.white,
        ),
        padding: EdgeInsets.all(10.0),
        child: new ListTile(
          leading: page.thumbnail != null
              ? Container(
                  height: 45.0,
                  width: 45.0,
                  child: CachedNetworkImage(
                    imageUrl: page.thumbnail.source,
                    fit: BoxFit.fill,
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                  ),
                )
              : Icon(
                  Icons.error,
                  size: 43.0,
                ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                page.title,
                style: TextStyle(fontWeight: FontWeight.w500),
              ),
              page.terms != null ? Text(
                '${page.terms.description.join(" ")}',
                style: TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                    fontWeight: FontWeight.w300),
              ): new Container()
            ],
          ),
        ),
      ),
    );
  }
}
