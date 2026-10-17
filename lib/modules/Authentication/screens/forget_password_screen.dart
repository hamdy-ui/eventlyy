import 'package:evently/modules/Authentication/manger/auth_provider.dart';
import 'package:evently/modules/Authentication/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class ForgetPasswordScreen extends StatelessWidget {
  static const String routeName= "ForgetPasswordScreen";
  ForgetPasswordScreen({super.key});

  TextEditingController emailControllor = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Forget Password"),
          leading: IconButton(
            onPressed: (){
                Navigator.pushNamed(context, LoginScreen.routeName);
            },
            icon: const Icon(CupertinoIcons.back,),
            style: IconButton.styleFrom(
              foregroundColor: theme.primaryColor,
              padding: const EdgeInsets.all(8),
              backgroundColor: theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8),
                side: BorderSide(color: theme.primaryColor),
              ),
            ),
          ) ,

        ),

        body: Consumer<AuthProvider>(
          builder: (context, provider, child) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(children: [
                SizedBox(height: 32,),
                Image.asset("assets/icons/watching_hand.png",color: theme.primaryColor,),
                SizedBox(height: 40,),
                TextFormField(
                  controller: emailControllor,
                  decoration: InputDecoration(
                    hintText: AppLocalizations.of(context)!.enterYourEmail,
                    prefixIcon: ImageIcon(AssetImage("assets/icons/mail.png")),
                  ),
                ),
                SizedBox(height: 40,),
                ElevatedButton(onPressed: (){
                  provider.resetPassword(email: emailControllor.text, context: context) ;
                }, child: provider.isLoading ? Center(
                  child: SizedBox(
                      height: 20,
                      width: 20,
                      child: CircularProgressIndicator(color: Colors.white,)),
                ): Center(child: Text("Reset password")))
              ],
              ),
            ) ;

          },
        ),
      ),
    );
  }
}
