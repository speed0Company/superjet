import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../generated/l10n.dart';

class ErrorSearch extends StatelessWidget {
  const ErrorSearch({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        notificationPredicate: (_) => false,

        surfaceTintColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(CupertinoIcons.back),
          onPressed: (){
            Navigator.pop(context);
          },

        ),
      ),
      body:Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Divider(
            color: Colors.grey,
          ),
          // SizedBox(height: MediaQuery.of(context).size.width/3,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/error_search.png",
                  width: 230,
                  height: 230,
                ),
                SizedBox(height: 20), // Space between the image and text
                Text(S.of(context).not_found_trip,
                  style:GoogleFonts.cairo(
                      fontSize: 16.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                  ), ),
                SizedBox(height: 30), // Space between the text and button
                GestureDetector(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 120),
                    child: Container(
                      decoration: BoxDecoration(
                        color: headTitleColor,
                        borderRadius: BorderRadius.circular(25),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Center(child: Text(S.of(context).back,style:GoogleFonts.cairo(
                            fontSize: 16.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                        ) ,)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
