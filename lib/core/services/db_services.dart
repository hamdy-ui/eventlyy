import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class DbServices {
 static var  firebase = FirebaseFirestore.instance;
 
 static Future<void> addEvent(EventModel event)async{
   var doc = await firebase.collection("Events").doc();
   event.id = doc.id;
   doc.set(event.tojson());
 }

 static Future <List<EventModel>>getEvents()async{
   List<EventModel> events = [] ;
   var data = await firebase.collection("Events").get();

   for(var e in data.docs){
     var event = EventModel.fromJson(e.data());
     events.add(event);
   }

   return events;


 }


 static Future<void> updateEvent(EventModel event) async {
   await firebase.collection("Events").doc(event.id).update(event.tojson());
 }

 static Future<void>toggleFav(EventModel event)async{
   var userid =FirebaseAuth.instance.currentUser!.uid;
   if(event.userFav.contains(userid)){
     event.userFav.remove(userid);
   }else{
     event.userFav.add(userid);
   }

   var doc = await firebase.collection("Events").doc(event.id).update(event.tojson());
 }


 static Future<EventModel?> getEventById(String eventId) async {
   var doc = await firebase.collection("Events").doc(eventId).get();
   if (doc.exists && doc.data() != null) {
     return EventModel.fromJson(doc.data()!);
   }
   return null;
 }
}