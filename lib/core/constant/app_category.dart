import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';

import '../../l10n/app_localizations.dart';

class AppCategory {
  String id ;
  String name ;
  String image ;
  IconData iconData ;


  AppCategory({required this.id,required this.name,required this.image,required this.iconData}) ;


  static List<AppCategory>categories =[
    AppCategory(id:"sport" , name: "Sport", image: "assets/category/Sport.png", iconData: Icons.sports,),
    AppCategory(id:"meeting" , name:"Metting" , image: "assets/category/Meeting.png", iconData: Icons.meeting_room,),
    AppCategory(id:"exhibition" , name: "Exhintation", image: "assets/category/Exhibition.png", iconData: CupertinoIcons.exclamationmark,),
    AppCategory(id: "bookclub", name: "Book Club", image: "assets/category/Book Club.png", iconData: CupertinoIcons.book,),
    AppCategory(id: "birthday", name: "Birth day", image: "assets/category/Birthday.png", iconData: LineAwesome.birthday_cake_solid,),
  ];

}

