import 'package:flutter/material.dart';

class AdminHome extends StatefulWidget {
  const AdminHome({Key? key}) : super(key: key);

  @override
  State<AdminHome> createState() => _AdminHomeState();
}

class _AdminHomeState extends State<AdminHome> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  PopupMenuButton(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(5.0))),
                    offset: Offset(-25, 50),
                    icon: CircleAvatar(
                      minRadius: 70.0,
                      backgroundImage: AssetImage('assets/user_avocado.jpg'),
                    ),
                    iconSize: 70,
                    itemBuilder: (context) => [
                      PopupMenuItem(
                          value: "Sign Out",
                          child: TextButton(
                            onPressed: () {
                              Navigator.of(context)
                                  .pushReplacementNamed('/admin_auth');
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 10.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text(
                    "Admin\nHome Page.",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 48.0,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                child: GridView.count(
                  //childAspectRatio: (1 / .4),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed('/admin_feedback_page');
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.settings,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text(
                                "Facilities\nForm",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[300],
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                        child: TextButton(
                          onPressed: () {
                            Navigator.of(context).pushReplacementNamed("/admin_feedback_page_services");
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.assistant,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text(
                                "Services\nForm",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[300],
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                        child: TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.document_scanner_outlined,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text(
                                "General\nForm",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[300],
                          ),
                        )),
                    Padding(
                        padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                        child: TextButton(
                          onPressed: () {},
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Icon(
                                Icons.data_thresholding_outlined,
                                size: 50,
                                color: Colors.black,
                              ),
                              Text(
                                "Data\nStatistics",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 20),
                              ),
                            ],
                          ),
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.green[300],
                          ),
                        )),
                  ],
                ),
              ),
            ),
          ],
        ),
      )),
    );
  }
}
