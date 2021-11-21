import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:practice2/home.dart';
import 'package:practice2/models/grocery_manager.dart';
import 'package:practice2/models/models.dart';
import 'package:practice2/theme.dart';
import 'package:provider/provider.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final theme = AppTheme.dark();
  final title = 'NriBox';
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      title: title,
      home: MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => TabManager(),),

          ChangeNotifierProvider(create: (context) => GroceryManager()),
        ],

        child: Home(),
      ),
    );
  }
}

