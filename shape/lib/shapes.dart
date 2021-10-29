import 'dart:convert';

import 'package:abcd/listcontroll.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;



List<String> data = [
  "CUSHION",
  "PEAR",
    "OVAL",
    "ROUND",
    "PRINCESS",
    "HEART",
    "RADIANT",
    "EMERALD",
    "ASSCHER",
    "MARQUISE",
] ;
// List<String> new_data = ["G","L","E","F","M","n",];

class mshapes extends StatefulWidget {

  const mshapes({ Key? key }) : super(key: key);

  @override
  _mshapesState createState() => _mshapesState();
}

class _mshapesState extends State<mshapes> {
  // List allnew = resp.toList()..toSet();
  var controller = Get.put(selectcontroll());

  void openfilter (context) async{
    await FilterListDialog.display<String>(context, 
    listData: data, 
    selectedListData: controller.getselectedlist(),
    headlineText: 'select shape',
    closeIconColor: Colors.black,
    applyButtonTextStyle: TextStyle(fontSize: 20),
    searchFieldHintText: 'search hear',
    choiceChipLabel: (item) =>item,
    validateSelectedItem: (list, val) => list!.contains(val),
    onItemSearch:(list,text){
      if(list!.any((element) => 
      element.toLowerCase().contains(text.toLowerCase()))){
        return list
        .where((element) => element.toLowerCase().contains(text.toLowerCase())).toList();
      }
      else 
         return [];
    } ,
    onApplyButtonClick: (list){
        controller.setselectedlist(List<String>.from(list!));
        Navigator.of(context).pop();
    });

    
    
  }



  List<dynamic> resp = [];

  Future fdata () async{

    var fildata = await http.get(Uri.parse("http://192.168.29.222/neweasy/phpfiles/shm.php"));
    // resp=jsonDecode(fildata.body);
    resp = fildata.body as List ;  
     print(resp);
     
  }
//  @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//   fdata();
//   }

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("filter"),),
        body: Center(),
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.search),
          onPressed: (){}// => openfilter(context),
        ),
        
    );
  }
}