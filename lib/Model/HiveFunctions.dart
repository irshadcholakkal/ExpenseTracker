//ignore_for_file: non_constant_identifier_names, invalid_use_of_visible_for_testing_member, invalid_use_of_protected_member

import 'package:expense_tracker/Model/Model/DataModel.dart';
import 'package:flutter/foundation.dart';
import 'package:hive/hive.dart';

ValueNotifier<List<DataModel>>DataList=ValueNotifier([]);


Future<void> adi(DataModel value) async { 

 final box = await Hive.openBox<DataModel>('datamodel');

 await box.add(value);
 DataList.value.add(value);


  DataList.notifyListeners();

}

Future<void>getdata() async {
  final box = await Hive.openBox<DataModel>('datamodel');
  DataList.value.clear();

DataList.value.addAll(box.values);  
  DataList.notifyListeners();
  
  


  

}
class DataClearedNotifier extends ChangeNotifier {
  void notifyDataCleared() {
    notifyListeners();
  }
}
