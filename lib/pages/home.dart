import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
// ignore: depend_on_referenced_packages
// import 'package:scapyard/pages/details.dart';
import 'package:scrapyad/pages/details.dart';
import 'package:scrapyad/pages/login.dart';
import 'package:scrapyad/service/database.dart';
// ignore: depend_on_referenced_packages
// import 'package:scapyard/widget/widget_support.dart';
import 'package:scrapyad/widget/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool handmade = false, electronic = false, books = false, other = false;

  Stream? fooditemStream;

  ontheload() async {
    fooditemStream = await DatabaseMethods().getFoodItem('Hand-made');
    setState(() {});
  }

  @override
  void initState() {
    ontheload();
    super.initState();
  }

//vertically
Widget allItemVertically() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details(detail: ds['Detail'], name: ds['Name'], price: ds['Price'], image: ds['Image'],)));
                      },
                      child: Container(
                margin: EdgeInsets.only(right: 20.0, bottom: 20.0),
                child: Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.all(5),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ClipRRect(
                            borderRadius: BorderRadius.all(Radius.circular(20)),
                            child: Image.network(
                                ds["Image"],
                              height: 120,
                              width: 120,
                              fit: BoxFit.cover,
                            )),
                        SizedBox(
                          width: 20.0,
                        ),
                        Column(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                ds['Name'],
                                style: AppWidget.semiBoldTextFieldStyle,
                              ),
                            ),
                            SizedBox(
                              height: 2.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'Check out',
                                style: AppWidget.lightTextFieldStyle,
                              ),
                            ),
                            SizedBox(
                              height: 5.0,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                'Rs. '+ds['Price'],
                                style: AppWidget.semiBoldTextFieldStyle,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }


//horizentally
  Widget allItem() {
    return StreamBuilder(
        stream: fooditemStream,
        builder: (context, AsyncSnapshot snapshot) {
          return snapshot.hasData
              ? ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: snapshot.data.docs.length,
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    DocumentSnapshot ds = snapshot.data.docs[index];
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Details(detail: ds['Detail'], name: ds['Name'], price: ds['Price'], image: ds['Image'],)));
                      },
                      child: Container(
                        margin: EdgeInsets.all(4.0),
                        child: Material(
                          elevation: 5.0,
                          borderRadius: BorderRadius.circular(20),
                          child: Container(
                            padding: EdgeInsets.all(14),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                ClipRRect(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(20)),
                                  child: Image.network(
                                    ds['Image'],
                                    height: 150,
                                    width: 150,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Text(
                                  ds['Name'],
                                  style: AppWidget.semiBoldTextFieldStyle,
                                ),
                                SizedBox(height: 2.0,),
                                Text(
                                  "Hand Made Items",
                                  style: AppWidget.lightTextFieldStyle,
                                ),
                                SizedBox(
                                  height: 2.0,
                                ),
                                Text(
                                  "Rs."+ds['Price'],
                                  style: AppWidget.semiBoldTextFieldStyle,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  })
              : CircularProgressIndicator();
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Creative-Scrapyard",
          style: TextStyle(
            color: Colors.black,
            fontSize: 21.0,
            fontWeight:FontWeight.bold,
          ),
          ),
          actions: [
          IconButton(onPressed: (){
            
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return LogIn();
              }));
            // auth.signOut().then((value) {
            // })
            // .onError((error, stackTrace) {
              // Utils().toastMessage(error.toString());
            // });

          }, icon: Icon(Icons.logout_outlined), 
          ),
          
          // SizedBox(width: 10,),
        ],
          ),
      body: SingleChildScrollView(
        child: Container(
          margin: EdgeInsets.only(top: 10.0, left: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Creative-Scrapyard,",
              //       style: AppWidget.boldTextFieldStyle,
              //     ),
              //     Container(
              //       margin: EdgeInsets.only(right: 15),
              //       padding: EdgeInsets.all(4),
              //       decoration: BoxDecoration(
              //           color: Colors.black,
              //           borderRadius: BorderRadius.circular(9)),
              //       child: Icon(
              //         Icons.shopping_cart_outlined,
              //         color: Colors.red,
              //       ),
              //     ),
              //   ],
              // ),
              // SizedBox(
              //   height: 20,
              // ),
              Text(
                "Products",
                style: AppWidget.headlineTextFieldStyle,
              ),
              Text(
                'Discover and Get Great Products',
                style: AppWidget.lightTextFieldStyle,
              ),
              SizedBox(
                height: 20.0,
              ),

// above 4 small items
              Container(
                margin: EdgeInsets.only(right: 20),
                child: showItem()),
              SizedBox(
                height: 15.0,
              ),
              
              Container(
                height: 270,
                child: allItem()
              ),           

              SizedBox(
                height: 30.0,
              ),
              
              // Container(
                // height: 270,
                 allItemVertically(),
              // ),
            ],
          ),
        ),
      ),
    );
  }

  Widget showItem() {
    return Container(
      margin: EdgeInsets.only(right: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () async{
              handmade = true;
              electronic = false;
              books = false;
              other = false;
              fooditemStream = await DatabaseMethods().getFoodItem('Hand-made');
              setState(() {});
            },
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: handmade ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/5.png",
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                  // color: handmade? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              handmade = false;
              electronic = true;
              books = false;
              other = false;
              fooditemStream = await DatabaseMethods().getFoodItem('Electronics');
              setState(() {});
            },
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: electronic ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/2.png",
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                  // color: electronic? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              handmade = false;
              electronic = false;
              books = true;
              other = false;
              fooditemStream = await DatabaseMethods().getFoodItem('Books');

              setState(() {});
            },
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: books ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/1.png",
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                  // color: books? Colors.white: Colors.black,
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () async{
              handmade = false;
              electronic = false;
              books = false;
              other = true;
              fooditemStream = await DatabaseMethods().getFoodItem('Other');
              setState(() {});
            },
            child: Material(
              elevation: 12.0,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                    color: other ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(10)),
                padding: EdgeInsets.all(10),
                child: Image.asset(
                  "assets/images/9.png",
                  height: 45,
                  width: 45,
                  fit: BoxFit.cover,
                  color: other ? Colors.white : Colors.black,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
