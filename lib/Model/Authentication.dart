// ignore_for_file: file_names, unused_local_variable, unused_import


import 'package:expense_tracker/Model/Functions.dart';
import 'package:expense_tracker/View/LoginPages/HomePage.dart';
import 'package:expense_tracker/View/LoginPages/LoginOrSignUp.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_sign_in/google_sign_in.dart';


class Authentication {
  final pa=Calc();
  void createUserWithEmailAndPassword(
      String emailAddress, String password, BuildContext context) async {
    try {
      final credential = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      )
          .then((UserCredential userCredential) {
        
        noti('User registered successfully');

      
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        noti('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        noti('The account already exists for that email.');
      }
    } catch (e) {
      noti(e);
    }
  }

  void signInWithEmailAndPassword(
      String emailAddress, String password, BuildContext context) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: emailAddress, password: password)
          .then((UserCredential userCredential) {
        noti('User logined Sucessfully');

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
            (route) => false);
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        noti('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        noti('Wrong password provided for that user.');
      }
    }
  }

  void signOut(BuildContext context) async {
    await FirebaseAuth.instance.signOut().then((valu) {
      // User registered successfully
      noti('User logouted Sucessfully');

      // Navigator.push(
      //   context,
      //   MaterialPageRoute(builder: (context) => loginorsignup()),
      // );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => LoginOrSignUp()),
          (route) => false);
    });
  }

 
void signInWithGoogle(BuildContext context) async {
  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(
    accessToken: googleAuth?.accessToken,
    idToken: googleAuth?.idToken,
  );

  // Once signed in, return the UserCredential
   await FirebaseAuth.instance.signInWithCredential(credential)
   .then((UserCredential userCredential) {
        // User registered successfully
        noti('User logined Sucessfully');

        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
            (route) => false);
      });
}

 var veri='';
void phoneverification(phonenumber)async{
  try{
    await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: phonenumber,
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {
     if (e.code == 'invalid-phone-number') {
      noti('The provided phone number is not valid.');
    }
  },
  
  codeSent: (String verificationId, int? resendToken) {

    this.veri=verificationId;
      


   },
  codeAutoRetrievalTimeout: (String verificationId) {
     noti("Timeout! Auto retrieval timed out.");
  },
  timeout:  Duration(seconds: 60), 
);
  }catch(e){
              noti("Error during phone number verification: $e");

  };
}
void sms(sms ,BuildContext context)async{
  FirebaseAuth auth = FirebaseAuth.instance;

   String smsCode = sms;

    // Create a PhoneAuthCredential with the code
    try {
  PhoneAuthCredential credential = PhoneAuthProvider.credential
  (verificationId: veri, smsCode: smsCode);
  
  // Sign the user in (or link) with the credential
  await auth.signInWithCredential(credential)

  .then((UserCredential userCredential) {
        // User registered successfully
noti("User signed in");
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => FirstPage()),
            (route) => false);
            pa.pages(true);
            

      });
        
        

} on Exception catch (e) {

        noti("Error during SMS code verification: $e");

}
}



  void noti(msg) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: const Color.fromARGB(255, 206, 192, 191),
        textColor: Color.fromARGB(255, 0, 0, 0),
        fontSize: 16.0);
  }
}
