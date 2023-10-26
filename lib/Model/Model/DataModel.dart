
import 'package:hive/hive.dart';

part  'DataModel.g.dart';


@HiveType(typeId: 1)
class DataModel{

     @HiveField(0)
   String category;

     @HiveField(1)
   String  wallet;

     @HiveField(2)
   int  money;

     @HiveField(3)
   String  description;

     @HiveField(4)
   bool  displayMoney;

   DataModel({
    required this.category,
    required this.wallet,
    required this .description,
    required this.displayMoney,
    required this.money,
   });
}