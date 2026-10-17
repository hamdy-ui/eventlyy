import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/onborading/screens/onborading_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/theme/App_color.dart';
import '../widgets/selected_widget.dart';

class StartScreen extends StatelessWidget {
  static const String routeName= "StartScreen";
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Hero(
                tag: "logo",
                child: Center(
                  child: Image.asset(
                    "assets/logos/eventlyLogo.png",
                    width: 142,
                    color: theme.primaryColor,
                  ),
                ),
              ),
              SizedBox(height: 24),
              Center(child: Image.asset("assets/images/being-creative.png",color: theme.primaryColorLight,)),
              SizedBox(height: 24),
              Text(
                AppLocalizations.of(context)!.titleStart,
                style: theme.textTheme.titleLarge,

              ),
              SizedBox(height: 8),
              Text(
                AppLocalizations.of(context)!.desStart,
                style: theme.textTheme.bodyMedium,
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(AppLocalizations.of(context)!.langStart,
                      style:theme.textTheme.titleLarge
                    ),
                  ),

                  SelectedWidget(onTap:() {
                    provider.changeLang("en") ;
                    
                  } ,title: AppLocalizations.of(context)!.english, isSelected: provider.locale == "en",
                  ),
                  SizedBox(width: 8),
                  SelectedWidget(onTap: () {
                    provider.changeLang("ar") ;
                  } ,title: AppLocalizations.of(context)!.arabic, isSelected: provider.locale == "ar",),
                ],
              ),
              SizedBox(height: 16),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      AppLocalizations.of(context)!.themeStart,
                      style: theme.textTheme.titleLarge
                    ),
                  ),

                  SelectedWidget(
                    onTap: () {
                      provider.changeTheme(ThemeMode.light);
                    },

                    icon: "assets/icons/sun.png",
                    isSelected: provider.themeMode == ThemeMode.light,
                  ),
                  SizedBox(width: 8),
                  SelectedWidget(
                    onTap: () {
                      provider.changeTheme(ThemeMode.dark);
                    },
                    icon: "assets/icons/moon.png",
                    isSelected: provider.themeMode == ThemeMode.dark,
                  ),
                ],
              ),
              SizedBox(height: 29),
              ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, OnboradingScreen.routeName);
                },
                child: Center(
                  child: Text(
                      AppLocalizations.of(context)!.letsStart,
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(16)),
                  padding: EdgeInsets.all(10),
                  elevation: 0
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
