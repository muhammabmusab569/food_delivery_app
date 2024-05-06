
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/pages/bottom_nav.dart';
import 'package:food_delivery_app/pages/login.dart';

import '../widgets/widget_support.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  String email ="", password ="",name="";

  TextEditingController namecontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  TextEditingController mailcontroller = TextEditingController();

  final _formkey = GlobalKey<FormState>();

  registraion()async{
    if(password != null){
      try{
        UserCredential userCredential = await FirebaseAuth.instance.createUserWithEmailAndPassword(email: email, password: password);
        ScaffoldMessenger.of(context).showSnackBar((SnackBar(content: Text("Registered Successfully",style: TextStyle(fontSize: 20.0),))));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>BottomNav()));
      }
      on FirebaseAuthException catch(e){
        if(e.code == 'weak-password'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Password Provided is too Weak",style: TextStyle(fontSize: 18.0),)));

        }else if(e.code == 'email-already-in-use'){
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(backgroundColor: Colors.orangeAccent,content: Text("Account Already exists",style: TextStyle(fontSize: 18.0),)));


        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2.5,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      Color(0xFFff5c30),
                      Color(0xFFe74b1a),
                    ]),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: MediaQuery.of(context).size.height/3),
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height/2,
              decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.only(topLeft: Radius.circular(40),topRight: Radius.circular(40))),
              child: Text(""),
            ),
            Container(
              margin: EdgeInsets.only(top: 40.0, left: 20.0, right: 20.0),
              child: Column(children: [
                Center(child: Image.asset('assets/images/logo.png',width: MediaQuery.of(context).size.width/1.5,fit: BoxFit.cover,)),
                SizedBox(height: 50.0,),
                Material(
                  elevation: 5.0,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    padding: EdgeInsets.only(left: 20.0,right: 20.0),
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height/1.8,
                    decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),),
                    child: Form(
                      key: _formkey,
                      child: Column(children: [
                        SizedBox(height: 30.0,),
                        Text("Sign Up",style: AppWidget.headlineTextFeildStyle(),),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: namecontroller,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Your Name";
                            }else{return null;}
                          },
                          decoration: InputDecoration(
                            hintText: 'Name',hintStyle: AppWidget.semiBoldTextFeildStyle(),prefixIcon: Icon(Icons.person),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: mailcontroller,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Your E-mail";
                            }else{return null;}
                          },
                          decoration: InputDecoration(
                            hintText: 'Email',hintStyle: AppWidget.semiBoldTextFeildStyle(),prefixIcon: Icon(Icons.email_outlined),
                          ),
                        ),
                        SizedBox(height: 30.0,),
                        TextFormField(
                          controller: passwordcontroller,
                          validator: (value){
                            if(value == null || value.isEmpty){
                              return "Please Enter Your Password";
                            }else{return null;}
                          },
                          obscureText: true,
                          decoration: InputDecoration(hintText: 'Password',hintStyle: AppWidget.semiBoldTextFeildStyle(),prefixIcon: Icon(Icons.password_outlined),),
                        ),
                        SizedBox(height: 60.0,),
                        GestureDetector(
                          onTap: () async {
                            if (_formkey.currentState!.validate()) {
                              setState(() {
                                name = namecontroller.text;
                                email = mailcontroller.text;
                                password = passwordcontroller.text;
                              });
                              await registraion(); // Call the registration method
                            }
                          },
                          child: Material(
                            elevation: 5.0,
                            borderRadius: BorderRadius.circular(20),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 8.0),
                              width: 200,
                              decoration: BoxDecoration(
                                  color: Color(0xFFff5722),
                                  borderRadius: BorderRadius.circular(20)
                              ),
                              child: Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18.0,
                                      fontFamily: 'Poppins1',
                                      fontWeight: FontWeight.bold
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),

                      ],
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 70.0,),
                GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (cotext)=>LogIn()));
                    },
                    child: Text("Already have an account? Login",style: AppWidget.semiBoldTextFeildStyle(),)),
              ],),
            ),
          ],
        ),
      ),
    );
  }
}
