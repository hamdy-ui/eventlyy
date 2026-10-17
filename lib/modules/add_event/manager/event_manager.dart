import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:evently/core/constant/app_category.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/db_services.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../core/toast_service/toast.dart';

class EventProvider extends ChangeNotifier {


  int index = 0;

  AppCategory  selectedCategory = AppCategory.categories.first;


  TextEditingController titleController = TextEditingController();

  TextEditingController descController = TextEditingController();


  DateTime? selectedDateTime ;

  TimeOfDay? selectTimeofDay ;

  void changeIndex(int value ){
    index = value ;
    selectedCategory =AppCategory.categories[index];
    notifyListeners();
  }

  void ChangeDate(DateTime date){
    selectedDateTime= date ;
    notifyListeners();

  }


  void ChangeTime(TimeOfDay time){
    selectTimeofDay  = time ;
    notifyListeners();

  }
  
  
  bool isLoading = false;

  void addEvent(BuildContext context)async{
    isLoading = true ;
    notifyListeners();
    await DbServices.addEvent(EventModel(id: "", categoryID: selectedCategory.id, title: selectedCategory.name, date: selectedDateTime.toString(), time: selectTimeofDay!.format(context), desc: descController.text));


    isLoading = false ;
    Navigator.pop(context);
    notifyListeners();
  }

  Future<void> updateEvent(BuildContext context, String eventId) async {
    if (selectedDateTime == null || selectTimeofDay == null) {
      Toast.show(title: "Please choose Date and Time", context: context);
      return;
    }

    isLoading = true;
    notifyListeners();

    try {
      EventModel updatedEvent = EventModel(
        id: eventId,
        categoryID: selectedCategory.id,
        title: titleController.text,
        desc: descController.text,
        date: DateFormat('yyyy-MM-dd').format(selectedDateTime!),
        time: selectTimeofDay!.format(context),
      );


      await DbServices.updateEvent(updatedEvent);

      isLoading = false;
      notifyListeners();


      Toast.show(title: "Event Updated Successfully",context: context);
      Navigator.pop(context);
    } catch (e) {
      isLoading = false;
      notifyListeners();
      Toast.show(title: "Failed to update event: $e",context: context);
    }
  }

  void initForEdit(EventModel event) {
    titleController.text = event.title;
    descController.text = event.desc;


    int foundIndex = AppCategory.categories.indexWhere((cat) => cat.id == event.categoryID);
    if (foundIndex != -1) {
      index = foundIndex;
      selectedCategory = AppCategory.categories[index];
    }

    try {
      selectedDateTime = DateTime.parse(event.date);
    } catch (_) {
      selectedDateTime = DateTime.now();
    }

    notifyListeners();
  }





}