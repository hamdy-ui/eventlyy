import 'package:evently/modules/Authentication/manger/auth_provider.dart';
import 'package:evently/modules/Authentication/screens/login_screen.dart';
import 'package:evently/modules/Authentication/services/auth_services.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class RegisterScreen extends StatelessWidget {
  static const String routeName = "RegisterScreen";
  RegisterScreen({super.key});

  TextEditingController namecontroller = TextEditingController();
  TextEditingController Emailcontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController repasswordcontroller = TextEditingController();

  GlobalKey<FormState> formState = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AuthProvider(),
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(17),
          child: SafeArea(
            child: Consumer<AuthProvider>(
              builder: (context, provider, child) {
                return Form(
                  key: formState,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Image.asset(
                          "assets/logos/smaller_evently_logo.png",
                        ),
                      ),
                      SizedBox(height: 48),
                      Text(
                        AppLocalizations.of(context)!.createYourAccount,
                        style: theme.textTheme.titleMedium!.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 24),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: namecontroller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "enter name";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(context)!.enterYourName,
                          prefixIcon: FittedBox(
                            child: ImageIcon(
                              AssetImage("assets/icons/user.png"),
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: Emailcontroller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "enter an email";
                          } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+",
                          ).hasMatch(value)) {
                            return "enter vaild email";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.enterYourEmail,
                          prefixIcon: ImageIcon(
                            AssetImage("assets/icons/mail.png"),
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: passwordcontroller,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "enter a password";
                          } else if (value.length < 6) {
                            return "password  length must be more than 6 letter";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.enterYourPassword,
                          prefixIcon: FittedBox(
                            child: ImageIcon(
                              AssetImage("assets/icons/lock.png"),
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: FittedBox(
                            child: ImageIcon(
                              AssetImage("assets/icons/eye_slash.png"),
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: repasswordcontroller,
                        validator: (value) {
                          if (value != passwordcontroller.text) {
                            return "the password not match the password you entered before";
                          }
                        },
                        decoration: InputDecoration(
                          hintText: AppLocalizations.of(
                            context,
                          )!.confirmYourPassword,
                          prefixIcon: FittedBox(
                            child: ImageIcon(
                              AssetImage("assets/icons/lock.png"),
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                          suffixIcon: FittedBox(
                            child: ImageIcon(
                              AssetImage("assets/icons/eye_slash.png"),
                            ),
                            fit: BoxFit.scaleDown,
                          ),
                        ),
                      ),

                      SizedBox(height: 48),
                      Center(
                        child: ElevatedButton(
                          onPressed: () {
                            if (formState.currentState!.validate()) {
                              provider.createAccount(
                                email: Emailcontroller.text,
                                password: passwordcontroller.text,
                                name: namecontroller.text,
                                context: context,
                              );
                            }
                          },
                          child: Center(
                            child: provider.isLoading ? SizedBox(
                              height: 20,
                                width: 20,
                                child: CircularProgressIndicator(color: Colors.white,)):Text(AppLocalizations.of(context)!.signUp),
                          ),
                        ),
                      ),
                      SizedBox(height: 48),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            AppLocalizations.of(context)!.alreadyHaveAnAccount,
                            style: theme.textTheme.bodyMedium,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushReplacementNamed(
                                context,
                                LoginScreen.routeName,
                              );
                            },
                            child: Text(
                              AppLocalizations.of(context)!.login,
                              style: theme.textTheme.titleMedium!.copyWith(
                                decoration: TextDecoration.underline,
                                decorationColor: theme.primaryColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 32,),
                      Center(child: Text(AppLocalizations.of(context)!.or,style:theme.textTheme.titleMedium ,)),
                      SizedBox(height: 24,),
                      ElevatedButton(onPressed: (
                          ){
                        provider.googlecreateAccount(context: context);
                      }, style:ElevatedButton.styleFrom(
                          backgroundColor: theme.scaffoldBackgroundColor,
                          foregroundColor: theme.primaryColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                            side: BorderSide(color: theme.primaryColor),)

                      ),child:  provider.isLoading ? Center(
                        child: SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(color: Colors.white,)),
                      ) : Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset("assets/logos/google.png",width: 24,height: 24,),
                          SizedBox(width: 16,),
                          Center(child: Text(AppLocalizations.of(context)!.signUpWithGoogle))
                        ],)) ,
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
