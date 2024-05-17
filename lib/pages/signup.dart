import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrapyad/pages/bottomnav.dart';
import 'package:scrapyad/pages/login.dart';
import 'package:scrapyad/widget/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  
  final _formkey = GlobalKey<FormState>();

  String name = "", email = "", password = "";
  TextEditingController namecontroller = new TextEditingController();
  TextEditingController emailcontroller = new TextEditingController();
  TextEditingController passwordcontroller = new TextEditingController();


  registration() async {
    if (password != null) {
      try {
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(
            backgroundColor: Colors.green,
            content: Text(
          'Registration Successfully',
          style: TextStyle(fontSize: 20),
        ))));

        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => BottomNav() ));

      } on FirebaseException catch (e) {
        if (e.code == 'weak-password') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
              content: Text(
            'Password is too weak',
            style: TextStyle(fontSize: 18),
          )));
        } else if (e.code == 'email-already-in-use') {
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.orange,
              content: Text(
            'Account Already exsists',
            style: TextStyle(fontSize: 18),
          )));
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            children: [
        //1. top blue...
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Colors.blue,
                      Colors.cyan,
                    ],
                  ),
                ),
              ),
        
        //2. bottom white
              Container(
                margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height / 2.2),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                        topRight: Radius.circular(50))),
              ),
        
        //3. login box
              Container(
                margin: EdgeInsets.only(top: 60.0, left: 20.0, right: 20.0),
                child: Column(
                  children: [
                    Center(
                        child: Image.asset(
                      "assets/images/logo2.jpeg",
                      width: MediaQuery.of(context).size.width / 2.5,
                      fit: BoxFit.cover,
                    )),
                    SizedBox(
                      height: 50.0,
                    ),
                    Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.only(left: 20, right: 20),
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 1.9,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)),
                          
        // form...                      
                        child: Form(
                          key: _formkey,
        
                          child: Column(
                            children: [
                              SizedBox(
                                height: 30.0,
                              ),
                              Text(
                                'Sign up',
                                style: AppWidget.headlineTextFieldStyle,
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
          // name ......                          
                              TextFormField(
                                controller: namecontroller,
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return 'Please Enter Name';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Name',
                                    hintStyle: AppWidget.semiBoldTextFieldStyle,
                                    prefixIcon: Icon(Icons.person_2_outlined)),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
        
        // email ....
                              TextFormField(
                                controller: emailcontroller,
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return 'Please Enter Email';
                                  }
                                  return null;
                                },
                                decoration: InputDecoration(
                                    hintText: 'Email',
                                    hintStyle: AppWidget.semiBoldTextFieldStyle,
                                    prefixIcon: Icon(Icons.email_outlined)),
                              ),
                              SizedBox(
                                height: 30.0,
                              ),
        
        // password......
                              TextFormField(
                                controller: passwordcontroller,
                                validator: (value) {
                                  if(value==null || value.isEmpty){
                                    return 'Please Enter Password';
                                  }
                                  return null;
                                },
                                obscureText: true, // Secure password
                                decoration: InputDecoration(
                                  hintText: 'Password',
                                  hintStyle: AppWidget.semiBoldTextFieldStyle,
                                  prefixIcon: Icon(Icons.password_outlined),
                                ),
                              ),
                              SizedBox(
                                height: 50,
                              ),
        
        // button.........
                              GestureDetector(
                                onTap: () async{
                                  if(_formkey.currentState!.validate()){
                                    setState(() {
                                      name = namecontroller.text;
                                      email = emailcontroller.text;
                                      password = passwordcontroller.text;
                                    });
                                  }
                                  registration();
                                },
        
                                child: Material(
                                  borderRadius: BorderRadius.circular(20),
                                  elevation: 8.0,
                                  child: Container(
                                    padding: EdgeInsets.symmetric(vertical: 8.0),
                                    width: 200,
                                    height: 45,
                                    decoration: BoxDecoration(
                                        color: Colors.green,
                                        borderRadius: BorderRadius.circular(20)),
                                    child: Center(
                                        child: Text(
                                      'SIGN UP',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 18.0,
                                          fontFamily: 'Poppins1',
                                          fontWeight: FontWeight.bold),
                                    )),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 50.0,
                    ),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => LogIn()));
                        },
                        child: Text(
                          "Already have an account? Login",
                          style: AppWidget.semiBoldTextFieldStyle,
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
