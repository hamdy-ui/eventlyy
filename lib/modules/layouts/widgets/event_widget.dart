import 'package:evently/core/constant/app_category.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';

class EventWidget extends StatelessWidget {

  EventModel event ;

  Function onTapFav ;
  EventWidget({super.key, required this.event, required this.onTapFav});

  @override
  Widget build(BuildContext context) {
    var theme= Theme.of(context);
    var category = AppCategory.categories.firstWhere((element) {
      return element.id == event.categoryID ;
    },);
    return Container(
      padding: EdgeInsets.all(8),
      width: double.infinity,
      height: 200,
      decoration:BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: Colors.white,
        image: DecorationImage(image: AssetImage(category.image)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.scaffoldBackgroundColor
            ),
            child: Text(event.time,style: theme.textTheme.titleMedium,),
          ),
          Spacer(),
          Container(
            padding: EdgeInsets.all(8),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                color: theme.scaffoldBackgroundColor
            ),
            child: Row(children: [
              Text(event.title,style: theme.textTheme.titleLarge!.copyWith(
                  fontSize: 14,
                  fontWeight: FontWeight.w500
              ),) ,
              Spacer(),
              InkWell(
                onTap: () {
                  onTapFav();
                },
                  child: Icon(event.userFav.contains(FirebaseAuth.instance.currentUser!.uid) ? CupertinoIcons.heart_fill : CupertinoIcons.heart,color: theme.primaryColor,)),
            ],),
          )
        ],),
    );
  }
}
