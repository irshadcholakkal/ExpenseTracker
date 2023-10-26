
 import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expense_tracker/Model/Functions.dart';

class FireStoressssss {
Calc? obj;
  final FirebaseFirestore db =FirebaseFirestore.instance;

  void addinng (Calc c)async{
    try{
  await db.collection('data').doc(c.result.toString()).set(c.tojson());
  



    }catch(e){

    }
  }
  void getdata(){
    final docRef = db.collection('data').doc('value');
docRef.get().then(
  (DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    Calc.fromjson(data);
    print(data);
    // ...
  },
  onError: (e) => print("Error getting document: $e"),
);
  }



   

 }