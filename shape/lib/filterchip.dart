import 'dart:convert';

import 'package:filter_list/filter_list.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;

import 'listcontroll.dart';

class FilterChipDisplay extends StatefulWidget {
  @override
  _FilterChipDisplayState createState() => _FilterChipDisplayState();
}

class _FilterChipDisplayState extends State<FilterChipDisplay> {

  List<String> resp = [];

  Future fdata () async{

    var fildata = await http.get(Uri.parse("http://192.168.29.222/neweasy/phpfiles/new.php"));
    
    resp = jsonDecode(fildata.body);  
     print(resp);
     return resp;
  }
 @override
  void initState() {
    // TODO: implement initState
    super.initState();
  fdata();
  }

  @override
  Widget build(BuildContext context) {
    List<String> alldata= resp.toList();
    return new Scaffold(
      appBar: AppBar(
        leading: IconButton(
            icon: Icon(Icons.kayaking, color: Colors.white,),
            onPressed: () {}),
        title: Text("Filter Result", style: TextStyle(color: Colors.white,),),
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.home, color: Colors.white,),
              onPressed: () {
                //
              }),
        ],
      ),
      body: Column(
        children: <Widget>[
          Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _titleContainer("Choose amenities"),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                  child: Wrap(
                    spacing: 5.0,
                    runSpacing: 3.0,
                    children:
                      alldata.map((b) => Text(b)).toList(),
                      //filterChipWidget(chipName: resp),
                      

                  ),  
              ),
            ),
          ),
          Divider(color: Colors.blueGrey, height: 10.0,),
          Align
            (
            alignment: Alignment.centerLeft,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: _titleContainer('Choose Neighborhoods'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:8.0),
            child: Align
              (
              alignment: Alignment.centerLeft,
              child: Container(
                child: Wrap(
                  spacing: 5.0,
                  runSpacing: 5.0,
                  children: <Widget>[
                    filterChipWidget(chipName: 'Upper Manhattan'),
                    
                  ],
                ),
              ),
            ),
          ),
          Divider(color: Colors.blueGrey, height: 10.0,),
        ],
      ),
    );
  }

}

Widget _titleContainer(String myTitle) {
  return Text(
    myTitle,
    style: TextStyle(
        color: Colors.black, fontSize: 24.0, fontWeight: FontWeight.bold),
  );
}

class filterChipWidget extends StatefulWidget {
  final String chipName ;

  filterChipWidget({Key? key, required this.chipName}) : super(key: key);

  @override
  _filterChipWidgetState createState() => _filterChipWidgetState();
}

class _filterChipWidgetState extends State<filterChipWidget> {
  var _isSelected = false;
 var controller = Get.put(selectcontroll());
  @override
  Widget build(BuildContext context) {
    return FilterChip(
      label: Text(widget.chipName),
      
      labelStyle: TextStyle(color: Color(0xff6200ee),fontSize: 16.0,fontWeight: FontWeight.bold),
      selected: _isSelected,
      shape:RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
            30.0),),
      backgroundColor: Color(0xffededed),
      onSelected: (isSelected) {
        setState(() {
          _isSelected = isSelected;
        });
        
        //  onApplyButtonClick: (list){
        // controller.setselectedlist(List<String>.from(list!));
        // Navigator.of(context).pop();
        // };
          RaisedButton(onPressed:(){
        controller.setselectedlist;
         Navigator.of(context).pop();
          } ,);
      },
      selectedColor: Color(0xffeadffd),);
  }
}

