import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:avocando/feedback_facilities_data.dart';
import 'package:avocando/userDetails.dart';
import 'package:avocando/storage.dart';

class FeedbackFacilitiesPage extends StatefulWidget {
  const FeedbackFacilitiesPage({Key? key}) : super(key: key);

  @override
  State<FeedbackFacilitiesPage> createState() => _FeedbackFacilitiesPageState();
}

class _FeedbackFacilitiesPageState extends State<FeedbackFacilitiesPage> {
  var scaffoldKey = GlobalKey<ScaffoldState>();

  String dropDownValueCategory = "Ventillation System";
  String dropDownValueFeedbackType = "Urgent";

  final _formKey = GlobalKey<FormState>();
  final titleController = TextEditingController();
  final locationController = TextEditingController();
  final descController = TextEditingController();

  SecureStorage feedbackDataStorage = SecureStorage();

  List<String> FeedbackList = <String>[];

  userDetails userData = userDetails(points: "", exp_date: "", name: "", email: "", phoneNo: "", birthday: "", gender: "", loc: "");
  Future<userDetails> getProfile() async{
    SecureStorage profileDetails = SecureStorage();
    String resultString = await profileDetails.readUserData("user1");
    userData = userDetails.deserialize(resultString);
    return userData;
  }

  Future<List<String>> getFacilitiesList() async{
    String resultString = await feedbackDataStorage.readFacilitiesData("facility");
    FeedbackList = (jsonDecode(resultString) as List<dynamic>).cast<String>();
    if(FeedbackList.isNotEmpty){
      return FeedbackList;
    }
    else{
      return <String>[];
    }
  }

  @override
  Widget build(BuildContext context) {

    getProfile().then((userDetails result){
      setState(() {
        userData = result;
      });
    }).catchError((error)=>print(error));

    getFacilitiesList().then((List<String> result){
      setState(() {
        FeedbackList = result;
      });
    }).catchError((error)=>print(error));

    print(FeedbackList);

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
              onTap: () => Navigator.of(context).pushReplacementNamed('/profile'),
            ),
            ListTile(
              title: Text('Feedback Form'),
              onTap: () => Navigator.of(context).pushReplacementNamed('/feedback_menu_page'),
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
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 50,
                child: Stack(
                  children: [
                    Center(
                        child: Column(
                      children: [],
                    )),
                    Positioned(
                        left: 10,
                        top: 20,
                        child: IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: () {
                              scaffoldKey.currentState?.openDrawer();
                            }))
                  ],
                ),
              ),
              Container(
                  child: Image(
                      image: AssetImage(
                          './assets/feedback_facilities_banner.jpg'))),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                  "Facilities Feedback Form",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                child: Text(
                  "We love honest opinions! Throw them all out at us!",
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.blue[100],
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Personal Details",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Text(
                              "Email",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              userData.email,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Location",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              userData.loc,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Gender",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              userData.gender,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Phone No.",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Container(
                            child: Text(
                              userData.phoneNo,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Birthday",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Container(
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
                    ),
                  ),
                ),
              ),
              SizedBox(height:20),
              Padding(
                padding: EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: SizedBox(
                  width: double.infinity,
                  child: Card(
                    color: Colors.green[100],
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              "Facilities Feedback Form",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          Container(
                            child: Text(
                              "Category",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          DropdownButtonFormField(
                            items: <String>["Ventillation System","Air-Condtioning System","Lightning","Supply of Electricity"].map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValueCategory){
                              setState(() {
                                dropDownValueCategory = newValueCategory!;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                              ),
                              filled: true,
                              fillColor: Colors.green[100],
                            ),
                          ),
                          SizedBox(height: 15),
                          Container(
                            child: Text(
                              "Feedback Type",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10,),
                          DropdownButtonFormField(
                            items: <String>["Urgent","Review","Damaged","Malfunction"].map<DropdownMenuItem<String>>((String value){
                              return DropdownMenuItem<String>(
                                value: value,
                                child: Text(
                                  value,
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              );
                            }).toList(),
                            onChanged: (String? newValueFeedbackType){
                              setState(() {
                                dropDownValueFeedbackType = newValueFeedbackType!;
                              });
                            },
                            decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey, width: 1.5),
                              ),
                              filled: true,
                              fillColor: Colors.green[100],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Location of Fault",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Form(
                            key: _formKey,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                TextFormField(
                                  controller: locationController,
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'Please enter some text';
                                    }
                                    return value;
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Feedback Title",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  controller: titleController,
                                  validator: (value) {
                                    return value;
                                  },
                                ),
                                SizedBox(height: 10,),
                                Text(
                                  "Feedback Description (Optional)",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                TextFormField(
                                  controller: descController,
                                  validator: (value) {
                                    return value;
                                  },
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Center(
                            child: TextButton(
                              onPressed: () async {
                                if(descController.text==""){
                                  descController.text = "";
                                }
                                FeedbackFacilitiesData feedbackFacilitiesData = FeedbackFacilitiesData(title:titleController.text,category: dropDownValueCategory, feedbackType: dropDownValueFeedbackType, location: locationController.text, description: descController.text, status: "Pending");
                                setState(() {
                                  FeedbackList.add(FeedbackFacilitiesData.serialize(feedbackFacilitiesData));
                                });
                                var feedbackRequest = await feedbackDataStorage.writeFacilitiesData("facility", jsonEncode(FeedbackList));
                                feedbackRequest.then(
                                  Navigator.of(context).pushReplacementNamed('/home')
                                );
                              },
                              child: Text(
                                'Submit',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24,
                                  color: Colors.black,
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
