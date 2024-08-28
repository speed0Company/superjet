import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTripsScreen extends StatelessWidget {
  const MyTripsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),

      appBar: AppBar(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20))
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
        title: Image.asset(
          Localizations.localeOf(context).languageCode=="ar"?"assets/images/superjet_logo.png":"assets/images/logo_english.png",
          width: 90,
          height: 90,
        ),
        centerTitle: true,
      ),
    );
  }
}
