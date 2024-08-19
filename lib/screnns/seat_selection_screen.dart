import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../consts/consts.dart';
import '../generated/l10n.dart';
import '../widgets/build_set_widget.dart';

class SeatSelectionScreen extends StatelessWidget {
   SeatSelectionScreen({super.key});
  int numberOfSeats = 50; // Default number of seats
  bool isDoubleRow = true; // Default to double row
   final List<List> seatLayout = [
     [
       [1,true],
       [2,false],
       [3,false],
       [4,false],

     ],[
       [5,true],
       [6,false],
       [7,true],
       [8,false],
     ],[
       [9,true],
       [10,false],
       [11,false],
       [12,false],
     ],
     [
       [13,true],
       [14,true],
       [15,false],
       [16,true],
     ],

[
       [17,true],
       [18,true],
       [19,false],
       [20,true],
     ],

[
       [21,true],
       [22,true],
       [23,false],
       [24,true],
     ],

[
       [25,true],
       [26,true],
       [27,false],
       [28,true],
     ],

[
       [29,true],
       [30,true],
       [31,false],
       [32,true],
     ],

[
       [33,true],
       [34,false],
       [35,false],
       [36,true],
     ],

[
       [37,true],
       [38,true],
       [39,false],
       [40,true],
     ],[
       [41,true],
       [42,true],
       [43,false],
       [44,true],
     ],[
       [45,true],
       [46,true],
       [47,false],
       [48,true],
       [49,false],
     ],



   ];

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

      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Divider(
              color: Colors.grey,
            ),              Text(
              S.of(context).sets_title,
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 20.sp,
                fontWeight: FontWeight.bold,
                color: headTitleColor
              ),
            ),
            SizedBox(height: 30,),
            Directionality(
            textDirection: TextDirection.rtl,
            child: Expanded(
             child: ListView.builder(
               padding: EdgeInsets.only(bottom: 30.h),
               itemCount: seatLayout.length,
               itemBuilder: (context, rowIndex) {
                 final seats = seatLayout[rowIndex];
                 return SeatRow(
                   seats: seats.map((seat) => SeatWidget(seatNumber: seat[0], isSelected: seat[1])).toList(),

                 );
              },
            ),
          ),
        ),
            Padding(
              padding:  EdgeInsets.only(left: 70.w,right: 70.w,bottom: 15,top: 10),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10.r),
                  color: headTitleColor,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(13.0),
                  child: Center(
                    child: Text(
                      S.of(context).book_now,
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
            Directionality(
              textDirection: TextDirection.ltr,
              child: Padding(
                padding: EdgeInsets.only(left: 20, right: 20, bottom: 20), // Adjusted padding to be more flexible
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Row(
                        children: [
                          Image.asset(selectedChair, width: 30, height: 30), // Removed width and height scaling for simplicity
                          SizedBox(width: 5), // Add space between image and text
                          Flexible(
                            child: Text(
                              S.of(context).selected_seats,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Image.asset(notFreeChair, width: 30, height: 30),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              S.of(context).reserved_seats,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Flexible(
                      child: Row(
                        children: [
                          Image.asset(freeChair, width: 30, height: 30),
                          SizedBox(width: 5),
                          Flexible(
                            child: Text(
                              S.of(context).available_seats,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.cairo(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )




          ],
        ),
      ),
    );
  }

}
class SeatRow extends StatelessWidget {
  final List<SeatWidget> seats;


  SeatRow({required this.seats});

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double paddingValue = screenWidth / 9.5;

    // Define minimum and maximum padding values
    final double minPadding = 16.0;  // Example minimum padding
    final double maxPadding = 100.0;  // Example maximum padding

    // Clamp padding value to ensure it stays within the defined range
    final double adjustedPadding = paddingValue.clamp(minPadding, maxPadding);

    final int seatCount = seats.length;

    if (seatCount == 5) {
      final List<Widget> leftSeats = seats.take(2).toList();
      final List<Widget> rightSeats = seats.skip(3).toList();
      final Widget middleSeat = seats[2];

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: leftSeats,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15.0),
            child: middleSeat,
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: rightSeats,
            ),
          ),
        ],
      );
    } else {
      final List<Widget> leftSeats = seats.take(seatCount ~/ 2).toList();
      final List<Widget> rightSeats = seats.skip(seatCount ~/ 2).toList();

      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: leftSeats,
            ),
          ),
          Padding(
            padding:  EdgeInsets.symmetric(horizontal: adjustedPadding/1.3),
            child: Container(),
          ),
          Flexible(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: rightSeats,
            ),
          ),
        ],
      );
    }
  }
}
