import 'dart:convert';

import 'package:avocando/feedback_facilities_data.dart';
import 'package:avocando/storage.dart';
import 'package:flutter/material.dart';
import 'package:avocando/admin_submission_card.dart';

class AdminSingleSubmissionPage extends StatefulWidget {
  const AdminSingleSubmissionPage({Key? key}) : super(key: key);

  @override
  State<AdminSingleSubmissionPage> createState() => _AdminSingleSubmissionPageState();
}

class _AdminSingleSubmissionPageState extends State<AdminSingleSubmissionPage> {

  String dropDownValueStatus = "Pending";

  //final _formKey = GlobalKey<FormState>();

  List<FeedbackFacilitiesData> facilitiesList = [];

  SecureStorage feedbackDataStorage = SecureStorage();

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

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;

    int facilityIndex = 0;

    getFacilitiesFeedbackData().then((List<FeedbackFacilitiesData> result) {
      setState(() {
        facilitiesList = result;
      });
    }).catchError((error)=>print(error));


    for(int i =0;i<facilitiesList.length;i++){
      if(facilitiesList[i].title==args.ffd.title){
        facilityIndex = i;
      }
    }

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
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
                              "Customer Details",
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
                              args.uD.email,
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
                              args.uD.loc,
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
                              args.uD.gender,
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
                              args.uD.phoneNo,
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
                              args.uD.birthday,
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
                              "Feedback Details",
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
                          SizedBox(height: 5),
                          Container(
                            child: Text(
                              args.ffd.category,
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
                              "Title",
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
                              args.ffd.title,
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
                              args.ffd.location,
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
                              "Description",
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
                              args.ffd.description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(height:30),
              Container(
                child: Text(
                  "Feedback Status",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Padding(
                padding: const EdgeInsets.all(20),
                child: DropdownButtonFormField(
                  items: <String>["Pending","Ongoing","Resolved"].map<DropdownMenuItem<String>>((String value){
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
                  onChanged: (String? newValueStatus){
                    setState(() {
                      dropDownValueStatus = newValueStatus!;
                    });
                  },
                ),
              ),
              Center(
                child: TextButton(
                  onPressed: () async {
                    facilitiesList[facilityIndex].status = dropDownValueStatus;
                    List<String> facilitiesListString = facilitiesList.map((e){
                      return FeedbackFacilitiesData.serialize(e);
                    }).toList();
                    var feedbackRequest = await feedbackDataStorage.writeFacilitiesData("facility", jsonEncode(facilitiesListString));
                    feedbackRequest.then(
                        Navigator.of(context).pushReplacementNamed('/home')
                    );
                  },
                  child: Text(
                    'Update',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      color: Colors.black,
                    ),
                  ),
                  style: TextButton.styleFrom(
                    side: BorderSide(
                      width: 2,
                    )
                  ),
                ),
              ),
              SizedBox(height:15),
            ],
          ),
        ),
      ),
    );
  }
}
