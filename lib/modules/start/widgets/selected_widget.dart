import 'package:flutter/material.dart';

import '../../../core/theme/App_color.dart';

class SelectedWidget extends StatelessWidget {
  bool isSelected= true ;
  String? title  ;
  String? icon ;
  void Function()? onTap;

  SelectedWidget({super.key,required this.isSelected,this.title,this.icon,required this.onTap}){
    if(icon == null && title ==null){
      throw "Icon or title must be assigned";
    }
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme .of(context);
    return GestureDetector(
      onTap:onTap ,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 16),
        decoration: BoxDecoration(
          border: Border.all(
            color: theme.dividerColor
          ),
          borderRadius: BorderRadius.circular(8),
          color: isSelected ? theme.primaryColor : theme.scaffoldBackgroundColor,
        ),
        child: icon != null ? ImageIcon(AssetImage(icon!),size: 24,color: isSelected? Colors.white : theme.primaryColorLight,):Text(title!,
          style: TextStyle(
            color: isSelected ? Colors.white : theme.primaryColorLight,
            fontSize: 14,
            fontWeight: isSelected ?FontWeight.w600 : FontWeight.w400,
      
          ),
        ),
      ),
    );
  }
}
