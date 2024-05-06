
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:food_delivery_app/firebase_options.dart';
import 'package:food_delivery_app/pages/onboard.dart';
import 'package:food_delivery_app/pages/wallet.dart';
import 'package:food_delivery_app/widgets/app_constant.dart';

void main()async{
  WidgetsFlutterBinding.ensureInitialized();
  Stripe.publishableKey = publishableKey;

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      // home: Home(),
      // home: BottomNav(),
      // home: LogIn(),
      // home: SignUp(),
      // home: ForgotPassword(),
      home: Wallet(),
      // home: Onboard(),
    );
  }
}

