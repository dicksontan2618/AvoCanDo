import 'dart:async';
import 'dart:convert';

import 'package:avocando/feedback_facilities_data.dart';
import 'package:avocando/admin_submission_card.dart';
import 'package:flutter/material.dart';
import 'package:avocando/storage.dart';
import 'package:avocando/userDetails.dart';

class AdminFeedbackPage extends StatefulWidget {
  AdminFeedbackPage({Key? key}) : super(key: key);

  @override
  State<AdminFeedbackPage> createState() => _AdminFeedbackPageState();

}

class _AdminFeedbackPageState extends State<AdminFeedbackPage> {

  Future<void> _dialogBuilder(BuildContext context) {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text("Logging Out?"),
            content: const Text("Are you sure you want to\nlogging out?"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: const Text("No"),
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pushReplacementNamed('/admin_auth');
                },
                child: const Text("Yes"),
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
              ),
            ],
          );
        });
  }
  List<FeedbackFacilitiesData> facilitiesList = [];

  Future<userDetails> getProfile() async {
    SecureStorage profileDetails = SecureStorage();
    String resultString = await profileDetails.readUserData("user1");
    userData = userDetails.deserialize(resultString);
    return userData;
  }

  userDetails userData = userDetails(
      points: "",
      exp_date: "",
      name: "",
      email: "",
      phoneNo: "",
      birthday: "",
      gender: "",
      loc: "");

  Future<List<FeedbackFacilitiesData>> getFacilitiesFeedbackData() async {
    SecureStorage profileDetails = SecureStorage();
    String FacilitiesDataString = await profileDetails.readUserData("facility");
    List<String> FacilitiesDataList =
    (jsonDecode(FacilitiesDataString) as List<dynamic>).cast<String>();
    List<FeedbackFacilitiesData> facilitiesList =
    FacilitiesDataList.map<FeedbackFacilitiesData>(
            (e) => FeedbackFacilitiesData.deserialize(e)).toList();
    return facilitiesList;
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {

    getProfile().then((userDetails result) {
      setState(() {
        userData = result;
      });
    });

    getFacilitiesFeedbackData().then((List<FeedbackFacilitiesData> result) {
      setState(() {
        facilitiesList = result;
      });
    });

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () => _dialogBuilder(context),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Text(
                    "Feedback Submissions",
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                Column(
                    children: facilitiesList.map((e) {
                      return AdminSubmissionCard(user: userData, details: e);
                    }).toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
