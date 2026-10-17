import 'package:evently/core/constant/app_category.dart';
import 'package:flutter/material.dart';

class TabWidget extends StatelessWidget {
  bool isSelected ;
  AppCategory category ;

  TabWidget({super.key,required this.isSelected,required this.category});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Tab(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 8,horizontal: 16),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: isSelected? theme.primaryColor : theme.primaryColorDark,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Icon(category.iconData,color:isSelected? null :theme.primaryColor,),
            SizedBox(width: 8,),
            Text(category.name,style: ThemeMode == ThemeMode.dark ? theme.textTheme.titleLarge : null )
          ],
        ),
      ),
    );
  }
}
