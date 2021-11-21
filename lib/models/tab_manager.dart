import 'package:flutter/material.dart';

class TabManager extends ChangeNotifier {
  int selectedTab = 0;

  void gotoTab(index){
    selectedTab = index;

    notifyListeners();
  }

  void goToRecipes(){
    selectedTab = 1;
    notifyListeners();
  }
}