import 'package:evently/core/theme/App_color.dart';
import 'package:evently/core/theme/App_theme.dart';
import 'package:evently/l10n/app_localizations.dart';
import 'package:evently/modules/layouts/screens/Home_screen.dart';
import 'package:evently/modules/layouts/screens/fav_screen.dart';
import 'package:evently/modules/layouts/screens/profile_screen.dart';
import 'package:flutter/material.dart';
import 'package:icons_plus_pro/icons_plus_pro.dart';
import 'package:evently/modules/layouts/widgets/event_widget.dart';

import '../../add_event/screens/add_event_screen.dart';

class LayoutScreens extends StatefulWidget {
  static const String routeName = "LayoutScreen";
  const LayoutScreens({super.key});

  @override
  State<LayoutScreens> createState() => _LayoutScreensState();
}

class _LayoutScreensState extends State<LayoutScreens> {
  int selected = 0 ;
  List<Widget> screens = [
    HomeScreen(),
    FavScreen(),
    ProfileScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    var theme=Theme.of(context);
    return Scaffold(
      body: screens[selected] ,
      floatingActionButton: FloatingActionButton(onPressed: (){Navigator.pushNamed(context, AddEventScreen.routeName).then((value) {
        setState(() {

        });
      },);},
        backgroundColor: theme.primaryColor,
        foregroundColor: Colors.white,
        child: Icon(Icons.add),
        shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50),
      ),),

      bottomNavigationBar: ClipRRect(
        borderRadius: BorderRadiusGeometry.only(topRight: Radius.circular(24),topLeft: Radius.circular(24)),
        child: BottomNavigationBar(
          onTap: (value) {
            selected=value;
            setState(() {

            });
          },
          currentIndex: selected,
            items: [
          BottomNavigationBarItem(icon: Icon(Iconsax.home_1_outline), activeIcon: Icon(Iconsax.home_1_bold),label: AppLocalizations.of(context)!.home),
          BottomNavigationBarItem(icon: Icon(Icons.favorite_border_outlined),activeIcon: Icon(Icons.favorite) ,label: AppLocalizations.of(context)!.fav),
          BottomNavigationBarItem(icon: Icon(Iconsax.profile_circle_outline),activeIcon: Icon(Iconsax.profile_circle_bold),label: AppLocalizations.of(context)!.profile),
        ]),
      ),
    );
  }
}
