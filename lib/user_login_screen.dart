import 'package:flutter_login/flutter_login.dart';
import 'package:flutter/material.dart';
import 'package:avocando/userDetails.dart';
import 'package:avocando/storage.dart';

const users = {
  'user@gmail.com': 'user1234',
};

class UserLoginScreen extends StatefulWidget {
  UserLoginScreen({Key? key}) : super(key: key);

  @override
  State<UserLoginScreen> createState() => _UserLoginScreenState();
}

class _UserLoginScreenState extends State<UserLoginScreen> {

  var _isVisible;

  initState(){
    super.initState();
    _isVisible = true;
  }

  Duration get loginTime => Duration(milliseconds: 2250);

  Future<String?> _authUser(LoginData data) {
    debugPrint('Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      setState(() {
        _isVisible = false;
      });
      if (!users.containsKey(data.name)) {
        return 'User not exists';
      }
      if (users[data.name] != data.password) {
        return 'Password does not match';
      }
      return null;
    });
  }

  Future<String?> _signupUser(SignupData data) {
    setState(() {
      _isVisible = false;
    });
    debugPrint('Signup Name: ${data.name}, Password: ${data.password}');
    return Future.delayed(loginTime).then((_) {
      return null;
    });
  }

  Future<String?> _recoverPassword(String name) {
    setState(() {
      _isVisible = false;
    });
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return null;
    });
  }
  
  SecureStorage userDetailsStorage = SecureStorage();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,0),
        child: FlutterLogin(
          onLogin: _authUser,
          onSignup: _signupUser,
          onRecoverPassword: _recoverPassword,
          onSubmitAnimationCompleted: () async{
            userDetails user = userDetails(points:"2000", exp_date: "31 December 2023",name: "Dickson Tan", email: "user@gmail.com", phoneNo: '012-3456789', birthday: "17/10/2002", gender: 'Male', loc: 'Kuala Lumpur');
            var userWriteRequest = await userDetailsStorage.writeUserData("user1", userDetails.serialize(user));
            userWriteRequest.then(
              Navigator.of(context).pushReplacementNamed('/home')
            );
          },
          title: "AvoCanDo" ,
          logo: AssetImage('assets/avocado_can_help_sizelg.png'),
          theme: LoginTheme(
            primaryColor: Colors.green[900],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,115,15),
        child: Visibility(
          visible: _isVisible,
          child: FloatingActionButton.extended(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/admin_auth');
            },
            label: Text('Admin?'),
            icon:Icon(Icons.person),
            backgroundColor: Colors.grey[800],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

