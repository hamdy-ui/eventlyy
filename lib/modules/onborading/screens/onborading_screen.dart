import 'package:evently/modules/onborading/screens/1.dart';
import 'package:evently/modules/onborading/screens/2.dart';
import 'package:evently/modules/onborading/screens/3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../l10n/app_localizations.dart';
import '../../Authentication/screens/login_screen.dart';


class OnboradingScreen extends StatefulWidget {
  static const String routeName = "OnboradingScreen";
  const OnboradingScreen({super.key});

  @override
  State<OnboradingScreen> createState() => _OnboradingScreenState();
}

class _OnboradingScreenState extends State<OnboradingScreen> {

  PageController pageController = PageController();
  int current_index = 0;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  current_index > 0 ? IconButton(
                    onPressed: (){
                      pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    },
                    icon: const Icon(CupertinoIcons.back),
                    style: IconButton.styleFrom(
                      padding: const EdgeInsets.all(8),
                      backgroundColor: theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                  ) : const SizedBox(width: 48),

                  Center(
                    child: Image.asset(
                      "assets/logos/smaller_evently_logo.png",
                      height: 27,
                      color: theme.primaryColor,
                    ),
                  ),

                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                        return const LoginScreen();
                      }));
                    },
                    child: Text(
                      AppLocalizations.of(context)!.skipOnborad,
                      style: theme.textTheme.titleSmall,
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                      backgroundColor: theme.scaffoldBackgroundColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                        side: BorderSide(color: theme.primaryColor),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 24),
              current_index == 0 ?Center(child: Image.asset("assets/images/onbord1.png",color: theme.primaryColorLight,width: 320,)) : current_index == 1 ?Center(child: Image.asset("assets/images/onbord2.png",color: theme.primaryColorLight,width: 343,)) : Center(child: Image.asset("assets/images/onbord3.png",color: theme.primaryColorLight,width: 343,)),
              SizedBox(height: 5,),
              Center(
                child: SmoothPageIndicator(
                  controller: pageController,
                  count: 3,
                  effect: ExpandingDotsEffect(
                    activeDotColor: theme.primaryColor,
                    dotColor: Colors.grey.shade400,
                    dotHeight: 8,
                    dotWidth: 8,
                    expansionFactor: 3,
                    spacing: 8,
                  ),
                ),
              ),
              Expanded(
                child: PageView(
                  controller: pageController,
                  onPageChanged: (value) {
                    setState(() {
                      current_index = value;
                    });
                  },
                  children: [
                    Onee(),
                    Twoo1(),
                    three(),
                  ],
                ),
              ),

              SizedBox(height: 16),

              SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  if(current_index == 2){
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) {
                      return const LoginScreen();
                    }));
                  } else {
                    pageController.nextPage(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                    );
                  }
                },
                child: Center(
                  child: Text(
                    current_index == 2 ? AppLocalizations.of(context)!.finishOnborad : AppLocalizations.of(context)!.btnOnborad,
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 20,
                      color: Colors.white,
                    ),
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  backgroundColor: theme.primaryColor,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                  padding: const EdgeInsets.all(10),
                  elevation: 0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}