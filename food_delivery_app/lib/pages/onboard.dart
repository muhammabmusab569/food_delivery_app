
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../widgets/content_model.dart';
import '../widgets/widget_support.dart';
import 'signup.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {

  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    // TODO: implement initState
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
                controller: _controller,
                itemCount: contents.length,
                onPageChanged: (index){
                  setState(() {
                    currentIndex = index;
                  });
                },
                itemBuilder: (_,i){
                  return Padding(padding: EdgeInsets.only(top: 40.0,left: 20.0,right: 20.0),
                    child: Column(
                      children: [
                        Image.asset(contents[i].image,height: 450,width: MediaQuery.of(context).size.width,fit: BoxFit.fill,),
                        SizedBox(height: 40.0,),
                        Text(contents[i].title,style: AppWidget.semiBoldTextFeildStyle(),textAlign: TextAlign.center,),
                        SizedBox(height: 20.0,),
                        Text(contents[i].description,style: AppWidget.lightTextFeildStyle(),textAlign: TextAlign.center,),
                      ],
                    ),
                  );
                }),
          ),
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(contents.length, (index)=>
                  buildDot(index,context),
              ),
            ),
          ),
          GestureDetector(
            onTap: (){
              if(currentIndex==contents.length-1){
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SignUp()));
              }
              _controller.nextPage(duration: Duration(milliseconds: 100), curve: Curves.bounceIn);
            },
            child: Container(
              height: 60.0,
              width: double.infinity,
              margin: EdgeInsets.all(40),
              decoration: BoxDecoration(color: Colors.red,borderRadius: BorderRadius.circular(20)),
              child: Center(child: Text(currentIndex==contents.length-1 ? "Start" : "Next",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 20.0))),
            ),
          ),

        ],
      ),
    );
  }

  Container buildDot(int index,BuildContext context){
    return Container(
      height: 10.0,
      width: currentIndex == index ? 18 : 7,
      margin: EdgeInsets.only(right: 5.0),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(6),color: Colors.black38),
    );
  }
}
