import 'package:flutter/material.dart';
import 'package:avocando/submission_services_card.dart';

class SingleSubmissionPageServices extends StatelessWidget {
  const SingleSubmissionPageServices({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final args = ModalRoute.of(context)?.settings.arguments as ScreenArguments;

    var scaffoldKey = GlobalKey<ScaffoldState>();

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
                "Hello,\n${args.uD.name}",
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
                          './assets/services_banner.png'))),
              SizedBox(height: 20.0),
              Container(
                child: Text(
                  "Feedback Pending...",
                  style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.blue[900]),
                ),
              ),
              SizedBox(height: 12.0),
              Container(
                child: Text(
                  "Don't worry! Your feedback is currently under reviewed.",
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
                              args.fsd.category,
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
                              args.fsd.title,
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
                              args.fsd.location,
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
                              args.fsd.description,
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 14,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: Text(
                              "Improvement Suggestions",
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
                              args.fsd.improvementSuggestion,
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
              SizedBox(height: 20),
              Center(
                child: Container(
                  child: Text(
                    "Once again, we would like to thank you for your valuable feedback.\nYour shopping experience is always our company highest priority.",
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(height:15),
              Center(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0,0,0,15),
                  child: TextButton(
                    child: Text(
                      "Contact Us",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: (){},
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
