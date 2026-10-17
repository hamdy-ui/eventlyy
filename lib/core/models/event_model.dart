import 'package:firebase_auth/firebase_auth.dart';

class EventModel {
  String id ;
  String? userID ;
  String categoryID ;
  String title ;
  String desc ;
  String time;
  String date ;


  List<String> userFav ;

  EventModel({required this.id, required this.categoryID, required this.title, required this.date , required this.time , required this.desc,this.userID,
    this.userFav=const []
  }) ;


  Map<String, dynamic> tojson() {
    String userID = FirebaseAuth.instance.currentUser!.uid;
    return {
      "id" : id ,
      "categoryID" : categoryID ,
      "title" : title ,
      "desc" : desc ,
      "time" : time ,
      "date" : date,
      "userID" : userID,
      "userFav" : userFav
    };
  }


  factory EventModel.fromJson(Map<String , dynamic> json) {
    List fav = json["userFav"]??[];
    return EventModel(id: json["id"],categoryID:json["categoryID"],title: json["title"] ,desc:json["desc"],date: json["date"],time:json["time"], userID: json["userID"],
        userFav:fav.map<String>((e) {
      return e.toString();
    },).toList()   );
  }
}