import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

void showAlertDialog(BuildContext context, String message) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(

        content: Text(message,style: GoogleFonts.cairo(
          fontSize: 12.sp, // Adjust the size as needed
          fontWeight: FontWeight.bold,
          height:
          1.5, // Line height for better readability
        ),),
        actions: [
         Padding(
           padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 15),
           child: GestureDetector(
             onTap: (){
               Navigator.pop(context);
             },
             child: Padding(
               padding: const EdgeInsets.symmetric(horizontal: 50.0,vertical: 10),
               child: Container(
                 child: Center(child: Padding(
                   padding: const EdgeInsets.all(12.0),
                   child: Text("OK",style: GoogleFonts.cairo(
                       fontSize: 12.sp,
                       color: Colors.white,
                       fontWeight: FontWeight.bold,

                   ),
                   ),
                 )),
                 decoration: BoxDecoration(
                     color: headTitleColor,

                     borderRadius: BorderRadius.circular(10)
                 ),
               ),
             ),
           ),
         )
        ],
      );
    },
  );
}
