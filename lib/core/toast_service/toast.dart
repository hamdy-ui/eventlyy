import 'package:flutter/material.dart';

class Toast {
 static void show({required String title , required BuildContext context, ToastType type =ToastType.sucess}) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        elevation: 0,
        behavior: SnackBarBehavior.floating,
        backgroundColor: type.color,
        shape: OutlineInputBorder(borderRadius: BorderRadius.circular(16),borderSide:BorderSide(color: Colors.transparent)),


        content: Text(title),
      ),
    );
  }
}


enum ToastType{
  error(color: Colors.red),
  sucess(color: Colors.green);


  final Color color;

  const ToastType({required this.color});


}
