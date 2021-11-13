import 'dart:convert';
import 'dart:ffi';

import 'package:abcd/data/apidata.dart';
import 'package:abcd/filterchip.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'listcontroll.dart';

class filterdata extends StatefulWidget {
//  late final  abcd;
//   filterdata({kye, required this.abcd });

  @override
  _filterdataState createState() => _filterdataState();
}

class _filterdataState extends State<filterdata> {
  // List<User> users = [];

  Future<List <User>> filedata () async {
    var fildata =
        await http.get(Uri.parse("http://192.168.29.222/neweasy/test.json"));

     var fdata = jsonDecode(fildata.body) as List<dynamic>;
    
    // print(fdata);
     controller.selectedlist.forEach((element){
       String newdata = element;
       var d = fdata.where((element) => element.containsValue(newdata)) .toList();
       print(d);
     } );
     return fdata.first;
    //fdata.map((e) => User.fromJson(e)).toList();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   filedata();
  // }
  var controller = Get.put(selectcontroll());

  @override
  Widget build(BuildContext context) {
     return 
    Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          title: Text("ApiData"),
        ),
        body:
        FutureBuilder(
          future: filedata(),
          builder: (context, data){
            var item = data.data as List<User>;
            return ListView.builder(
              itemCount:item == null ? 0 :  item.length,
              itemBuilder: (context,  index){
                return Text(item[index].shapenm.toString());
              }
              );
          },
        )
    //     ListView.builder(
    //   itemCount:controller.selectedlist .length,
    //   itemBuilder: (context,index){
          

    //   return ListTile(
    //     leading: Text(controller.selectedlist[index]),
    //     // trailing: Text(fdata[index]['code']),
    //     // title: Text(product[index]['capital']) ,
    //     );
    //   }
    // )
            
        );



  }
}
