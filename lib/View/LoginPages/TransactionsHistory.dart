// ignore_for_file: unused_local_variable, prefer_const_constructors



import 'package:expense_tracker/Model/HiveFunctions.dart';
import 'package:expense_tracker/Model/Authentication.dart';
import 'package:expense_tracker/View/LoginPages/Transactions.dart';
// import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:hive/hive.dart';
import 'package:shared_preferences/shared_preferences.dart';

class History extends StatefulWidget {

  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  DataClearedNotifier dataClearedNotifier = DataClearedNotifier();

   Future<void> clearAllData() async {
    // Clear Hive data
    await Hive.deleteFromDisk(); 

    

    // Clear SharedPreferences data
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.clear();
    int result = 0;
  int inc = 0;
  int exp = 0;
  int trs = 0;
    String ? selectedValue;
    String? months;
   String ? incomecategory;
   String ? incomewallet;
   String ? expensecategory;
   String ? expensewallet;
   bool ? isSwitched = true;

    dataClearedNotifier.notifyDataCleared();
    
    
    // You can also add additional data clearing logic for other data storage methods

    // Show a snackbar to indicate that data has been cleared
   
    
  }

  final Auth=Authentication();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.grey.shade200 ,
      appBar: AppBar(
        actions: [
          IconButton(onPressed: ()  {
             
            
            clearAllData();
            DefaultCacheManager().emptyCache();
            Auth.signOut(context);
            Auth.noti('sign outed');
            

           
          



             ScaffoldMessenger.of(context).showSnackBar(
       SnackBar(
        duration: Duration(microseconds: 3),
        padding: EdgeInsets.all(20),
        backgroundColor: Colors.grey,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
        
        content: Text('All data cleared successfully.',
        style: TextStyle(
          fontWeight: FontWeight.w700,
          color: Colors.white
        ),),
      ),
             );
             
           

          }, icon: Icon(Icons.replay_circle_filled_sharp),
          color: Colors.red,)
        ],
        backgroundColor: Colors.grey.shade200,
      ),
      body: MyWidget(),


    );
    
  }
}

   

//   Future<void> clearSharedPreference() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//    int result = 0;
//   int inc = 0;
//   int exp = 0;
//   int trs = 0;
//     String ? selectedValue = null;
//     String? months = null;
//    String ? incomecategory = null;
//    String ? incomewallet = null;
//    String ? expensecategory = null;
//    String ? expensewallet = null;
//    bool ? isSwitched = true;
   
//   }

//   Future<void> clearHiveBox() async {
//   final box = await Hive.openBox<DataModel>('datamodel');// Replace 'myBox' with your box name
//   await box.clear();
//   await box.close();
// }





