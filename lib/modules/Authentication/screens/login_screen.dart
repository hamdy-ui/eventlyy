import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/Authentication/screens/forget_password_screen.dart';
import 'package:evently/modules/Authentication/screens/register_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../manger/auth_provider.dart';

class LoginScreen extends StatelessWidget {
  static const String routeName = "LoginScreen" ;
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailControllor = TextEditingController();
    TextEditingController passwordControllor = TextEditingController();

    var theme =Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(17),
          child: SafeArea(child:
          Consumer<AuthProvider>(
            builder: (context, provider, child) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.asset("assets/logos/smaller_evently_logo.png")),
                  SizedBox(height: 48,),
                  Text(AppLocalizations.of(context)!.loginToYourAccount,style: theme.textTheme.titleMedium!.copyWith(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                  ),),
                  SizedBox(height: 24,),
                  TextFormField(
                    controller: emailControllor,
                    decoration: InputDecoration(
                      hintText: AppLocalizations.of(context)!.enterYourEmail,
                      prefixIcon: ImageIcon(AssetImage("assets/icons/mail.png")),
                    ),
                  ),
                  SizedBox(height: 16,),
                  TextFormField(
                    controller: passwordControllor,
                    decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterYourPassword,
                        prefixIcon: FittedBox(child: ImageIcon(AssetImage("assets/icons/lock.png")), fit:BoxFit.scaleDown,),
                        suffixIcon: FittedBox(child: ImageIcon(AssetImage("assets/icons/eye_slash.png")),fit: BoxFit.scaleDown,)
                    ),
                  ),
                  SizedBox(height: 8,),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, ForgetPasswordScreen.routeName);
                    },
                    child: Align(
                        alignment: AlignmentGeometry.centerEnd,
                        child: Text(AppLocalizations.of(context)!.forgetPassword,style: theme.textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: theme.primaryColor
                        ))),
                  ),
                  SizedBox(height: 48,),
                  ElevatedButton(onPressed: (){
                    provider.login(email: emailControllor.text, password: passwordControllor.text, context: context);
                  }, child: provider.isLoading ?  Center(
                    child: SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(color: Colors.white,)),
                  ) : Center(child: Text(AppLocalizations.of(context)!.login))),
                  SizedBox(height: 48,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(AppLocalizations.of(context)!.dontHaveAnAccount,style: theme.textTheme.bodyMedium,),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context,RegisterScreen.routeName);
                        },
                        child: Text(AppLocalizations.of(context)!.signup,style: theme.textTheme.titleMedium!.copyWith(
                            decoration: TextDecoration.underline,
                            decorationColor: theme.primaryColor
                        )),
                      )
                    ],),
                  SizedBox(height: 32,),
                  Center(child: Text(AppLocalizations.of(context)!.or,style:theme.textTheme.titleMedium ,)),
                  SizedBox(height: 24,),
                  ElevatedButton(onPressed: (){
                    provider.googlecreateAccount(context: context);
                  }, style:ElevatedButton.styleFrom(
                    backgroundColor: theme.scaffoldBackgroundColor,
                    foregroundColor: theme.primaryColor,
                    shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                    side: BorderSide(color: theme.primaryColor),)

                  ),child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Image.asset("assets/logos/google.png",width: 24,height: 24,),
                    SizedBox(width: 16,),
                    Center(child: Text(AppLocalizations.of(context)!.loginToYourAccountUsingGoogle))
                  ],)) ,
                  


                ],) ;
            },
          )),
        ),
      ),
    );
  }
}
