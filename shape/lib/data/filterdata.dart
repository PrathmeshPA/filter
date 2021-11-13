// import 'dart:convert';

// import 'package:abcd/listcontroll.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'apidata.dart';


// class serv{

//   static const String url= "http://192.168.29.222/neweasy/test.json";

//    static Future<List<User>> alldata() async{
//     try{
//       final respo = await http.get(Uri.parse(url));
//       if(respo.statusCode==200){
//         List<User> list= newuser(respo.body);
//         return list;
//       }
//       else{
//         throw Exception("error");
//       }
//     }catch(e){
//       throw Exception(e.toString());
//     }
//   }
//   static List<User> newuser  (String respoBody){
//     final press =json.decode(respoBody).cast<Map<String, dynamic>>();
//     return press.map<User>((json)=>User.fromJson(json)).toList();
//   }
// }