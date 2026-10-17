import 'package:evently/core/toast_service/toast.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../layouts/screens/layout_screens.dart';
import '../services/auth_services.dart';

class AuthProvider extends ChangeNotifier{
  bool isLoading = false ;
  late User user ;

    Future<void> createAccount({required String email , required String password , required String name,required BuildContext context})async{
      isLoading = true ;
      notifyListeners();

      try{
       user = await AuthServices.createAccount(
            email: email,
            password: password,
            name: name
       );

       Toast.show(title: "Welcome $name", context: context);
      }catch(e){
        Toast.show(title: e.toString(), context: context,type: ToastType.error);

      }


      isLoading=false;
      notifyListeners();

    }

    Future<void> login({required String email , required String password ,required BuildContext context})async{
    isLoading = true ;
    notifyListeners();

    try{
      user = await AuthServices.login(
          email: email,
          password: password,
      );

      if(user.emailVerified){
        Toast.show(title: "Welcome Back ${user.displayName}", context: context);
      }else{
        await user.sendEmailVerification();
        Toast.show(title: "Chech your email ", context: context);
      }

    }catch(e){
      Toast.show(title: e.toString(), context: context,type: ToastType.error);

    }


    isLoading=false;
    notifyListeners();

  }

  Future<void> resetPassword({required String email ,required BuildContext context})async{
    isLoading = true ;
    notifyListeners();

    try{
      await AuthServices.resetPassword(
        email: email,
      );

      Toast.show(title: "Check your email", context: context);
    }catch(e){
      Toast.show(title: e.toString(), context: context,type: ToastType.error);

    }


    isLoading=false;
    notifyListeners();

  }


  Future<void> googlecreateAccount({required BuildContext context})async{
    isLoading = true ;
    notifyListeners();

    try{
      await AuthServices.signInWithGoogle();

      Toast.show(title: "You Have Sign in Successfully", context: context);
      Navigator.pushReplacementNamed(context, LayoutScreens.routeName);
    }catch(e){
      Toast.show(title: e.toString(), context: context,type: ToastType.error);

    }


    isLoading=false;
    notifyListeners();

  }




}