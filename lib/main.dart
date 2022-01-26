import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MHW',
      theme: ThemeData(
        // UI
        brightness: Brightness.dark,
        primaryColor: Color(0xffef5b5b),
        accentColor: Colors.cyan[600],

        // font
        // fontFamily: 'ariel',
        //text style
        // textTheme: TextTheme(
        //   headline1: TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold),
        //   headline6: TextStyle(fontSize: 36.0, fontStyle: FontStyle.italic),
        //   bodyText2: TextStyle(fontSize: 14.0, fontFamily: 'Hind'),
        // ),
      ),
      home: const LandingPage(),
    );
  }
}

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("MHW"),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    navigate(
                        context,
                        const SignUpPage(
                          pageNo: 1,
                        ));
                  },
                  child: button(context, "Sign Up", false)),
              SizedBox(
                height: 20,
              ),
              GestureDetector(
                  onTap: () {
                    navigate(context, const LoginPage());
                  },
                  child: button(context, "Log In", false)),
            ],
          ),
        ));
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key, required this.pageNo}) : super(key: key);
  final int pageNo;

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  bool isSelected = false;
  int paageNumber = 1;
  TextEditingController emailController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return paageNumber == 1
        ? Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar("Step 1 of 2"),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                formInput(context, emailController, "Email Address", false),
                SizedBox(
                  height: 10,
                ),
                formInput(context, usernameController, "Username", false),
                SizedBox(
                  height: 10,
                ),
                formInput(context, passwordController, "Password", true),
                SizedBox(
                  height: 10,
                ),
                GestureDetector(
                    onTap: () {
                      setState(() {
                        paageNumber = 2;
                      });
                    },
                    child: button(context, "Next", false))
              ],
            ))
        : Scaffold(
            backgroundColor: Colors.white,
            appBar: customAppBar("Step 2 of 2"),
            body: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                formInput(context, emailController, "Wallet Address", false),
                SizedBox(
                  height: 10,
                ),
                formInput(context, usernameController, "Wallet Type", false),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                Text("Are you Creating an Artist Account?"),
                SizedBox(
                  height: 20,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.9,
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          color: !isSelected ? Colors.white : Colors.black,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: Text(
                              "Yes",
                              style: TextStyle(
                                  color:
                                      !isSelected ? Colors.black : Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isSelected = !isSelected;
                          });
                        },
                        child: Container(
                          color: isSelected ? Colors.white : Colors.black,
                          height: 50,
                          width: MediaQuery.of(context).size.width * 0.4,
                          child: Center(
                            child: Text(
                              "No",
                              style: TextStyle(
                                  color:
                                      isSelected ? Colors.black : Colors.white,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                button(context, "Finish", false)
              ],
            ));
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: customAppBar("Step 1 of 2"),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            formInput(context, emailController, "Username", false),
            SizedBox(
              height: 10,
            ),
            formInput(context, passwordController, "Password", true),
            SizedBox(
              height: 10,
            ),
            GestureDetector(
                onTap: () {
                  navigate(context, Collections());
                },
                child: button(context, "Login", false))
          ],
        ));
  }
}

class Collections extends StatefulWidget {
  const Collections({Key? key}) : super(key: key);

  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  int _selectedIndex = 0;
  bool _minimized = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        // mainAxisSize: MainAxisSize.max,
        children: [
          Center(
            child: _minimized
                ? SizedBox()
                : NavigationRail(
                    groupAlignment: 0.25,
                    backgroundColor: Colors.black,
                    selectedIndex: _selectedIndex,
                    // elevation: 0,
                    onDestinationSelected: (int index) {
                      setState(() {
                        _selectedIndex = index;
                      });
                    },
                    labelType: NavigationRailLabelType.selected,
                    destinations: [
                      sidenavItem(
                          Icons.collections_outlined, Icons.collections),
                      sidenavItem(Icons.receipt_outlined, Icons.receipt),
                      sidenavItem(Icons.account_balance_wallet_outlined,
                          Icons.account_balance_wallet),
                      sidenavItem(Icons.person_outline, Icons.person),
                      sidenavItem(Icons.logout_outlined, Icons.logout),
                    ],
                  ),
          ),
          const VerticalDivider(thickness: 0, width: 0),
          // This is the main content.
          Expanded(
            child: Container(
              // padding: EdgeInsets.all(20),
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: _selectedIndex == 0
                    ? [
                        // collections
                        appBarK(context, _minimized, () {
                          setState(() {
                            _minimized = !_minimized;
                          });
                        }, "Collections"),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.9,
                          child: ListView(children: [
                             collectionItem(
                                  context, 'images/2.jpg', 20, "Wynwood", 5),
                            
                            collectionItem(
                                context, 'images/3.jpg', 30, "70th Ave", 21),
                            collectionItem(
                                context, 'images/4.jpg', 12, "Brickell", 11),
                            collectionItem(
                                context, 'images/2.jpg', 15, "Hialeah Arts", 5),
                            collectionItem(
                                context, 'images/3.jpg', 20, "Wynwood", 5),
                            collectionItem(
                                context, 'images/4.jpg', 20, "Wynwood", 5),
                            collectionItem(
                                context, 'images/4.jpg', 20, "Wynwood", 5),
                            collectionItem(
                                context, 'images/2.jpg', 20, "Wynwood", 5),
                          ]),
                        ),
                      ]
                    : _selectedIndex == 1
                        ? [
                            // transactions
                            appBarK(context, _minimized, () {
                              setState(() {
                                _minimized = !_minimized;
                              });
                            }, "Transactions"),
                            Container(
                              color: Colors.blue,
                              height: 120,
                              width: 40,
                            )
                          ]
                        : _selectedIndex == 2
                            ? [
                                // wallets
                                appBarK(context, _minimized, () {
                                  setState(() {
                                    _minimized = !_minimized;
                                  });
                                }, "Wallets"),

                                Image(
                                    height: 100,
                                    width: 100,
                                    image: AssetImage('images/10300.png')),
                                Center(
                                  child: Text(
                                    "Miamicoin",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 25,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width * 0.7,
                                    child: Column(
                                      children: [
                                        SizedBox(height: 20),
                                        details("Balance:", "12.424 MIA", 20),
                                        SizedBox(height: 20),
                                        details("Earnings:", "+5.664", 20),
                                        SizedBox(height: 20),
                                        details(
                                            "Top Collection:", "Ambi3nt", 20),
                                        SizedBox(height: 20),
                                      ],
                                    )),
                              ]
                            : _selectedIndex == 3
                                ? [
                                    appBarK(context, _minimized, () {
                                      setState(() {
                                        _minimized = !_minimized;
                                      });
                                    }, "Profile"),
                                    profileItem(context, 'images/prof.jpg', 20,
                                        "Leon", 5, 20),
                                  ]
                                : [
                                    Container(
                                      height:
                                          MediaQuery.of(context).size.height,
                                      width: MediaQuery.of(context).size.width *
                                          0.7,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            "Are you sure you want to log out?",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 20),
                                          ),
                                          SizedBox(
                                            height: 20,
                                          ),
                                          GestureDetector(
                                              onTap: () {
                                                setState(() {
                                                  Navigator.pop(context);
                                                });
                                              },
                                              child: button(
                                                  context, "log out", false)),
                                        ],
                                      ),
                                    ),
                                  ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class ViewCollection extends StatefulWidget {
  final name;
  const ViewCollection({Key? key, required this.name}) : super(key: key);

  @override
  _ViewCollectionState createState() => _ViewCollectionState();
}

class _ViewCollectionState extends State<ViewCollection> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: Icon(
            Icons.close_rounded,
            size: 30,
            color: Color(0xfff5cf05),
          ),
        ),
        title: Text(
          widget.name,
          style: TextStyle(
              color: Color(0xfff5cf05),
              fontSize: 20,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: ListView(
          children: [
            nftItem(context, 'images/2.jpg', "Narnia", 120, "MIA"),
            nftItem(context, 'images/3.jpg', "Narnia", 120, "MIA"),
            nftItem(context, 'images/4.jpg', "Narnia", 120, "MIA"),
            nftItem(context, 'images/3.jpg', "Narnia", 120, "MIA"),
            nftItem(context, 'images/2.jpg', "Narnia", 120, "MIA"),
          ],
        ),
      ),
    );
  }
}

NavigationRailDestination sidenavItem(icon1, icon2) {
  return NavigationRailDestination(
    icon: Icon(
      icon1,
      size: 40,
      color: Color(0xff50514f),
    ),
    selectedIcon: Icon(
      icon2,
      size: 40,
      color: Color(0xfff5cf05),
    ),
    label: Text(''),
  );
}

Widget appBarK(context, _minimized, Function() fun, name) {
  return Container(
    height: MediaQuery.of(context).size.height * 0.08,
    width: MediaQuery.of(context).size.width,
    padding: EdgeInsets.only(left: 10),
    color: Colors.black,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: () {
            fun();
          },
          child: _minimized
              ? Icon(
                  Icons.menu_rounded,
                  size: 30,
                  color: Color(0xfff5cf05),
                )
              : Icon(
                  Icons.close_rounded,
                  size: 30,
                  color: Color(0xfff5cf05),
                ),
        ),
        Center(
          child: Text(
            name,
            style: TextStyle(
                color: Color(0xfff5cf05),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(
          width: 40,
        )
      ],
    ),
  );
}

Widget collectionItem(context, img, itemCount, name, itemsSold) {
  return GestureDetector(
    onTap: () {
                                navigate(context, ViewCollection(name: name,));
                              },
    child: Container(
      // height: 120,
      // padding: EdgeInsets.all(8.0),
      // color: Colors.black,
      margin: EdgeInsets.only(top: 20, bottom: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          Text(
            name,
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
          ),
          Container(
              margin: EdgeInsets.only(top: 15, bottom: 15),
              width: MediaQuery.of(context).size.width * 0.6,
              height: MediaQuery.of(context).size.width * 0.6,
              decoration: new BoxDecoration(
                  shape: BoxShape.circle,
                  image: new DecorationImage(
                      fit: BoxFit.cover, image: new AssetImage(img)))),
          Container(
              width: MediaQuery.of(context).size.width * 0.7,
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  details("Items Count:", itemCount.toString(), 18),
                  // details("Name:", Name),
                  details("Items Sold:", itemsSold.toString(), 18),
                ],
              ))
        ],
      ),
    ),
  );
}

Widget profileItem(context, img, itemCount, name, itemsSold, earnings) {
  return Container(
    // height: 120,
    // padding: EdgeInsets.all(8.0),
    // color: Colors.black,
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        Text(
          name,
          style: TextStyle(
              color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        Container(
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width * 0.6,
            height: MediaQuery.of(context).size.width * 0.6,
            decoration: new BoxDecoration(
                shape: BoxShape.circle,
                image: new DecorationImage(
                    fit: BoxFit.cover, image: new AssetImage(img)))),
        Container(
            width: MediaQuery.of(context).size.width * 0.7,
            padding: EdgeInsets.all(10),
            child: Column(
              children: [
                details("Collection Count:", itemCount.toString(), 18),
                details("Item Count:", itemCount.toString(), 18),
                // details("Name:", Name),
                details("Items Sold:", itemsSold.toString(), 18),
                details("Earnings:", earnings.toString() + " MIA", 18),
                details("Date Joined:",
                    DateFormat.yMMMd().format(DateTime.now()).toString(), 18),
              ],
            ))
      ],
    ),
  );
}

Row details(left, right, size) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    mainAxisSize: MainAxisSize.max,
    children: [
      Text(
        left,
        style: TextStyle(
            color: Colors.black,
            fontSize: size.toDouble(),
            fontWeight: FontWeight.normal),
      ),
      Text(
        right,
        style: TextStyle(
            color: Colors.grey,
            fontSize: size.toDouble(),
            fontWeight: FontWeight.normal),
      ),
    ],
  );
}

Widget formInput(context, controller, txt, isPass) {
  return Center(
    child: Container(
      width: MediaQuery.of(context).size.width * 0.9,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
        child: Center(
          child: TextField(
            style: TextStyle(color: Colors.black),
            obscureText: isPass,
            controller: controller,
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.black, width: 1.0),
              ),
              hintText: txt,
              hintStyle: TextStyle(color: Colors.grey),
            ),
          ),
        ),
      ),
    ),
  );
}

AppBar customAppBar(txt) {
  return AppBar(
    centerTitle: true,
    title: Text(
      txt,
      style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
    ),
    backgroundColor: Colors.transparent,
    elevation: 0.0,
  );
}

Container button(context, txt, isTransparent) {
  return Container(
    decoration: BoxDecoration(
        color: isTransparent ? Colors.white : Colors.black,
        border: isTransparent
            ? Border.all(width: 2.0, color: Colors.black)
            : Border.all(width: 0.0)),
    height: 50,
    width: MediaQuery.of(context).size.width * 0.9,
    child: Center(
      child: Text(
        txt,
        style: TextStyle(
            color: isTransparent ? Colors.black : Colors.white, fontSize: 18),
      ),
    ),
  );
}

Widget nftItem(context, imageSRC, name, highestBid, currency) {
  return Container(
    margin: EdgeInsets.only(top: 20, bottom: 20),
    child: Column(
      children: [
        Container(
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.only(top: 15, bottom: 15),
            width: MediaQuery.of(context).size.width * 0.9,
            height: MediaQuery.of(context).size.width * 0.7,
            decoration: new BoxDecoration(
                shape: BoxShape.rectangle,
                borderRadius: BorderRadius.circular(10),
                image: new DecorationImage(
                    fit: BoxFit.cover, image: new AssetImage(imageSRC)))),
        SizedBox(
          height: 20,
        ),
        details("Name:", name, 20),
        SizedBox(
          height: 20,
        ),
        details("Highest Bid:", highestBid.toString() + " " + currency, 20),
        SizedBox(
          height: 20,
        ),
        button(context, "View in AR", true),
        SizedBox(
          height: 20,
        ),
        button(context, "Remove Item", false)
      ],
    ),
  );
}

// function to navigate to the naxt page
// func is the object/page
navigate(context, location) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => location));
}
