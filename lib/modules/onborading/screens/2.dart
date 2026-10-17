import 'package:evently/modules/onborading/screens/3.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../Authentication/screens/login_screen.dart';
import '1.dart';

class Twoo1 extends StatelessWidget {
  const Twoo1({super.key});

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
              SizedBox(height: 16,),
              Text(AppLocalizations.of(context)!.titleOnborad2,style: theme.textTheme.titleLarge),
              SizedBox(height: 8,),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.desOnborad2,
                  style: theme.textTheme.bodyMedium,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
