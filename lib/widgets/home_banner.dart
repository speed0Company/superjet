import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/screnns/book_screen.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import '../screnns/flyer_screen.dart';
import '../screnns/mini_jet.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({ super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        // Background image
        Image.asset(
          'assets/images/home_panner.png',
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover, // Ensure the image covers the entire width
          height: MediaQuery.of(context).size.height/4, // Make sure it fills the screen
        ),

        // Centered logo
        Align(
          alignment: Alignment.center,
          child: Localizations.localeOf(context)
              .languageCode ==
              "ar"? Image.asset(
           "assets/images/superjet_logo_2.png",
            width: MediaQuery.of(context).size.height/5,
            height: 120.h,
          ):Image.asset(
            "assets/images/super_jet_en.png",
            width: MediaQuery.of(context).size.height/6,
            height: 120.h,
          ),
        ),

        // Containers at the bottom
        Align(
          alignment: Alignment.bottomCenter,
          heightFactor: MediaQuery.of(context).size.height/380.h,
          child: Padding(
            padding: EdgeInsets.only(bottom: 8.h), // Adjust bottom padding if needed
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // First container
                GestureDetector(
                  onTap:(){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/bus_icon.png',width: MediaQuery.of(context).size.width/10,height: MediaQuery.of(context).size.height/18,color: thirdTripColor,),
                        SizedBox(height: 10.h),
                        Text(
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          S.of(context).head_title,
                          style: GoogleFonts.cairo(
                            fontSize: MediaQuery.of(context).size.height*0.012.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                // Second container
                GestureDetector(
                  onTap: (){
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => MiniJetScreen(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/bus_icon.png',width: MediaQuery.of(context).size.width/10,height: MediaQuery.of(context).size.height/18,color: thirdTripColor,),
                        SizedBox(height: 10.h),
                        Text(
                          maxLines: 3,

                          overflow: TextOverflow.ellipsis,
                          S.of(context).to_private_trip,
                          style: GoogleFonts.cairo(
                            fontSize: MediaQuery.of(context).size.height*0.012.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),

                // Third container
                GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context) => FlyerScreen(),));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.30,
                    height: MediaQuery.of(context).size.height * 0.15,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 5,
                          offset: Offset(0, 3), // Shadow position
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/bus_icon.png',width: MediaQuery.of(context).size.width/10,height: MediaQuery.of(context).size.height/18,color: thirdTripColor,),
                        SizedBox(height: 10.h),
                        Text(
                          maxLines: 3,

                          overflow: TextOverflow.ellipsis,
                          S.of(context).flyer,
                          style: GoogleFonts.cairo(
                            fontSize: MediaQuery.of(context).size.height*0.011.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
