import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:scrapyad/service/database.dart';
import 'package:scrapyad/service/shared_pref.dart';
import 'package:scrapyad/widget/widget_support.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Details extends StatefulWidget {
  // const Details({super.key});
  String image, name, detail, price;
  Details(
      {required this.detail,
      required this.image,
      required this.name,
      required this.price});



  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  int a = 1, total = 0;
  String? id;

  getthesharedpref() async {
    id = await SharedPreferenceHelper().getUserId();
    setState(() {});
  }

  ontheload() async {
    await getthesharedpref();
    setState(() {});
  }

   @override
  void initState() {
    super.initState();
    ontheload();
    total = int.parse(widget.price);
  }

  // getthesharedpref() async {
  //   id = await SharedPreferenceHelper().getUserId();
  //   setState(() {});
  // }

  // ontheload() async {
  //   await getthesharedpref();
  //   setState(() {

  //   });
  // }



  // @override
  // void initState() {
  //   super.initState();
  //   ontheload();
  //   total=int.parse(widget.price);
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15,),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            
            ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(200)),
              child: Image.network(
                widget.image,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                fit: BoxFit.fill,
              ),
            ),
            SizedBox(
              height: 40.0,
            ),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "You can buy more the one quantity",
                      style: AppWidget.lightTextFieldStyle,
                    ),
                    Text(
                      widget.name,
                      style: AppWidget.headlineTextFieldStyle,
                    ),
                  ],
                ),
                Spacer(),
                
                GestureDetector(
                  onTap: () {
                    if (a > 1) {
                      --a;
                    total = total - int.parse(widget.price);
                    }
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.remove,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Text(
                  a.toString(),
                  style: AppWidget.semiBoldTextFieldStyle,
                ),
                SizedBox(
                  width: 15.0,
                ),
                GestureDetector(
                  onTap: () {
                    ++a;
                    total = total + int.parse(widget.price);
                    setState(() {});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(5)),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),

         
            SizedBox(
              height: 20.0,
            ),
            Text(
              widget.detail,
              maxLines: 5,
              style: AppWidget.lightTextFieldStyle,
            ),
             SizedBox(
              height: 30.0,
            ),

            Row(
              children: [
                Text(
                  "Delivery Time",
                  style: AppWidget.semiBoldTextFieldStyle,
                ),
                // SizedBox(
                //   width: 30.0,
                // ),
                Spacer(),
                Icon(
                  Icons.alarm,
                  color: Colors.black,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  '30 min',
                  style: AppWidget.semiBoldTextFieldStyle,
                ),
              ],
            ),



// Bottom Part........
            Spacer(),

           
            Container(
              padding: EdgeInsets.only(bottom: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Price",
                        style: AppWidget.semiBoldTextFieldStyle,
                      ),
                      Text(
                        'Rs. '+total.toString(),
                        style: AppWidget.semiBoldTextFieldStyle,
                      )
                    ],
                  ),
                  GestureDetector(
                    onTap: () async {
                      Map<String, dynamic> addFoodtoCart = {
                        'Name':widget.name,
                        'Quantity': a.toString(),
                        'Total': total.toString(),
                        'Image': widget.image
                      };
                      await DatabaseMethods().addFoodToCart(addFoodtoCart, id!);
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                          backgroundColor: Colors.greenAccent,
                          content: Text(
                            'Added items',
                            style: TextStyle(fontSize: 18),
                          )));
                    },
                    child: Container(
                      width: MediaQuery.of(context).size.width / 2.4,
                      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 6),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(
                        // mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Add to Cart',
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: 'Poppins',
                                fontSize: 16.0),
                          ),
                          // SizedBox(
                          //   width: 30.0,
                          // ),
                          Spacer(),
                          Container(
                            padding: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                                color: Colors.grey,
                                borderRadius: BorderRadius.circular(5)),
                            child: Icon(
                              Icons.shopping_cart_outlined,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(
                            width: 10.0,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
