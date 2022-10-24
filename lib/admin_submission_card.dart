import 'dart:core';

import 'package:avocando/feedback_facilities_data.dart';
import 'package:avocando/userDetails.dart';
import 'package:flutter/material.dart';

class ScreenArguments {
  final userDetails uD;
  final FeedbackFacilitiesData ffd;

  ScreenArguments(this.uD,this.ffd);
}

class AdminSubmissionCard extends StatelessWidget {
  const AdminSubmissionCard({Key? key, required this.user, required this.details}) : super(key: key);

  final userDetails user;
  final FeedbackFacilitiesData details;

  @override
  Widget build(BuildContext context) {

    Color cardColor = Colors.grey;
    if(details.feedbackType=="Urgent"){
      cardColor = Colors.red;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(25.0,20.0,25.0,20.0),
      child: Card(
        color: cardColor,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(35.0,10,0,10),
              child: Text(
                details.title,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.normal,
                  color: Colors.grey[900],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,35,0),
              child: TextButton.icon(
                icon: Icon(
                  Icons.chevron_right,
                  color: Colors.black,
                  size: 24,
                ),
                onPressed: (){
                  Navigator.of(context).pushReplacementNamed('/admin_single_submission_page',arguments: ScreenArguments(user, details));
                },
                label: Text(''),
              ),
            )
          ],
        ),
      ),
    );
  }
}
