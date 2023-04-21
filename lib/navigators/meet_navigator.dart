import 'package:flutter/material.dart';
import 'package:nested_navigation/pages/meet_page.dart';

class MeetNavigator extends StatelessWidget {
  const MeetNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              return const MeetPage();
            });
      },
    );
  }
}
