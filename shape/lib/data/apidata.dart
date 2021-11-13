class User{
   String? calrnm;
  String? cut;
  String? pol;
  String? sym;
  String? colornm;
  String? shapenm;
  String? cert;

  User({
    required this.calrnm,
    required this.cut,
    required this.pol,
    required this.sym,
    required this.colornm,
    required this.shapenm,
    required this.cert,
  
  
  });

   User.fromJson(Map<String, dynamic> json){
   calrnm= json["calrnm"];
   cut= json["cut"];
   pol= json["pol"];
   sym= json["sym"];
   colornm= json["colornm"];
   shapenm= json["shapenm"];
   cert= json["cert"];
  }
}

