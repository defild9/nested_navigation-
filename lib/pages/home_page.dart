import 'package:flutter/material.dart';
import 'package:nested_navigation/navigators/inbox_navigator.dart';
import 'package:nested_navigation/navigators/meet_navigator.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.inbox),
              label: "Inbox",
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.videocam),
              label: "Meet",
            )
          ],
          currentIndex: _selectedIndex,
          onTap: (int index) {
            setState(() {
              _selectedIndex = index;
            });
          }),
      body: SafeArea(
        top: false,
        child: IndexedStack(
          index: _selectedIndex,
          children: const [
            InboxNavigator(),
            MeetNavigator()
          ],
        ),
      ),
    );
  }
}
