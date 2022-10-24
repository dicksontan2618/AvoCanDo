import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Color mainBgColor = const Color.fromRGBO(34, 84, 29, 1.0);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: mainBgColor,
      floatingActionButton: Container(
        height: 75.0,
        width: 75.0,
        child: FittedBox(
          child: FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.yellowAccent,
              child: Icon(
                Icons.chat,
                color: Colors.black,
              )),
        ),
      ),
      body: SafeArea(
          child: Container(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "Welcome!",
                    style: TextStyle(
                      fontSize: 42.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
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
                                  .pushReplacementNamed('/auth');
                            },
                            child: Text(
                              "Sign Out",
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                              ),
                            ),
                          )),
                      PopupMenuItem(
                        value: "Profile",
                        child: TextButton(
                          onPressed: (){
                            Navigator.of(context).pushReplacementNamed('/profile');
                          },
                          child: Text(
                            "Profile",
                            style:TextStyle(
                              color:Colors.black,
                              fontSize: 16,
                            )
                          ),
                        ),
                      ),
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
                    "Avocando anything\nyou want.",
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                  ),
                  /*
                    Image.asset(
                      'assets/avocado_can_help.png',
                      height: 100,
                      width: 125,
                    ),
                    */
                ],
              ),
            ),
            SizedBox(height: 25.0),
            Container(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 30.0, 20.0, 30.0),
                child: GridView.count(
                  childAspectRatio: (1 / .4),
                  shrinkWrap: true,
                  crossAxisCount: 2,
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                      child: TextButton.icon(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed('/feedback_menu_page');
                        },
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Icon(
                            Icons.feedback,
                            color: Colors.grey[800],
                          ),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
                          child: Text("Feedback\nForm",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 0, 5, 10),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Icon(
                            Icons.local_parking,
                            color: Colors.grey[800],
                          ),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
                          child: Text("Parking",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Icon(
                            Icons.notifications,
                            color: Colors.grey[800],
                          ),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
                          child: Text("AvoHero",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(10, 10, 5, 0),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: Padding(
                          padding: const EdgeInsets.fromLTRB(5, 0, 10, 0),
                          child: Icon(
                            Icons.phone,
                            color: Colors.grey[800],
                          ),
                        ),
                        label: Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 12.0, 0),
                          child: Text("Help\nCentre",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              )),
                        ),
                        style: TextButton.styleFrom(
                            backgroundColor: Colors.green,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            )),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
                width: double.infinity,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0.0),
                  child: Text("Offers Happening Now!",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      )),
                )),
            Expanded(
              child: Container(
                  //width: double.infinity,
                  alignment: Alignment.center,
                  color: Colors.white,
                  child: Padding(
                      padding: const EdgeInsets.fromLTRB(20.0, 0.0, 25, 10.0),
                      child: Image.asset(
                        'assets/sale.png',
                      ))),
            )
          ],
        ),
      )),
    );
  }
}
