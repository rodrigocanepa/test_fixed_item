import 'package:flutter/cupertino.dart';
import 'package:test_fixed_item/value_selected_model.dart';

class ProviderSelection extends ChangeNotifier{

  List<ValueSelectedModel> valuesSelected = [];
  List<int> valuesRight = [];
  List<int> valuesLeft = [];

  addValueSelectedToList(int value, GlobalKey globalKey){
    valuesSelected.add(ValueSelectedModel(globalKey: globalKey, value: value));
    notifyListeners();
  }

  removeValueSelectedToList(ValueSelectedModel valueSelectedModel){
    valuesSelected.remove(valueSelectedModel);
    valuesLeft.remove(valueSelectedModel.value);
    valuesRight.remove(valueSelectedModel.value);
    notifyListeners();
  }

  addValueToList(int value, bool isLeft){
    if(isLeft){
      valuesLeft.add(value);
    } else{
      valuesRight.add(value);
    }
    notifyListeners();
  }

  removeValueToList(int value, bool isLeft){
    if(isLeft){
      valuesLeft.remove(value);
    } else{
      valuesRight.remove(value);
    }
    notifyListeners();
  }


}