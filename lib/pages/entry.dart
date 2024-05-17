import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrapyad/admin/admin_login.dart';
import 'package:scrapyad/pages/login.dart';
import 'package:scrapyad/pages/signup.dart';
import 'package:scrapyad/widget/widget_support.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key});

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        title: Text("What You Want.....?", style: TextStyle(color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Container(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [


              Material(
                  elevation: 10,
                  borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(30),
                  decoration: BoxDecoration(
                    
                  ),
                  child: Column(
                    children: [
                      Text('Sale Something...', style: AppWidget.headlineTextFieldStyle,),
                      SizedBox(height: 30,),
                      ElevatedButton(

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red, // background
                            foregroundColor: Colors.yellow, // foreground
                          ),
                        
                        onPressed:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return AdminLogin();
                          }));
                      }, child: Text('Seller', style: TextStyle(color: Colors.white, fontSize: 30),))
                    ],
                  ),
                ),
              ),
              SizedBox(height: 100,),

              
              
              Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Text('Buy Something...', style: AppWidget.headlineTextFieldStyle,),
                      SizedBox(height: 30,),
                      ElevatedButton(
                        

                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.green, // background
                            foregroundColor: Colors.black, // foreground
                          ),


                        onPressed:() {
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return LogIn();
                          }));
                      }, child: Text('Customer', style: TextStyle(color: Colors.white, fontSize: 30),))
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}