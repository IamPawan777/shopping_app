

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:scrapyad/pages/entry.dart';
import 'package:scrapyad/pages/login.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  padding: EdgeInsets.only(top: 45, left: 20, right: 20),
                  height: MediaQuery.of(context).size.height/4.3,
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                    color: Colors.black,
                    borderRadius: BorderRadius.vertical(
                      bottom: Radius.elliptical(MediaQuery.of(context).size.width, 105),
                    )
                  ),
                ), 
                Center(
                  child: Container(margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/6.5),
                  child: Material(
                    elevation: 10,
                    borderRadius:  BorderRadius.circular(60),
                    child: ClipRRect(
                      borderRadius:  BorderRadius.circular(60),
                      child: Image.asset("assets/images/profile.jpg", height: 120, width: 120, fit: BoxFit.cover,)),
                  ),
                  ),
                ),
                
                Padding(
                  padding: EdgeInsets.only(top: 70, ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                    Text('Profile', style: TextStyle(
                      color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold, fontFamily: 'Poppins'
                    ),)
                  ],),
                ),

              ],
            ),

            SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.person_2, color: Colors.black,),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Name", style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,
                          ),),
                           Text("Pawan Bisht", style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.email, color: Colors.black,),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email", style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,
                          ),),
                           Text("2130102@sliet.ac.in", style: TextStyle(
                            color: Colors.black, fontSize: 16, fontWeight: FontWeight.w600,
                          ),)
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 20,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: Material(
                borderRadius: BorderRadius.circular(10),
                elevation: 3,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: 25,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    children: [
                      Icon(Icons.file_copy, color: Colors.black,),
                      SizedBox(width: 20,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Terms and Conditions", style: TextStyle(
                            color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600,
                          ),),
                           
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),

             SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return LogIn();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.delete_forever_rounded, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Delete Account", style: TextStyle(
                              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600,
                            ),),
                             
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

             SizedBox(height: 20,),
            GestureDetector(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return EntryPage();
                }));
              },
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 20),
                child: Material(
                  borderRadius: BorderRadius.circular(10),
                  elevation: 3,
                  child: Container(
                    padding: EdgeInsets.symmetric(
                     vertical: 25,
                      horizontal: 20,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.logout_outlined, color: Colors.black,),
                        SizedBox(width: 20,),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Logout", style: TextStyle(
                              color: Colors.black, fontSize: 20, fontWeight: FontWeight.w600,
                            ),),
                             
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}