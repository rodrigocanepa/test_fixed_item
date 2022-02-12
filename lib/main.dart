import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_fixed_item/main_screen2.dart';
import 'package:test_fixed_item/provider_selection.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final _selectionProvider = ProviderSelection();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProviderSelection>(create: (_) => _selectionProvider),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MainScreen2(),
      ),
    );
  }
}
