import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/style_color.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    required this.onTap,
    required this.text,
    this.isLoading
  });
  final void Function()? onTap;
  final String text;
  bool? isLoading;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10),
        child: Container(
          child: Center(child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: isLoading==true?CircularProgressIndicator(
              color: Colors.white,
            ):Text(text,style: GoogleFonts.cairo(
                fontSize: 17.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold
            ),
            ),
          )),
          decoration: BoxDecoration(
              color: typeTripColor,

              borderRadius: BorderRadius.circular(25)
          ),
        ),
      ),
    );
  }
}
