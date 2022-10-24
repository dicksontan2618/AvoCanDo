import 'package:flutter/material.dart';

class FeedbackMenuPage extends StatefulWidget {
  FeedbackMenuPage({Key? key}) : super(key: key);

  @override
  State<FeedbackMenuPage> createState() => _FeedbackMenuPageState();
}

class _FeedbackMenuPageState extends State<FeedbackMenuPage> {
  String username = "John Doe";

  var scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
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
                "Hello,\n${username}",
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
        child: Column(children: [
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
              child: Image(image: AssetImage('./assets/feedback_banner.jpg'))
          ),
          SizedBox(height: 20.0),
          Container(
            child: Text(
              "We Value Your\nFeedback!",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color:Colors.blue[900]
              ),
            ),
          ),
          SizedBox(height: 12.0),
          Container(
            child: Text(
              "Tell us your thoughts and we will try\nour best to improve our services.",
              style: TextStyle(
                  fontSize: 14,
                  color:Colors.black,
              ),
            ),
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              child: Text(
                "Facilities",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/feedback_facilities_page');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fixedSize: const Size(240,80),
                backgroundColor: Colors.lightBlueAccent,
              )
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              child: Text(
                "Services",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: (){
                Navigator.of(context).pushReplacementNamed('/feedback_services_page');
              },
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fixedSize: const Size(240,80),
                backgroundColor: Colors.green[300],
              )
          ),
          SizedBox(height: 20.0),
          ElevatedButton(
              child: Text(
                "General",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              onPressed: (){},
              style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                fixedSize: const Size(240,80),
                backgroundColor: Colors.brown[300],
              )
          )
        ]),
      ),
    );
  }
}
