import 'dart:math';

import 'package:evently/core/app_provider/app_provider.dart';
import 'package:evently/core/constant/app_category.dart';
import 'package:evently/core/models/event_model.dart';
import 'package:evently/core/services/db_services.dart';
import 'package:evently/modules/add_event/screens/add_event_screen.dart';
import 'package:evently/modules/add_event/screens/event_details.dart';
import 'package:evently/modules/layouts/widgets/event_widget.dart';
import 'package:evently/modules/layouts/widgets/tab_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../l10n/app_localizations.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int index = 0 ;


  @override
  Widget build(BuildContext context) {
    var user =FirebaseAuth.instance.currentUser!;
    var theme=Theme.of(context);
    var provider = Provider.of<AppProvider>(context);
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(children: [
            Row(children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                  Text(AppLocalizations.of(context)!.welcome),
                  Text(user.displayName?? "",style: theme.textTheme.titleLarge,),
                ],),
              ),
              Image.asset(provider.themeMode == ThemeMode.light ?"assets/icons/sun.png" : "assets/icons/moon.png" ,color: theme.primaryColor,width: 27,height: 27,),
              SizedBox(width: 8,),
              Container(
                padding: EdgeInsets.symmetric(vertical: 4 ,horizontal: 8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: theme.primaryColor
                ),
                child: Text(provider.locale.toUpperCase(),style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold
                )),)

            ],),

            DefaultTabController(length: AppCategory.categories.length+1, child: TabBar(
              dividerColor: Colors.transparent,
              indicator: BoxDecoration(
                color: Colors.transparent
              ),
                isScrollable: true,
                onTap: (value) {
                index=value;
                setState(() {

                });
                },
                padding: EdgeInsets.all(0),
                tabAlignment: TabAlignment.start,
                labelPadding: EdgeInsets.all(8),
                labelColor: Colors.white,
                unselectedLabelColor: Colors.black,

                tabs: [TabWidget(isSelected: index==0, category: AppCategory(id: "all", name: AppLocalizations.of(context)!.all, image: "", iconData: Icons.menu,)),
                  ...AppCategory.categories.map((e){
                    int cattegoreIndex=AppCategory.categories.indexOf(e)+1;
                    return TabWidget(isSelected: index == cattegoreIndex, category: e);
                  }).toList()

              ]
            )),

            FutureBuilder(future: DbServices.getEvents(), builder: (context, snapshot) {
              if (snapshot.connectionState==ConnectionState.waiting){
                return Center(child: CircularProgressIndicator(),);
              }else if(snapshot.hasError){
                return Center(child: Text(snapshot.error.toString()),);
              }else{
                List<EventModel> events = snapshot.data??[];
                return   Expanded(child: ListView.separated(itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pushNamed(context, EventDetails.routeName,arguments: events[index]);
                    },
                    child: EventWidget(event: events[index],onTapFav: () async{
                     await  DbServices.toggleFav(events[index]);
                     setState(() {

                     });
                    },),
                  );
                }, separatorBuilder: (context, index) => SizedBox(height: 8,), itemCount: events.length));
              }

            },)
          ],),
        ),
      ),
    );
  }
}
