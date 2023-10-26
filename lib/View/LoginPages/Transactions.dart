// ignore_for_file: prefer_const_constructors, must_be_immutable, non_constant_identifier_names


import 'package:expense_tracker/Model/HiveFunctions.dart';
import 'package:expense_tracker/Model/Model/DataModel.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  MyWidget({super.key});
  bool  displayMoney =true ;

  @override
  Widget build(BuildContext context) {
    
    return ValueListenableBuilder<List<DataModel>>(
      valueListenable: DataList, // Replace with your ValueNotifier
      builder: (BuildContext context, List<DataModel> DataList,
          Widget? child) {
        return ListView.separated(
          padding: EdgeInsets.all(0),
          reverse: true,
          
          itemBuilder: (ctx, index) {
            final data = DataList[index];

            return ListTile(
              
                leading: logos(data.category),
                title: Text(
                  data.category,
                  style: const TextStyle(color: Colors.black),
                ),
                subtitle: Row(
                  children: [
                    Text(
                      data.description,
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    walletlogo(data.wallet),
                  ],
                ),
                trailing: Column(
                  children: [
                    Text('\$ ${data.money.toString()}',
                        style: TextStyle(
                            color:  data.displayMoney ? Color(0xFF00A86B) : Color(0xFFFD3C4A),
                            fontSize: 18,
                            fontWeight: FontWeight.w700)),
                         
                    Text(
                      getFormattedTime(),
                    ),
                  ],
                ));
          },
          separatorBuilder: (ctx, index) {
            return const Divider();
          },
          itemCount: DataList.length,
        );
      },

      // ),
    );
  }

  String getFormattedTime() {
    DateTime now = DateTime.now();
    String period = now.hour >= 12 ? 'PM' : 'AM';
    int hour = now.hour > 12 ? now.hour - 12 : now.hour;
    String minute = now.minute.toString().padLeft(2, '0');
    return '$hour:$minute $period';
  }

  Widget logos(String category) {
    switch (category) {
      case 'Shopping':
        return Image.asset(
          'Assets/Images/Shopping.png',
          scale: 1.9,
        );
      // break;
      case 'Fuel':
        return Image.asset(
          'Assets/Images/Fuel.png',
          scale: 1.9,
        );
      case 'Travel':
        return Image.asset(
          'Assets/Images/Travel.png',
          scale: 1.9,
        );
      // break;
      case 'Personal':
        return Image.asset(
          'Assets/Images/Personal.png',
          scale: 1.9,
        );
      case 'Bills':
        return Image.asset(
          'Assets/Images/Bills.png',
          scale: 1.9,
        );

      default:
        return Icon(Icons.abc);
    }
  }

  Widget walletlogo(String wallet) {
    switch (wallet) {
      case 'Google Pay':
        return Image.asset(
          'Assets/Images/googlepay.png',
          scale: 1.6,
        );
      case 'Phone pe':
        return Image.asset(
          'Assets/Images/phonepe.png',
          scale: 1.6,
        );
      case 'Paytm':
        return Image.asset(
          'Assets/Images/paytm.png',
          scale: 1.6,
        );
      case 'Amazon pay':
        return Image.asset(
          'Assets/Images/amazon pay.png',
          scale: 1.6,
        );
      case "Other UPI's":
        return Image.asset(
          'Assets/Images/upi.png',
          scale: 1.6,
        );
      default:
        return Icon(Icons.abc);
    }
  }
}









// import 'package:flutter/material.dart';

// class StudentListView extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Student List'),
//       ),
//       body: ValueListenableBuilder<List<StudentModel>>(
//         valueListenable: StudentList,
//         builder: (context, studentList, child) {
//           return ListView.builder(
//             itemCount: studentList.length,
//             itemBuilder: (context, index) {
//               StudentModel student = studentList[index];
//               return ListTile(
//                 title: Text(student.Category),
//                 subtitle: Text(student.Description),
//                 trailing: Text(student.Amount.toString()),
//                 // Add any additional information you want to display
//               );
//             },
//           );
//         },
//       ),
//     );
//   }
// }
