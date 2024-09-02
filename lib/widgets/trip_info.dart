import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../generated/l10n.dart';

class TripsInfo extends StatelessWidget {
  // Input values for dynamic content
  final String cityFrom;
  final String cityTo;
  final String busType;
  final int numberOfTickets;
  final String date;
  final String time;
  final String status;

  // Constructor to accept input values
  TripsInfo({
    required this.cityFrom,
    required this.cityTo,
    required this.busType,
    required this.numberOfTickets,
    required this.date,
    required this.time,
    required this.status,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(7),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3), // Shadow position
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Text(status,
            style:GoogleFonts.cairo(
              color: Colors.green,
              fontSize: MediaQuery.of(context).size.width/32,
              fontWeight: FontWeight
                  .bold, // Adjust the size as needed

            ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  cityFrom,
                  style: GoogleFonts.cairo(
                    fontSize: MediaQuery.of(context).size.width/30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.symmetric(horizontal: 25.0.r),
                  child: Container(
                    width: MediaQuery.of(context).size.width/7.w,
                    height: 40.h,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/arrow.png")
                        )
                    ),
                  ),
                ),
                Text(
                  cityTo,
                  style: GoogleFonts.cairo(
                    fontSize: MediaQuery.of(context).size.width/30,
                    fontWeight: FontWeight.bold,
                  ),
                )
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  children: [
                    Text(
                      busType,
                      style: GoogleFonts.cairo(
                        color: thirdTripColor,
                        fontSize: MediaQuery.of(context).size.width/32,
                        fontWeight: FontWeight
                            .bold, // Adjust the size as needed

                      ),
                    ),
                    SizedBox(height: 10,),
                    Icon(Icons.directions_bus, color: Colors.grey,size: MediaQuery.of(context).size.width/18,),
                  ],
                ),
                SizedBox(width: 5,),
                Row(
                  children: [
                    Text(
                        '$numberOfTickets ${S.of(context).tickets}',
                        style: GoogleFonts.cairo(
                          color: Colors.grey,
                          fontSize: MediaQuery.of(context).size.width/32,
                          fontWeight: FontWeight
                              .bold, // Adjust the size as needed

                        )
                    ),
                    SizedBox(width: 10,),

                    Image.asset("assets/images/ticket_icon.png",width: MediaQuery.of(context).size.width/18,height: 25,),

                  ],
                ),
                SizedBox(width: 5,),
                Row(
                  children: [
                    Text(
                      date,
                      style:  GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width/32,
                        fontWeight: FontWeight
                            .bold, // Adjust the size as needed

                      ),
                    ),
                    SizedBox(width: 10),

                    Icon(CupertinoIcons.calendar_today, color: Colors.red,size: MediaQuery.of(context).size.width/18,),

                  ],
                ),
                SizedBox(width: 5,),

                Row(
                  children: [
                    Text(
                      time,
                      style:  GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width/35,
                        fontWeight: FontWeight
                            .bold, // Adjust the size as needed

                      ),
                    ),
                    SizedBox(width: 10),

                    Image.asset("assets/images/time.png",width: MediaQuery.of(context).size.width/20,height: 22,)

                  ],
                ),









              ],
            ),
          ],
        ),
      ),
    );
  }
}
