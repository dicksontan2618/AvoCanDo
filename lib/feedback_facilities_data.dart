import 'dart:convert';

class FeedbackFacilitiesData{
  String title = "";
  String category = "";
  String feedbackType = "";
  String location = "";
  String description = "";
  String status = "";

  FeedbackFacilitiesData({required this.title,required this.category, required this.feedbackType, required this.location, required this.description, required this.status});

  factory FeedbackFacilitiesData.fromJson(Map<String, dynamic>? jsonData) {
    return FeedbackFacilitiesData(
      title: jsonData!['title'],
      category: jsonData['category'],
      feedbackType: jsonData['feedbackType'],
      location: jsonData['location'],
      description: jsonData['description'],
      status: jsonData['status'],
    );
  }

  static Map<String, dynamic> toMap(FeedbackFacilitiesData data) => {
    'title':data.title,
    'category': data.category,
    'feedbackType': data.feedbackType,
    'location': data.location,
    'description': data.description,
    'status' : data.status,
  };

  //become string
  static String serialize(FeedbackFacilitiesData data) => json.encode(FeedbackFacilitiesData.toMap(data));

  static FeedbackFacilitiesData deserialize(String json){
    Map<String, dynamic> userMap = jsonDecode(json);
    var user = FeedbackFacilitiesData.fromJson(userMap);
    return user;
  }

}