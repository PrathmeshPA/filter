import 'dart:convert';

import 'package:abcd/data/filterdata.dart';
import 'package:abcd/nav.dart';
import 'package:abcd/shapes.dart';
import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'data/apidata.dart';
import 'nav.dart';
import 'listcontroll.dart';

List<dynamic> shname = ["CUSHION","PEAR","OVAL","ROUND","PRINCESS","HEART", "RADIANT","EMERALD","ASSCHER","MARQUISE",];

List<dynamic> colname = ["D", "E", "F","G","H","I","J","K" "L","M", "N",];

List<dynamic> Clarity=[ "IF","VVS1","VVS2","VS1","VS2","SI1","SI2","SI3", "I1", "I2", "I3",];

List<dynamic> Labcert = ["GIA" , "IGI" ,"GSI"];

List<dynamic> cut = ["EX", "VD","GD","F"];

List<dynamic> pol = ["VD", "ED","GD","F"];

List<dynamic> sym = ["GD", "EX","GD","F"];

class FilterChipDisplay extends StatefulWidget {
  // late final filterv filterveg;
  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {
  

  var controller = Get.put(selectcontroll());

  //List<String> selectedFilter = [];

  // Future fdata() async {

  //   return data;
  // }

  List ondataa = [];
late String chooseval;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // fdata();
  }

  @override
  Widget build(BuildContext context) {
    // List<String> newdata = controller.selectedlist.toList();
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
            onPressed: () {}),
        title: Text(
          "Filter Result",
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        actions: <Widget>[
          IconButton(
              icon: Icon(
                Icons.check,
              ),
              onPressed: () async {
                // var fildata = await http
                //     .get(Uri.parse("http://192.168.29.222/neweasy/test.json"));

                // final fdata = jsonDecode(fildata.body) as List<dynamic>;

                // controller.selectedlist.forEach((elemen) {
                //   String filter = elemen;
                //   ondataa = fdata
                //       .where((element) => element.containsValue(filter))
                //       .toList();
                //   print(ondataa);
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => filterdata()));
                //   // );
                // });

                // controller.selectedlist.value = (List<String>.from(shname));
                // Wrap(
                //   children: controller.selectedlist
                //       .map((e) => Padding(
                //             padding: const EdgeInsets.all(8),
                //             child: Chip(
                //               label: Text(e),
                //             ),
                //           ))
                //       .toList(),
                // );
                // Navigator.push(context,
                //     MaterialPageRoute(builder: (context) => filterdata()));
              }),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose Shapes",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children: shname.map((b) => shape(b)).toList(),
                     
      
                    // filterChipWidget(chipName: "resp"),
                  ),
                ),
              ),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     itemCount: ondataa.length,
            //     itemBuilder: (BuildContext context,index) {
            //       return Card(
            //         child: Column(
            //           children: [
            //             Text(ondataa[index].toString()),
                        //Text(ondataa[index])
                    //    Wrap(
                    //   spacing: 5.0,
                    //   runSpacing: 3.0,
                    //   children:
                    //     //User.map((b) => shape(b)).toList,
                    //    // filterChipWidget(chipName: "resp"),
      
                    // )
                //       ],
                //     ),
                //   );
                // }
                // )
                // ),
      
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Colors',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    colname.map((a) => cname(a)).toList(),
                  ),
                ),
              ),
            ),
             Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Clarity',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    Clarity.map((c) => clarname(c)).toList(),
                  ),
                ),
              ),
            ),
            // RaisedButton(onPressed: onPressed),
      
            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
      
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Lab Certificate',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    Labcert.map((l) => Lcert(l)).toList(),
                  ),
                ),
              ),
            ),
      
             Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Cut',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    cut.map((cu) => cutname(cu)).toList(),
                  ),
                ),
              ),
            ),

            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),  
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Polish',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    pol.map((po) => polname(po)).toList(),
                  ),
                ),
              ),
            ),

            Divider(
              color: Colors.blueGrey,
              height: 10.0,
            ),  
             Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Choose Symmetry',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Container(
                  child: Wrap(
                  spacing: 5.0, 
                  runSpacing: 5.0, 
                  children: 
                    sym.map((sy) => symname(sy)).toList(),
                  ),
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }




  Widget shape(String b) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(b),
        selected: controller.selectedlist.contains(b),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(b);
            else
              controller.selectedlist.remove(b);
          });
        });
  }

  Widget cname(String a) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(a),
        selected: controller.selectedlist.contains(a),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(a);
            else
              controller.selectedlist.remove(a);
          });
        });
  }

  Widget clarname(String c) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(c),
        selected: controller.selectedlist.contains(c),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(c);
            else
              controller.selectedlist.remove(c);
          });
        });
  }


   Widget Lcert(String l) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(l),
        selected: controller.selectedlist.contains(l),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(l);
            else
              controller.selectedlist.remove(l);
          });
        });
  }

  Widget cutname(String cu) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(cu),
        selected: controller.selectedlist.contains(cu),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(cu);
            else
              controller.selectedlist.remove(cu);
          });
        });
  }

  Widget polname(String cu) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(cu),
        selected: controller.selectedlist.contains(cu),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(cu);
            else
              controller.selectedlist.remove(cu);
          });
        });
  }

  Widget symname(String sy) {
    return FilterChip(
        //avatar: Text(""),
        label: Text(sy),
        selected: controller.selectedlist.contains(sy),
        onSelected: (bool sele) {
          setState(() {
            if (sele)
              controller.selectedlist.add(sy);
            else
              controller.selectedlist.remove(sy);
          });
        });
  }
}

// Widget _titleContainer(String myTitle) {
//   return Text(
//     myTitle,
//     style: TextStyle(
//         color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
//   );
// }




// class filterChipWidget extends StatefulWidget {
//   final String chipName;

//   filterChipWidget({Key? key, required this.chipName}) : super(key: key);

//   @override
//   _filterChipWidgetState createState() => _filterChipWidgetState();
// }

// class _filterChipWidgetState extends State<filterChipWidget> {
//   var _isSelected = false;
//   var controller = Get.put(selectcontroll());
//   @override
//   Widget build(BuildContext context) {
//     return FilterChip(
//       label: Text(widget.chipName),

//       //labelStyle: TextStyle(color: Color(0xff6200ee),fontSize: 16.0,fontWeight: FontWeight.bold),
//       selected: _isSelected,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(30.0),
//       ),
//       //backgroundColor: Color(0xffededed),
//       onSelected: (isSelected) {
//         setState(() {
//           _isSelected = isSelected;
//         });

//         //  onApplyButtonClick: (list){
//         // controller.setselectedlist(List<String>.from(list!));
//         // Navigator.of(context).pop();
//         // };
//         //   RaisedButton(onPressed:(){
//         // controller.setselectedlist;
//         //  Navigator.of(context).pop();
//         //   } ,);
//       },
//       selectedColor: Color(0xffeadffd),
//     );
//   }
// }

