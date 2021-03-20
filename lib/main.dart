import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wiki_flutter/search_bloc.dart';
import 'package:wiki_flutter/search_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchBloc()),
      ],
      child: MaterialApp(
        title: 'Flutter Wiki',
        theme: ThemeData(
          primarySwatch: Colors.blueGrey,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: SearchScreen(),
      ),
    );
  }
}
