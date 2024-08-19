import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../consts/consts.dart';

class SeatWidget extends StatefulWidget {
  final int seatNumber;
  bool isSelected;
  bool mySelect = false;

  SeatWidget({
    required this.seatNumber,
    required this.isSelected,
  });

  @override
  State<SeatWidget> createState() => _SeatWidgetState();
}

class _SeatWidgetState extends State<SeatWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          widget.mySelect = !widget.mySelect;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(5.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              widget.isSelected
                  ? notFreeChair
                  : widget.mySelect
                  ? selectedChair
                  : freeChair,
              width: 40,
              height: 40,
            ),
            Text(
              "${widget.seatNumber}",
              textAlign: TextAlign.center,
              style: GoogleFonts.cairo(
                fontSize: 13.sp,
                fontWeight: FontWeight.bold,
                color: Colors.black,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
