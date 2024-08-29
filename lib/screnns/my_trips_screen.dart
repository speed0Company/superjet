import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import '../widgets/ticket_info.dart';
import '../widgets/trip_info.dart';

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
      body:Padding(
        padding:  EdgeInsets.only(
          top: 25.h,
          left: 5.w,
          right: 5.w
        ),
        child: Column(
          children: [
            Row(
              children: [
                Container(
                  color: headTitleColor,
                  height: 25,
                  width: 4,
                ),
                SizedBox(width: 10,),
                Text(
                  S.of(context).my_trip,
                  style:GoogleFonts.cairo(
                      fontSize:
                      15.sp, // Adjust the size as needed
                      // height: 1.5,
                      fontWeight: FontWeight
                          .bold // Line height for better readability
                  ),
                ),

              ],
            ),
            SizedBox(height: 2,),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.only(bottom: 30.h),
                  itemBuilder: (context, index) =>     TripsInfo(
                    cityTo: 'الإسكندرية',
                    cityFrom: "القاهره",
                    busType: 'Royal Star',
                    numberOfTickets: 3,
                    points: 100,
                    date: '2024/11/12',
                    time: '03:30 م',
                    status: "رحلة قادمة",
                  ),
                  separatorBuilder: (context, index) => SizedBox(height: 10.h,),
                  itemCount: 10
              ),
            ),


          ],
        ),
      ),
    );
  }
}
