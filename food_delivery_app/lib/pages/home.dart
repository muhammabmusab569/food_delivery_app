
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:food_delivery_app/pages/details.dart';
import 'package:food_delivery_app/widgets/widget_support.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}
class _HomeState extends State<Home> {

  bool icecream = false,pizza = false, salad = false, burger = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 50.0,left: 20.0,),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Musab",style: AppWidget.boldTextFeildStyle()),
                Container(
                  margin: EdgeInsets.only(right: 20.0),
                  padding: EdgeInsets.all(3),
                  decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(8)),
                  child: Icon(Icons.shopping_cart,color: Colors.white,),
                ),
              ],
            ),
            SizedBox(height: 30.0,),
            Text("Delicious Food",style: AppWidget.headlineTextFeildStyle()),
            // SizedBox(height: 30.0,),
            Text("Discover and Get Great Food",style: AppWidget.lightTextFeildStyle()),
            SizedBox(height: 30.0,),
            Container(margin: EdgeInsets.only(right: 20.0),child: showItem()),
            SizedBox(height: 30.0,),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context)=>Details()));
                    },
                    child: Container(
                      margin: EdgeInsets.all(4),
                      child: Material(
                        elevation: 5.0,
                        borderRadius: BorderRadius.circular(20),
                        child: Container(
                          padding: EdgeInsets.all(14),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.asset('assets/images/salad2.png',height: 150,width: 150,fit: BoxFit.cover,),
                              Text("Veggei Taco Hash",style: AppWidget.semiBoldTextFeildStyle(),),
                              SizedBox(height: 5.0,),
                              Text("Fresh and Healthy",style: AppWidget.lightTextFeildStyle(),),
                              SizedBox(height: 5.0,),
                              Text("\$25",style: AppWidget.semiBoldTextFeildStyle(),),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0,),
                  Container(
                    margin: EdgeInsets.all(4),
                    child: Material(
                      elevation: 5.0,
                      borderRadius: BorderRadius.circular(20),
                      child: Container(
                        padding: EdgeInsets.all(14),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Image.asset('assets/images/salad2.png',height: 150,width: 150,fit: BoxFit.cover,),
                            Text("Mix Veg Salad",style: AppWidget.semiBoldTextFeildStyle(),),
                            SizedBox(height: 5.0,),
                            Text("Spicy wit Onion",style: AppWidget.lightTextFeildStyle(),),
                            SizedBox(height: 5.0,),
                            Text("\$28",style: AppWidget.semiBoldTextFeildStyle(),),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 30.0,),
            Container(
              margin: EdgeInsets.only(right: 20.0),
              child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(20),
                child: Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/images/salad2.png',height: 120,width: 120,fit: BoxFit.cover,),
                      SizedBox(width: 30.0,),
                      Column(
                        children: [
                          Container(width: MediaQuery.of(context).size.width/2, child: Text("Mediterranean Chickpea Salad",style: AppWidget.semiBoldTextFeildStyle(),)),
                          SizedBox(height: 5.0,),
                          Container(width: MediaQuery.of(context).size.width/2, child: Text("Honey Goot Cheese",style: AppWidget.lightTextFeildStyle(),)),
                          SizedBox(height: 5.0,),
                          Container(width: MediaQuery.of(context).size.width/2, child: Text("\$28",style: AppWidget.semiBoldTextFeildStyle(),)),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }







  Widget showItem(){
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        GestureDetector(
          onTap: (){
            icecream = true;
            pizza = false;
            salad = false;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: icecream? Colors.black : Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/ice-cream.png',height: 40,width: 40,fit: BoxFit.cover,color: icecream? Colors.white : Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream = false;
            pizza = true;
            salad = false;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: pizza? Colors.black : Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/pizza.png',height: 40,width: 40,fit: BoxFit.cover,color: pizza? Colors.white : Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream = false;
            pizza = false;
            salad = true;
            burger = false;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: salad? Colors.black : Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/salad.png',height: 40,width: 40,fit: BoxFit.cover,color: salad? Colors.white : Colors.black,),
            ),
          ),
        ),
        GestureDetector(
          onTap: (){
            icecream = false;
            pizza = false;
            salad = false;
            burger = true;
            setState(() {

            });
          },
          child: Material(
            elevation: 5.0,
            borderRadius: BorderRadius.circular(10),
            child: Container(
              decoration: BoxDecoration(color: burger? Colors.black : Colors.white,borderRadius: BorderRadius.circular(10)),
              padding: EdgeInsets.all(8),
              child: Image.asset('assets/images/burger.png',height: 40,width: 40,fit: BoxFit.cover,color: burger? Colors.white : Colors.black,),
            ),
          ),
        ),
      ],
    );
  }
}
