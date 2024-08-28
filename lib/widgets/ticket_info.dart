import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../generated/l10n.dart';

class TicketInfo extends StatelessWidget {
  // Input values for dynamic content
  final String city;
  final String busType;
  final int numberOfTickets;
  final int points;
  final String date;
  final String time;

  // Constructor to accept input values
  TicketInfo({
    required this.city,
    required this.busType,
    required this.numberOfTickets,
    required this.points,
    required this.date,
    required this.time,
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,

          children: [
            // City section
          Text(
          city,
          style: GoogleFonts.cairo(
            color: Colors.grey,
            fontSize: MediaQuery.of(context).size.width/32,
            fontWeight: FontWeight
                .bold, // Adjust the size as needed

          ),
        ),
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,

              children: [
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
                SizedBox(height: 10,),
                Row(
                  children: [
                    Text(
                      '$points ${S.of(context).point}',
                      style:  GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width/32,
                        fontWeight: FontWeight
                            .bold, // Adjust the size as needed

                      ),
                    ),
                    SizedBox(width: 10),
                    Image.asset("assets/images/coin_icon.png",width: MediaQuery.of(context).size.width/18,height: 30,),

                  ],
                ),
              ],
            ),
            SizedBox(width: 5,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
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
                SizedBox(height: 10,),

                Row(
                  children: [
                    Text(
                      time,
                      style:  GoogleFonts.cairo(
                        color: Colors.grey,
                        fontSize: MediaQuery.of(context).size.width/32,
                        fontWeight: FontWeight
                            .bold, // Adjust the size as needed

                      ),
                    ),
                    SizedBox(width: 10),

                    Image.asset("assets/images/time.png",width: MediaQuery.of(context).size.width/18,height: 22,)

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
