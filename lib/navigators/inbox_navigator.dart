import 'package:flutter/material.dart';
import 'package:nested_navigation/pages/email_detail_page.dart';
import 'package:nested_navigation/pages/inbox_page.dart';

class InboxNavigator extends StatelessWidget {
  const InboxNavigator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(
            settings: settings,
            builder: (BuildContext context) {
              if(settings.name == '/email'){
                return const DetailPage();
              }
              return const InboxPage();
            });
      },
    );
  }
}
