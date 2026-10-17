import 'package:evently/modules/onborading/screens/2.dart';
import 'package:flutter/material.dart';

import '../../../l10n/app_localizations.dart';
import '../../Authentication/screens/login_screen.dart';

class Onee extends StatelessWidget {
  const Onee({super.key});

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
              Text(AppLocalizations.of(context)!.titleOnborad1,style: theme.textTheme.titleLarge),
              SizedBox(height: 8,),
              Expanded(
                child: Text(
                  AppLocalizations.of(context)!.desOnborad1,
                  style: theme.textTheme.bodyMedium,),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
