import 'package:avocando/admin_feedback_page.dart';
import 'package:avocando/admin_feedback_page_services.dart';
import 'package:avocando/admin_login_screen.dart';
import 'package:avocando/admin_single_submission_page.dart';
import 'package:avocando/feedback_facilities_page.dart';
import 'package:avocando/feedback_menu_page.dart';
import 'package:avocando/feedback_services_page.dart';
import 'package:avocando/profile.dart';
import 'package:avocando/single_submission_page.dart';
import 'package:avocando/single_submission_page_services.dart';
import 'package:flutter/material.dart';
import 'package:avocando/home.dart';
import 'package:avocando/user_login_screen.dart';
import 'package:avocando/admin_home.dart';

void main() {
  runApp(MaterialApp(
      initialRoute: '/auth',
      routes: {
        '/home': (context) => Home(),
        '/auth': (context) => UserLoginScreen(),
        '/admin_auth': (context) => AdminLoginScreen(),
        '/admin_home': (context) => AdminHome(),
        '/admin_feedback_page':(context) => AdminFeedbackPage(),
        '/admin_feedback_page_services': (context) => AdminFeedbackPageServices(),
        '/admin_single_submission_page': (context) => AdminSingleSubmissionPage(),
        '/feedback_menu_page' : (context) => FeedbackMenuPage(),
        '/profile' : (context) => Profile(),
        '/feedback_facilities_page' : (context) => FeedbackFacilitiesPage(),
        '/feedback_services_page' : (context) => FeedbackServicesPage(),
        '/single_submission_page' : (context) => SingleSubmissionPage(),
        '/single_submission_page_services' : (context) => SingleSubmissionPageServices(),
      }
  ));
}

