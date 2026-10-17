import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/Authentication/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var user = FirebaseAuth.instance.currentUser!;
    var theme= Theme.of(context);
    var provider =Provider.of<AppProvider>(context);
    return SafeArea(
        child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              Center(
                child: CircleAvatar(
                  radius: 80,
                  foregroundImage: AssetImage("assets/images/route.png"),
                ),
              ),
              SizedBox(height: 16,),
              Text(user.displayName??"",style: theme.textTheme.titleLarge,),
              SizedBox(height: 4,),
              Text(user.email??"",style: theme.textTheme.bodyMedium,),
              SizedBox(height: 32,),
              Container(
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  border: Border.all(color: theme.dividerColor),
                  borderRadius: BorderRadius.circular(16),
                  color: theme.primaryColorDark
                ),

                child: Row(children: [
                Expanded(child: Text(AppLocalizations.of(context)!.darkmode,style: theme.textTheme.titleLarge,)),
                 SizedBox(
                   height: 36,
                   child: Transform.scale(
                     scale: 0.8,
                     child: Switch(
                       activeTrackColor: theme.primaryColor,
                       inactiveTrackColor: theme.scaffoldBackgroundColor,
                       value: provider.themeMode == ThemeMode.dark, onChanged: (value) {
                         provider.changeTheme(value ? ThemeMode.dark : ThemeMode.light);

                     },),
                   ),
                 )
              ],),),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  showModalBottomSheet(context: context,backgroundColor: theme.scaffoldBackgroundColor,showDragHandle: true, builder: (context) {
                    return Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        children: [
                          Center(child: Text(AppLocalizations.of(context)!.language,style: theme.textTheme.titleMedium,),),
                          SizedBox(height: 24,),
                          GestureDetector(
                            onTap: () {
                              provider.changeLang("ar");
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  border: Border.all(color:provider.locale == "ar" ? theme.primaryColor:theme.dividerColor),
                                  borderRadius: BorderRadius.circular(16),
                                  color: theme.primaryColorDark
                              ),

                              child: Row(children: [
                                Expanded(child: Text(AppLocalizations.of(context)!.arabic,style: theme.textTheme.titleLarge,)),
                                Icon(Icons.arrow_forward_ios_outlined,color: theme.primaryColor,)
                              ],),),
                          ),
                          SizedBox(height: 16,),
                          GestureDetector(
                            onTap: () {
                              provider.changeLang("en");
                            },
                            child: Container(
                              padding: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                  border: Border.all(color:provider.locale == "en" ? theme.primaryColor : theme.dividerColor),
                                  borderRadius: BorderRadius.circular(16),
                                  color: theme.primaryColorDark
                              ),

                              child: Row(children: [
                                Expanded(child: Text(AppLocalizations.of(context)!.english,style: theme.textTheme.titleLarge,)),
                                Icon(Icons.arrow_forward_ios_outlined,color: theme.primaryColor,)
                              ],),),
                          ),
                        ],
                      ),
                    );
                  },);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: theme.dividerColor),
                      borderRadius: BorderRadius.circular(16),
                      color: theme.primaryColorDark
                  ),

                  child: Row(children: [
                    Expanded(child: Text(AppLocalizations.of(context)!.language,style: theme.textTheme.titleLarge,)),
                    Icon(Icons.arrow_forward_ios_outlined,color: theme.primaryColor,)
                  ],),),
              ),
              SizedBox(height: 16,),
              GestureDetector(
                onTap: () {
                  FirebaseAuth.instance.signOut();
                  Navigator.pushReplacementNamed(context, LoginScreen.routeName);
                },
                child: Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                      border: Border.all(color: theme.dividerColor),
                      borderRadius: BorderRadius.circular(16),
                      color: theme.primaryColorDark
                  ),

                  child: Row(children: [
                    Expanded(child: Text(AppLocalizations.of(context)!.logout,style: theme.textTheme.titleLarge,)),
                    SizedBox(
                      height: 36,
                      child: Transform.scale(
                        scale: 0.8,
                        child: SizedBox(

                            child: Icon(Icons.logout,color: Colors.red,)),
                      ),
                    )
                  ],),),
              ),


            ],),
          ),

    );
  }
}
