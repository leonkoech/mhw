import 'package:flutter/material.dart';

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
        primarySwatch: Colors.blue,
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
        appBar: customAppBar("MHW"),
        body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              GestureDetector(
                  onTap: () {
                    navigate(context, const SignUpPage());
                  },
                  child: button("Sign Up", false)),
              SizedBox(height: 20,),
              GestureDetector(
                  onTap: () {
                    navigate(context, const LoginPage());
                  },
                  child: button("Log In", false)),
            ],
          ),
        ));
  }
}

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  TextEditingController email=TextEditingController();
  TextEditingController username=TextEditingController();
  TextEditingController password=TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar("Sign Up"),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
            
        ],
      )
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
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

Container button(txt, isTransparent) {
  return Container(
    color: isTransparent ? Colors.white : Colors.black,
    height: 50,
    width: 120,
    child: Center(
      child: Text(
        txt,
        style: TextStyle(
            color: isTransparent ? Colors.black : Colors.white, fontSize: 18),
      ),
    ),
  );
}

// function to navigate to the naxt page
// func is the object/page
navigate(context, func) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => func));
}
