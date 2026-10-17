import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/theme/App_theme.dart';
import 'package:evently/modules/Authentication/screens/forget_password_screen.dart';
import 'package:evently/modules/Authentication/screens/login_screen.dart';
import 'package:evently/modules/Authentication/screens/register_screen.dart';
import 'package:evently/modules/add_event/screens/add_event_screen.dart';
import 'package:evently/modules/add_event/screens/event_details.dart';
import 'package:evently/modules/layouts/screens/layout_screens.dart';
import 'package:evently/modules/onborading/screens/onborading_screen.dart';
import 'package:evently/modules/start/screens/Start_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';
import 'l10n/app_localizations.dart';
import 'modules/splash/screens/spalsh_screen.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AppProvider(),
      builder:(context, child) {
        var provider = Provider.of<AppProvider>(context);
        return MaterialApp(
          routes: {
            SpalshScreen.routeName : (_) => SpalshScreen(),
            StartScreen.routeName : (_) => StartScreen(),
            OnboradingScreen.routeName : (context) => OnboradingScreen(),
            LoginScreen.routeName : (context) => LoginScreen(),
            RegisterScreen.routeName : (context) => RegisterScreen(),
            ForgetPasswordScreen.routeName : (context) => ForgetPasswordScreen(),
            LayoutScreens.routeName : (context) => LayoutScreens(),
            AddEventScreen.routeName : (context) => AddEventScreen(),
            EventDetails.routeName : (context) => EventDetails(),
          },
          initialRoute: SpalshScreen.routeName,



          locale: Locale(provider.locale),
          localizationsDelegates: [
            AppLocalizations.delegate, // Add this line
            ...GlobalMaterialLocalizations.delegates,
          ],
          supportedLocales: [
            Locale('en'), // English
            Locale('ar'), // arabic
          ],
          themeMode: provider.themeMode,
          theme: AppTheme.lightTheme,
          darkTheme: AppTheme.DarkTheme,
        );
      },
    );
  }
}
