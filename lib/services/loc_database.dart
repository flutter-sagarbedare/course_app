import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:course_app/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:developer';

void presavelocaldata(bool isLogin,String uId)async{
    // Map<String,dynamic> userData = {};

    // DocumentSnapshot snapshot = await FirebaseFirestore.instance.collection('Users').doc(uId).get();

    // userData = snapshot.data() as Map<String,dynamic>;

    // log(userData['name']);
    // log(userData['Id']);

    saveUserData(isLogin: isLogin,userId: uId);

}


Future<void> saveUserData({required bool isLogin,required String userId})async{

    final pref = await SharedPreferences.getInstance();
    await pref.setBool('isLogin', isLogin); 
    // await pref.setString('name', );
    await pref.setString('userId',userId);
    log("user data is saved in sharedpreference");
}