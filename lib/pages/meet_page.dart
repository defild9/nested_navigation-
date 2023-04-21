import 'package:flutter/material.dart';
import 'package:nested_navigation/widgets/join_with_code_bottom_sheet.dart';
import 'package:nested_navigation/widgets/new_meeting_bottom_sheet.dart';

class MeetPage extends StatelessWidget {
  const MeetPage({Key? key}) : super(key: key);

  void _showNewMeetingBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext context) {
        return const SingleChildScrollView(
          child: NewMeetingBottomSheet(),
        );
      },
    );
  }

  void _showJoinWithCodeBottomSheet(BuildContext context){
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      builder: (BuildContext contex){
        return SingleChildScrollView(
          child: JoinWithCodeBottomSheet(),
        );
      }
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meet")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () => _showNewMeetingBottomSheet(context),
                  child: const SizedBox(
                    width: 130,
                    child: Center(
                      child: Text('New meeting'),
                    ),
                  ),
                ),
                ElevatedButton(
                    onPressed: () => _showJoinWithCodeBottomSheet(context),
                    child: const SizedBox(
                      width: 130,
                      child: Center(child: Text('Join with a code')),
                    )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
