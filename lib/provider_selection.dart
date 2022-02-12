import 'package:flutter/cupertino.dart';

class ProviderSelection extends ChangeNotifier{

  int index = 5;
  double visibility = 0.0;

  setVisibility(double visibility){
    this.visibility = visibility;
    notifyListeners();
  }
}