import 'dart:convert';
import 'dart:core';

class userDetails {
  String name="";
  String points = "";
  String exp_date = "";
  String email = "";
  String phoneNo = "";
  String birthday = "";
  String loc = "";
  String gender = "";

  userDetails({required this.points, required this.exp_date,required this.name, required this.email, required this.phoneNo, required this.birthday, required this.gender, required this.loc});

  factory userDetails.fromJson(Map<String, dynamic>? jsonData) {
    return userDetails(
      name: jsonData!['name'],
      points: jsonData['points'],
      exp_date: jsonData['exp_date'],
      email: jsonData['email'],
      phoneNo: jsonData['phoneNo'],
      birthday: jsonData['birthday'],
      loc: jsonData['loc'],
      gender: jsonData['gender'],
    );
  }

  static Map<String, dynamic> toMap(userDetails data) => {
    'name': data.name,
    'points': data.points,
    'exp_date':data.exp_date,
    'email':data.email,
    'phoneNo':data.phoneNo,
    'birthday':data.birthday,
    'loc':data.loc,
    'gender':data.gender,
  };

  //become string
  static String serialize(userDetails data) => json.encode(userDetails.toMap(data));

  static userDetails deserialize(String json){
    Map<String, dynamic> userMap = jsonDecode(json);
    var user = userDetails.fromJson(userMap);
    return user;
  }

}