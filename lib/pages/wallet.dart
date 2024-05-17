import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:scrapyad/widget/app_constant.dart';
import 'package:scrapyad/widget/widget_support.dart';
import 'package:http/http.dart' as http;

class Wallet extends StatefulWidget {
  const Wallet({super.key});

  @override
  State<Wallet> createState() => _WalletState();
}

class _WalletState extends State<Wallet> {

  Map<String, dynamic>? paymentIntent;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 60),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Material(
              elevation: 2.0,
              child: Container(
                padding: EdgeInsets.only(bottom: 10),
                child: Center(child: Text("Wallet", style: AppWidget.headlineTextFieldStyle,))
              ),
            ),
            SizedBox(height: 30,),

// wallet icon
            Container(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              width: MediaQuery.of(context).size.width,

              decoration: BoxDecoration(
                color: Color(0xFFF2F2F2)
              ),
              child: Row(
                children: [
                  Image.asset("assets/images/wallet.png", height: 60, width: 60, fit: BoxFit.cover,),
                  SizedBox(width: 40,),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Your Wallet', style: AppWidget.lightTextFieldStyle,),
                      SizedBox(height: 5,),
                      Text("Rs."+"100", style: AppWidget.boldTextFieldStyle,)
                    ],
                  )

                ],
              ),
            ),
            // SizedBox(height: 15,),
            Spacer(),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text('Add Money', style: AppWidget.boldTextFieldStyle,),
            ),
            // SizedBox(height: 2,),

// RS icons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE9E2E2)),
                    borderRadius:BorderRadius.circular(5),
                  ),
                  child: Text("Rs."+'100',
                  style: AppWidget.semiBoldTextFieldStyle,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE9E2E2)),
                    borderRadius:BorderRadius.circular(5),
                  ),
                  child: Text("Rs."+'500',
                  style: AppWidget.semiBoldTextFieldStyle,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE9E2E2)),
                    borderRadius:BorderRadius.circular(5),
                  ),
                  child: Text("Rs."+'1000',
                  style: AppWidget.semiBoldTextFieldStyle,),
                ),
                Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(color: Color(0xFFE9E2E2)),
                    borderRadius:BorderRadius.circular(5),
                  ),
                  child: Text("Rs."+'2000',
                  style: AppWidget.semiBoldTextFieldStyle,),
                ),
              ],
            ),

//button
            SizedBox(height: 40,),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              padding: EdgeInsets.symmetric(vertical: 12),
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Color(0xFF008080),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text('Add Money', style: TextStyle(fontFamily:'Poppins', color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),),
              ),
            ),
            SizedBox(height: 50,)
          ],
        ),
      ),
    );
  }
}