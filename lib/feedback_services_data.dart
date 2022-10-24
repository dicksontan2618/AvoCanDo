import 'dart:convert';

class FeedbackServicesData{
  String title = "";
  String category = "";
  String feedbackType = "";
  String location = "";
  String description = "";
  String improvementSuggestion = "";

  FeedbackServicesData({required this.title,required this.category, required this.feedbackType, required this.location, required this.description, required this.improvementSuggestion});

  factory FeedbackServicesData.fromJson(Map<String, dynamic>? jsonData) {
    return FeedbackServicesData(
      title: jsonData!['title'],
      category: jsonData['category'],
      feedbackType: jsonData['feedbackType'],
      location: jsonData['location'],
      description: jsonData['description'],
      improvementSuggestion: jsonData['improvementSuggestion']
    );
  }

  static Map<String, dynamic> toMap(FeedbackServicesData data) => {
    'title':data.title,
    'category': data.category,
    'feedbackType': data.feedbackType,
    'location': data.location,
    'description': data.description,
    'improvementSuggestion':data.improvementSuggestion,
  };

  //become string
  static String serialize(FeedbackServicesData data) => json.encode(FeedbackServicesData.toMap(data));

  static FeedbackServicesData deserialize(String json){
    Map<String, dynamic> userMap = jsonDecode(json);
    var user = FeedbackServicesData.fromJson(userMap);
    return user;
  }

}