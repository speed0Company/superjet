import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/screnns/error_search.dart';
import 'package:superjet/screnns/trips_screen.dart';
import 'package:superjet/widgets/banner.dart';

import '../generated/l10n.dart';
import '../widgets/bottom_sheet_page.dart';
bool isErrorFrom=false;
bool isErrorTo=false;


class BookScreen extends StatefulWidget {
   BookScreen({ this.fromCategoryTo,super.key});
  String? fromCategoryTo;

  @override
  State<BookScreen> createState() => _BookScreenState();

}
class _BookScreenState extends State<BookScreen> {
  int numberOfSet = 1;
  DateTime? selectedDate;
  String fromCity = S.current.Select_travel_city;
  String toCity = S.current.Select_travel_arrive;
  bool fromCitySelected = false;
  DateTime now = DateTime.now();


  final List<String> cities = [
    "القاهره",
    "الإسكندرية",
    "الجيزة",
    "أسوان",
    "الأقصر",
     "الزقازيق",
  ];

  void bottomSheet(bool isFrom) {
    showModalBottomSheet(
      context: context,
      builder: (context) => BottomSheetPage(
        isFrom: isFrom,
        onCitySelected: (city) {
          setState(() {
            if (isFrom) {
              fromCity = city;
              fromCitySelected = true;
              // toCity = S.current.Select_travel_arrive; // Reset the toCity selection
            } else {
              toCity = city;
            }
          });
        },
        cities: cities,
        selectedCity: fromCity,
      ),
    );
  }

  void pickDate() {

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        actions: [
          GestureDetector(
            onTap: () {
              setState(() {

              });
              Navigator.pop(context);
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
                    S.of(context).done,
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
        content: SizedBox(
          width: MediaQuery.of(context).size.width / 1.5,
          height: 200,
          child: CupertinoDatePicker(
            mode: CupertinoDatePickerMode.date,
            initialDateTime: selectedDate,
            minimumDate: DateTime(now.year, now.month, now.day+1),
            onDateTimeChanged: (DateTime newDateTime) {

                selectedDate = DateTime(newDateTime.year,newDateTime.month,newDateTime.day);

            },
          ),
        ),
      ),
    );
  }

@override
  void initState() {
    super.initState();
    selectedDate=DateTime(now.year, now.month, now.day+1);

  }
  void updateLocalizedStrings() {
    fromCity = S.of(context).Select_travel_city;
    toCity = widget.fromCategoryTo??S.of(context).Select_travel_arrive;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    updateLocalizedStrings();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [

          SliverPersistentHeader(

            pinned: true,
            delegate: MySliverAppBar(
              expandedHeight: 200.h,
              collapsedHeight: 150.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    S.of(context).head_title,
                    style: GoogleFonts.cairo(
                      color: headTitleColor,
                      fontSize: 26.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    S.of(context).from,
                    style: GoogleFonts.cairo(
                      color: SecondTitleColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      bottomSheet(true);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Text(
                            fromCity,
                            style: GoogleFonts.cairo(
                              color: fromCity != S.of(context).Select_travel_city ? Colors.black : Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  isErrorFrom?Text(
                    S.of(context).Select_travel_city,
                    style: GoogleFonts.cairo(
                      color: headTitleColor,
                      fontSize: 15.sp,
                    ),
                  ):Container(),

                  SizedBox(height: 20.h),
                  Text(
                    S.of(context).to,
                    style: GoogleFonts.cairo(
                      color: SecondTitleColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: fromCitySelected
                        ? () {
                      bottomSheet(false);
                    }
                        : null,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Text(
                            toCity,
                            style: GoogleFonts.cairo(
                              color: toCity != S.of(context).Select_travel_arrive ? Colors.black : Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.location_on_outlined,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  isErrorTo?Text(
                    S.of(context).Select_travel_arrive,
                    style: GoogleFonts.cairo(
                      color: headTitleColor,
                      fontSize: 15.sp,
                    ),
                  ):Container(),
                  SizedBox(height: 20.h),
                  Text(
                    S.of(context).number_of_set_title,
                    style: GoogleFonts.cairo(
                      color: SecondTitleColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                if(numberOfSet<500)
                                numberOfSet++;
                              });
                            },
                            child: Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: headTitleColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Text(
                            "$numberOfSet",
                            style: GoogleFonts.cairo(
                              color: SecondTitleColor,
                              fontSize: 18.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              if (numberOfSet > 1) {
                                setState(() {
                                  numberOfSet--;
                                });
                              }
                            },
                            child: Container(
                              height: 25.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.r),
                                color: headTitleColor,
                              ),
                              child: Center(
                                child: Icon(
                                  Icons.remove,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Text(
                    S.of(context).travel_date,
                    style: GoogleFonts.cairo(
                      color: SecondTitleColor,
                      fontSize: 15.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: pickDate,
                    child: Container(
                      margin: const EdgeInsets.all(5.0),
                      padding: const EdgeInsets.all(15.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                      ),
                      child: Row(
                        children: [
                          Text(
                            selectedDate != null
                                ? "${selectedDate!.year}/${selectedDate!.month}/${selectedDate!.day}"
                                : S.of(context).select_date,
                            style: GoogleFonts.cairo(
                              color: selectedDate != null ? Colors.black : Colors.grey,
                              fontSize: 15.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.calendar_month,
                            color: Colors.grey,
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 30.h),
                  GestureDetector(
                    onTap: () {
                      if( fromCity!=S.of(context).Select_travel_city&&toCity!=S.of(context).Select_travel_arrive)
                      {
                        isErrorFrom=false;
                        isErrorTo=false;
                        setState(() {

                        });

                        Navigator.push(context, MaterialPageRoute(builder: (context) => TripsScreen(
                          fromCity: fromCity,
                          toCity: toCity,
                        ),));

                        // Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorSearch(),));
                      }
                      else{
                        isErrorFrom=false;
                        isErrorTo=false;
                        if(fromCity==S.of(context).Select_travel_city)
                          {
                            isErrorFrom=true;
                          }

                        if(toCity==S.of(context).Select_travel_arrive)
                        {
                        isErrorTo=true;
                        }
                        setState(() {

                        });
                      }
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5.r),
                        color: headTitleColor,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: Center(
                          child: Text(
                            S.of(context).show_trip,
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
        ],
      ),
    );
  }
}
