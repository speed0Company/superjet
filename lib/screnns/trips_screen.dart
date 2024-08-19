import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/screnns/seat_selection_screen.dart';

import '../generated/l10n.dart';

class TripsScreen extends StatelessWidget {
  TripsScreen({required this.fromCity,required this.toCity});
final String fromCity;
final String toCity;
final int numberOfSetsRemaining=10;
final int numberOfTickets=2;
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
      body: Column(
        children: [
          Divider(
            color: Colors.grey,
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Row(
                children: [
                  Text(
                    fromCity,
                    style: GoogleFonts.cairo(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 25.0.r),
                    child: Container(
                      width: 60.w,
                      height: 60.h,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/arrow.png")
                        )
                      ),
                    ),
                  ),
                  Text(
                   toCity,
                    style: GoogleFonts.cairo(
                      fontSize: 20.0.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
            ),
          ),
         Expanded(
           child: ListView.separated(

             padding: EdgeInsets.only(bottom: 20.h),
               itemBuilder: (context, index) =>Padding(
                 padding:  EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width/6),
                 child: Container(
                   padding:  EdgeInsets.symmetric(horizontal: 15.0.r,vertical: 20.r),

                   decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(15.r),

                       border: Border.all(color: headTitleColor)
                   ),
                   child: Column(
                     children: [
                       Text(
                         "Royal Star",
                         style: GoogleFonts.cairo(
                             fontSize: 25.sp,
                             fontWeight: FontWeight.bold,
                             color: typeTripColor
                         ),
                       ),
                       Image.asset("assets/images/bus_icon.png",height: 70.h,width: 70.w,),
                       Text(
                         " $numberOfSetsRemaining "+S.of(context).remaining_chairs,
                         style: GoogleFonts.cairo(
                             fontSize: 17.sp,
                             fontWeight: FontWeight.bold,
                             color: typeTripColor
                         ),
                       ),
                       SizedBox(height: 12.h,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "2024/11/12",
                             style: GoogleFonts.cairo(
                                 fontSize: 17.sp,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey
                             ),
                           ),
                           Spacer(),
                           Icon(CupertinoIcons.calendar_today,color: Colors.red,),


                         ],
                       ),
                       SizedBox(height: 10.h,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             "3 am",
                             style: GoogleFonts.cairo(
                                 fontSize: 17.sp,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey
                             ),
                           ),
                           Spacer(),
                           Image.asset("assets/images/time.png",width: 18.w,height: 18.h,)


                         ],
                       ),
                       SizedBox(height: 10.h,),
                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text(
                             " ${numberOfTickets} "+S.of(context).tickets,
                             style: GoogleFonts.cairo(
                                 fontSize: 17.sp,
                                 fontWeight: FontWeight.bold,
                                 color: Colors.grey
                             ),
                           ),
                           Spacer(),
                           Image.asset("assets/images/ticket_icon.png",width: 20.w,height: 20.h,)


                         ],
                       ),
                       SizedBox(height: 25.h,),
                       GestureDetector(
                         onTap: () {
                           Navigator.push(context, MaterialPageRoute(builder: (context) => SeatSelectionScreen(),));
                         },
                         child: Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5.r),
                             color: headTitleColor,
                           ),
                           child: Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Center(
                               child: Text(
                                 S.of(context).reservation,
                                 style: GoogleFonts.cairo(
                                   color: Colors.white,
                                   fontSize: 15.sp,
                                   fontWeight: FontWeight.bold,
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
                separatorBuilder:(context, index) => SizedBox(height: 20,) , itemCount: 10),
         )

        ],
      ),
    );
  }
}
