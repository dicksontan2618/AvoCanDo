import 'package:flutter_login/flutter_login.dart';
import 'package:flutter/material.dart';

const users = const {
  'admin@gmail.com': 'admin1234',
};

class AdminLoginScreen extends StatefulWidget {
  const AdminLoginScreen({Key? key}) : super(key: key);

  @override
  State<AdminLoginScreen> createState() => _AdminLoginScreenState();
}

class _AdminLoginScreenState extends State<AdminLoginScreen> {

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

  Future<String> _recoverPassword(String name) {
    setState(() {
      _isVisible = false;
    });
    debugPrint('Name: $name');
    return Future.delayed(loginTime).then((_) {
      if (!users.containsKey(name)) {
        return 'User not exists';
      }
      return "";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.green[900],
      body: Padding(
        padding: const EdgeInsets.fromLTRB(0,40,0,0),
        child: FlutterLogin(
          onLogin: _authUser,
          onRecoverPassword: _recoverPassword,
          onSubmitAnimationCompleted: (){
            Navigator.of(context).pushReplacementNamed("/admin_home");
          },
          title: "Admin Login" ,
          logo: AssetImage('assets/avocado_can_help_sizelg.png'),
          theme: LoginTheme(
            primaryColor: Colors.green[900],
          ),
        ),
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.fromLTRB(0,0,90,100),
        child: Visibility(
          visible: _isVisible,
          child: FloatingActionButton.extended(
            onPressed: (){
              Navigator.of(context).pushReplacementNamed('/auth');
            },
            label: Text('Not an Admin?'),
            icon:Icon(Icons.person),
            backgroundColor: Colors.grey[800],
          ),
        ),
      ),
      resizeToAvoidBottomInset: false,
    );
  }
}

