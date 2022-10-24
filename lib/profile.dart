import 'dart:async';
import 'dart:convert';

import 'package:avocando/feedback_services_data.dart';
import 'package:avocando/submission_facilities_card.dart';
import 'package:flutter/material.dart';
import 'package:avocando/storage.dart';
import 'package:avocando/userDetails.dart';
import 'package:avocando/feedback_facilities_data.dart';
import 'package:avocando/submission_services_card.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
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
                  Navigator.of(context).pushReplacementNamed('/auth');
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

  //Map userData = {};
  userDetails userData = userDetails(
      points: "",
      exp_date: "",
      name: "",
      email: "",
      phoneNo: "",
      birthday: "",
      gender: "",
      loc: "");
  List<FeedbackFacilitiesData> facilitiesList = [];
  List<FeedbackServicesData> servicesList = [];

  Future<userDetails> getProfile() async {
    SecureStorage profileDetails = SecureStorage();
    String resultString = await profileDetails.readUserData("user1");
    userData = userDetails.deserialize(resultString);
    return userData;
  }

  Future<List<FeedbackFacilitiesData>> getFacilitiesFeedbackData() async {
    SecureStorage profileDetails = SecureStorage();
    String FacilitiesDataString = await profileDetails.readFacilitiesData("facility");
    List<String> FacilitiesDataList =
        (jsonDecode(FacilitiesDataString) as List<dynamic>).cast<String>();
    List<FeedbackFacilitiesData> facilitiesList =
        FacilitiesDataList.map<FeedbackFacilitiesData>(
            (e) => FeedbackFacilitiesData.deserialize(e)).toList();
    return facilitiesList;
  }

  Future<List<FeedbackServicesData>> getFacilitiesServiceData() async {
    SecureStorage profileDetails = SecureStorage();
    String ServicesDataString = await profileDetails.readServicesData("service");
    List<String> ServicesDataList =
        (jsonDecode(ServicesDataString) as List<dynamic>).cast<String>();
    List<FeedbackServicesData> servicesList =
        ServicesDataList.map<FeedbackServicesData>(
            (e) => FeedbackServicesData.deserialize(e)).toList();
    return servicesList;
  }

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    getProfile().then((userDetails result) {
      setState(() {
        userData = result;
      });
    }).catchError((error)=>print(error));

    getFacilitiesFeedbackData().then((List<FeedbackFacilitiesData> result) {
      setState(() {
        facilitiesList = result;
      });
    }).catchError((error)=>print(error));

    getFacilitiesServiceData().then((List<FeedbackServicesData> result) {
      setState(() {
        servicesList = result;
      });
    }).catchError((error)=>print(error));

    //print(facilitiesList);

    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.green[300]),
              child: Text(
                "Hello,\n${userData.name}",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            ListTile(
              title: Text('Home'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('Feedback Form'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('Parking'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('AvoHero Instant App'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('Help Centre'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
            ListTile(
              title: Text('Contact Us'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/home'),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10.0, 10, 10.0, 0),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: IconButton(
                          icon: Icon(Icons.menu),
                          onPressed: () {
                            scaffoldKey.currentState?.openDrawer();
                          }),
                    ),
                    Container(
                      child: IconButton(
                        icon: Icon(Icons.logout),
                        onPressed: () => _dialogBuilder(context),
                      ),
                    )
                  ],
                ),
                //SizedBox(height: 10.0),
                Padding(
                  padding: const EdgeInsets.fromLTRB(15.0, 10, 15, 0),
                  child: Row(
                    children: [
                      CircleAvatar(
                        minRadius: 50.0,
                        backgroundImage: AssetImage('assets/user_avocado.jpg'),
                      ),
                      SizedBox(width: 30),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            userData.name,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 32,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1.5,
                            ),
                          ),
                          SizedBox(height: 5.0),
                          Text(
                            "${userData.points} points",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 16,
                            ),
                          ),
                          SizedBox(height: 3.0),
                          Text(
                            "Expiring on ${userData.exp_date}",
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Center(
                  child: Card(
                    color: Colors.green[100],
                    margin: EdgeInsets.all(15),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        children: [
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  "Email",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //SizedBox(width: 70),
                              Container(
                                width: 150,
                                child: Text(
                                  userData.email,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  "Location",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //SizedBox(width: 70),
                              Container(
                                width: 150,
                                child: Text(
                                  userData.loc,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Row(
                              //mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Container(
                                  width: 100,
                                  child: Text(
                                    "Gender",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                //SizedBox(width: 70),
                                Container(
                                  width: 150,
                                  child: Text(
                                    userData.gender,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  "Phone No.",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //SizedBox(width: 70),
                              Container(
                                width: 150,
                                child: Text(
                                  userData.phoneNo,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            //mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Container(
                                width: 100,
                                child: Text(
                                  "Birthday",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              //SizedBox(width: 70),
                              Container(
                                width: 150,
                                child: Text(
                                  userData.birthday,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Text(
                    "My Feedback Submissions",
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
                  return SubmissionCard(user: userData, details: e);
                }).toList()),
                Column(
                    children: servicesList.map((e) {
                  return SubmissionServicesCard(user: userData, details: e);
                }).toList()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
