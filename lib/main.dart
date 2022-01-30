import 'package:flutter/material.dart';
// import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:flutter/services.dart';

Future<void> main() async {
  // new informamtion
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations(<DeviceOrientation>[
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
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
        brightness: Brightness.light,
        scaffoldBackgroundColor: Colors.white,
        primaryColor: const Color(0xffef5b5b),
        // accentColor: Colors.cyan[600],

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
        appBar: customAppBar(" "),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Image(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: MediaQuery.of(context).size.width * 0.5,
                  image: const AssetImage('images/logov3.png')),
              Container(
                height: 120,
                child: Column(
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
              ),
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
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                    onTap: () {
                      navigate(
                          context,
                          const Collections(
                            isArtist: false,
                          ));
                    },
                    child: button(context, "Finish", false))
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
        appBar: customAppBar("Welcome Back"),
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
                  navigate(
                      context,
                      const Collections(
                        isArtist: true,
                      ));
                },
                child: button(context, "Login", false))
          ],
        ));
  }
}

class Collections extends StatefulWidget {
  const Collections({Key? key, required this.isArtist}) : super(key: key);
  final bool isArtist;
  @override
  _CollectionsState createState() => _CollectionsState();
}

class _CollectionsState extends State<Collections> {
  int _selectedIndex = 0;
  bool _minimized = true;
  TextEditingController? collectionName;
  @override
  Widget build(BuildContext context) {
    return widget.isArtist
        ? Scaffold(
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
                            sidenavItem(Icons.collections_outlined,
                                Icons.collections, false),
                            sidenavItem(
                                Icons.receipt_outlined, Icons.receipt, false),
                            sidenavItem(Icons.account_balance_wallet_outlined,
                                Icons.account_balance_wallet, false),
                            sidenavItem(
                                Icons.person_outline, Icons.person, false),
                            sidenavItem('images/nftlo.png',
                                'images/nftlogo_outlined.png', true),
                            sidenavItem(
                                Icons.logout_outlined, Icons.logout, false),
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
                                height:
                                    MediaQuery.of(context).size.height * 0.9,
                                child: ListView(children: [
                                  collectionItem(context, 'images/4.jpg', 20,
                                      "Wynwood", 5),
                                  collectionItem(context, 'images/car.png', 30,
                                      "70th Ave", 21),
                                  collectionItem(context, 'images/4.jpg', 12,
                                      "Brickell", 11),
                                  collectionItem(context, 'images/2.jpg', 15,
                                      "Hialeah Arts", 5),
                                  collectionItem(context, 'images/3.jpg', 20,
                                      "Wynwood", 5),
                                  collectionItem(context, 'images/4.jpg', 20,
                                      "Wynwood", 5),
                                  collectionItem(context, 'images/4.jpg', 20,
                                      "Wynwood", 5),
                                  collectionItem(context, 'images/2.jpg', 20,
                                      "Wynwood", 5),
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
                                Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 30,),
                                          Center(
                                            child: Container(
                                              child: Text("Feature Under development, check again soon!"),
                                              
                                            ),
                                          ),
                                        ],
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
                                          image:
                                              AssetImage('images/10300.png')),
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
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.7,
                                          child: Column(
                                            children: [
                                              SizedBox(height: 20),
                                              details(
                                                  "Balance:", "1245.424 MIA", 20),
                                              SizedBox(height: 20),
                                              details(
                                                  "Earnings:", "+5.674", 20),
                                              SizedBox(height: 20),
                                              details("Top Collection:",
                                                  "Ambi3nt", 20),
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
                                          profileItem(
                                              context,
                                              'images/prof.jpg',
                                              100,
                                              "Leon",
                                              51,
                                              20070),
                                        ]
                                      : _selectedIndex == 4
                                          ? [
                                              appBarK(context, _minimized, () {
                                                setState(() {
                                                  _minimized = !_minimized;
                                                });
                                              }, "Create NFT"),
                                              Column(
                                                mainAxisAlignment:MainAxisAlignment.spaceBetween,
                                                mainAxisSize:MainAxisSize.max,
                                                children: [
                                                  
                                                  Container(
                                                    width:MediaQuery.of(context).size.width*0.75,
                                                    child: formInput(
                                                        context,
                                                        collectionName,
                                                        "Collection Name",
                                                        false),
                                                  ),
                                                  Container(
                                                    decoration:BoxDecoration(
                                                      borderRadius: BorderRadius.circular(6),
                                                      // border:Border.all(color:Colors.black,width:2.0),
                                                      color: Color(0xffF8F8F8),
                                                    ),
                                                    
                                                    height:  MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    child: Center(child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                         ImageIcon(
                                                            AssetImage("images/2d.png"),
                                                            size: 40,
                                                            color: Color(0xff50514f),
                                                          ),
                                                        Text("2D image",style: TextStyle(fontSize: 20,color: Color(0xff50514f)),),
                                                      ],
                                                    )),
                                                  ),
                                                  SizedBox(height: 20,),
                                                  Container(
                                                    decoration:BoxDecoration(
                                                       borderRadius: BorderRadius.circular(6),
                                                      // border:Border.all(color:Colors.black,width:2.0),
                                                      color: Color(0xffF8F8F8),
                                                    ),
                                                    
                                                    height:  MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.5,
                                                    width: MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.7,
                                                    child: Center(child: Column(
                                                      mainAxisAlignment: MainAxisAlignment.center,
                                                      children: [
                                                         ImageIcon(
                                                            AssetImage("images/3d.png"),
                                                            size: 40,
                                                            color: Color(0xff50514f),
                                                          ),
                                                        Text("3D image",style: TextStyle(fontSize: 20,color: Color(0xff50514f)),),
                                                      ],
                                                    )),),
                                                  
                                                  SizedBox(height: 20,),
                                                  Container(
                                                    padding: const EdgeInsets.only(top:10,left: 10,right:10),
                                                    width:MediaQuery.of(context).size.width*0.7,
                                                    color: Colors.black,
                                                    child: Column(
                                                      
                                                      children: [
                                                        const Center(
                                                          child:  Image(
                                                            height:40,
                                                            width:40,
                                                            image: AssetImage("images/nftlo.png"),
                                                          color: Colors.white,
                                                          ),
                                                        ),
                                                        button(
                                                            context, "Mint", false),
                                                      ],
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ]
                                          : [
                                              Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      "Are you sure you want to log out?",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: button(context,
                                                            "log out", false)),
                                                  ],
                                                ),
                                              ),
                                            ],
                    ),
                  ),
                )
              ],
            ),
          )
        : Scaffold(
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
                            sidenavItem('images/nftlo.png',
                                'images/nftlogo_outlined.png', true),
                            sidenavItem(Icons.collections_outlined,
                                Icons.collections, false),
                            sidenavItem(
                                Icons.receipt_outlined, Icons.receipt, false),
                            sidenavItem(Icons.account_balance_wallet_outlined,
                                Icons.account_balance_wallet, false),
                            sidenavItem(
                                Icons.person_outline, Icons.person, false),
                            sidenavItem(
                                Icons.logout_outlined, Icons.logout, false),
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
                              }, "My Collections"),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.91,
                                child: ListView(children: [
                                  collectionItemUser(context, 'images/FLAMINGO_ORIGINAL.png',
                                      8, "Dolph-Str33t", "Mogere"),
                                  collectionItemUser(context, 'images/3.jpg',
                                      30, "District 28", "Mogere"),
                                  collectionItemUser(context, 'images/4.jpg',
                                      12, "District 28", "Cecilia"),
                                  collectionItemUser(context, 'images/2.jpg',
                                      15, "District 28", "Mogere"),
                                  collectionItemUser(context, 'images/3.jpg',
                                      20, "District 28", "Ceilia"),
                                  collectionItemUser(context, 'images/4.jpg',
                                      20, "District 28", "Koech"),
                                  collectionItemUser(context, 'images/4.jpg',
                                      20, "District 28", "Leon"),
                                  collectionItemUser(context, 'images/2.jpg',
                                      20, "District 28", "Moises"),
                                ]),
                              ),
                            ]
                          : _selectedIndex == 1
                              ? [
                                  // collections
                                  appBarK(context, _minimized, () {
                                    setState(() {
                                      _minimized = !_minimized;
                                    });
                                  }, "Collections"),
                                  Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.91,
                                    child: ListView(children: [
                                       collectionItem(context, 'images/4.jpg', 20,
                                      "Wynwood", 5),
                                  collectionItem(context, 'images/car.png', 30,
                                      "70th Ave", 21),
                                      collectionItem(context, 'images/4.jpg',
                                          12, "Brickell", 11),
                                      collectionItem(context, 'images/2.jpg',
                                          15, "Hialeah Arts", 5),
                                      collectionItem(context, 'images/3.jpg',
                                          20, "Wynwood", 5),
                                      collectionItem(context, 'images/4.jpg',
                                          20, "Wynwood", 5),
                                      collectionItem(context, 'images/4.jpg',
                                          20, "Wynwood", 5),
                                      collectionItem(context, 'images/2.jpg',
                                          20, "Wynwood", 5),
                                    ]),
                                  ),
                                ]
                              : _selectedIndex == 2
                                  ? [
                                      // transactions
                                      appBarK(context, _minimized, () {
                                        setState(() {
                                          _minimized = !_minimized;
                                        });
                                      }, "Transactions"),
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          SizedBox(height: 30,),
                                          Center(
                                            child: Container(
                                              child: Text("Feature Under development, check again soon!"),
                                              
                                            ),
                                          ),
                                        ],
                                      )
                                    ]
                                  : _selectedIndex == 3
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
                                              image: AssetImage(
                                                  'images/10300.png')),
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              child: Column(
                                                children: [
                                                  SizedBox(height: 20),
                                                  details("Balance:",
                                                      "1678 MIA", 20),
                                                  SizedBox(height: 20),
                                                  details("Earnings:", "125.664",
                                                      20),
                                                  SizedBox(height: 20),
                                                  details("Top Collection:",
                                                      "Ambi3nt", 20),
                                                  SizedBox(height: 20),
                                                ],
                                              )),
                                        ]
                                      : _selectedIndex == 4
                                          ? [
                                              appBarK(context, _minimized, () {
                                                setState(() {
                                                  _minimized = !_minimized;
                                                });
                                              }, "Profile"),
                                              profileItem_User(
                                                  context,
                                                  'images/56.jpg',
                                                  25,
                                                  "Mogere",
                                                  130,
                                                  130),
                                            ]
                                          : [
                                              Container(
                                                height: MediaQuery.of(context)
                                                    .size
                                                    .height,
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Text(
                                                      "Are you sure you want to log out?",
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontSize: 20),
                                                    ),
                                                    SizedBox(
                                                      height: 20,
                                                    ),
                                                    GestureDetector(
                                                        onTap: () {
                                                          setState(() {
                                                            Navigator.pop(
                                                                context);
                                                          });
                                                        },
                                                        child: button(context,
                                                            "log out", false)),
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
          children: widget.name == "Wynwood"
              ? [
                  nftItem(
                      context, 'images/collection/1.png', "Narnia", 120, "MIA"),
                  nftItem(
                      context, 'images/collection/2.png', "Narnia", 120, "MIA"),
                  nftItem(
                      context, 'images/collection/3.png', "Narnia", 120, "MIA"),
                  nftItem(
                      context, 'images/collection/4.png', "Narnia", 120, "MIA"),
                  nftItem(
                      context, 'images/collection/5.png', "Narnia", 120, "MIA"),
                ]
              : widget.name == "70th Ave"
                  ? [
                      nftItem(context, 'images/car.png', "Gari", 120, "MIA"),
                    ]
                  : [
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

class CreateNFT extends StatefulWidget {
  const CreateNFT({Key? key}) : super(key: key);

  @override
  _CreateNFTState createState() => _CreateNFTState();
}

class _CreateNFTState extends State<CreateNFT> {
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}

class ViewInAR extends StatefulWidget {
  const ViewInAR({Key? key}) : super(key: key);

  @override
  _ViewInARState createState() => _ViewInARState();
}

class _ViewInARState extends State<ViewInAR> {
  // String recongizedImage='';
  // ArCoreViewController arCoreViewController=new ArCoreViewController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Colors.blue,
        appBar: AppBar(
          title: const Text('ArCoreViewExample'),
          backgroundColor: Colors.black,
          centerTitle: true,
        ),
        body: Center(
          child: Text("aloha"),
          //     child: ArCoreView(
          //   focusBox: Container(
          //     width: screenSize.width * 0.5,
          //     height: screenSize.width * 0.5,
          //     decoration: BoxDecoration(
          //         border: Border.all(width: 1, style: BorderStyle.solid)),
          //   ),
          //   width: screenSize.width,
          //   height: screenSize.height,
          //   onImageRecognized: _onImageRecognized,
          //   // onArCoreViewCreated: _onArCoreViewCreated,
          // )
        ));
  }
}

NavigationRailDestination sidenavItem(icon1, icon2, isPng) {
  return isPng
      ? NavigationRailDestination(
          icon: ImageIcon(
            AssetImage(icon1),
            size: 40,
            color: Color(0xff50514f),
          ),
          selectedIcon: ImageIcon(
            AssetImage(icon2),
            size: 40,
            color: Color(0xfff5cf05),
          ),
          label: Text(''),
        )
      : NavigationRailDestination(
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
      navigate(
          context,
          ViewCollection(
            name: name,
          ));
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

Widget collectionItemUser(context, img, itemCount, name, artistName) {
  return GestureDetector(
    onTap: () {
      navigate(
          context,
          ViewCollection(
            name: name,
          ));
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
                  details("Artist:", artistName, 18),
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
Widget profileItem_User(context, img, itemCount, name, itemsSold, earnings) {
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
                details("Items Bought:", itemsSold.toString(), 18),
                // details("Name:", Name),
                // details("Items Sold:", itemsSold.toString(), 18),
                // details("Earnings:", earnings.toString() + " MIA", 18),
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
        GestureDetector(
            onTap: () {
              navigate(context, ViewInAR());
            },
            child: button(context, "View in AR", true)),
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
