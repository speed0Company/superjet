import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../generated/l10n.dart';
import '../helper/helper.dart';
import '../widgets/ticket_info.dart';

class FlyerScreen extends StatelessWidget {
   FlyerScreen({super.key});
bool isLogin=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          decoration:  BoxDecoration(
            color: Colors.white, // Background color of the AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // Shadow color
                offset: Offset(0, 4), // X and Y offset of the shadow
                blurRadius: 10, // Blur radius for the shadow
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(CupertinoIcons.back),
            ),
            notificationPredicate: (_) => false,

            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20))
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            // elevation: 4,
            title: Image.asset(
              Localizations.localeOf(context).languageCode=="ar"?"assets/images/superjet_logo.png":"assets/images/logo_english.png",
              width: 90,
              height: 90,
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: Center(
        child:!isLogin?Column(
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Padding(
              padding:  EdgeInsets.only(top: 130.0.h),
              child: Center(
                child: Padding(
                  padding: EdgeInsets.only(top: 40.h),
                  child: Image.asset(
                    Localizations.localeOf(context)
                        .languageCode ==
                        "ar" ?"assets/images/flyer_ar.png":"assets/images/flyer_en.png",
                    fit: BoxFit.cover,
                    width: 300.w,
                    height: 200.h,
                  ),
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).register_now,
                    style:GoogleFonts.cairo(
                        fontSize:
                        17.sp, // Adjust the size as needed
                        // height: 1.5,
                        fontWeight: FontWeight
                            .bold // Line height for better readability
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(

                        S.of(context).gift_point,
                    style:GoogleFonts.cairo(
                        color:headTitleColor,
                        fontSize:
                        17.sp, // Adjust the size as needed
                        // height: 1.5,
                        fontWeight: FontWeight
                            .bold // Line height for better readability
                    ),
                  ),

                ],
              ),
            ),


          ],
        ) :Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Padding(
                padding: EdgeInsets.only(top: 40.h),
                child: Image.asset(
                  Localizations.localeOf(context)
                      .languageCode ==
                      "ar" ?"assets/images/flyer_ar.png":"assets/images/flyer_en.png",
                  fit: BoxFit.cover,
                  width: 300.w,
                  height: 200.h,
                ),
              ),
            ),
            Center(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    S.of(context).total_points,
                    style:GoogleFonts.cairo(
                        fontSize:
                        17.sp, // Adjust the size as needed
                        // height: 1.5,
                        fontWeight: FontWeight
                            .bold // Line height for better readability
                    ),
                  ),
                  SizedBox(width: 10,),
                  Text(
                      Localizations.localeOf(context)
                          .languageCode ==
                          "ar" ?convertToArabicNumber(1000)+" "+S.of(context).point:"1000"+" "+S.of(context).point,
                    style:GoogleFonts.cairo(
                      color:headTitleColor,
                        fontSize:
                        17.sp, // Adjust the size as needed
                        // height: 1.5,
                        fontWeight: FontWeight
                            .bold // Line height for better readability
                    ),
                  ),

                ],
              ),
            ),
           SizedBox(height: 10,),
           Padding(
             padding:  EdgeInsets.all(5.r),
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
                       S.of(context).previous_trips,
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
                 SizedBox(height: 20,),
                 TicketInfo(
                   city: 'الإسكندرية',
                   busType: 'Royal Star',
                   numberOfTickets: 3,
                   points: 100,
                   date: '2024/11/12',
                   time: '03:30 م',
                 )

               ],
             ),
           )
          ],
        ),
      ),

    );
  }
}
