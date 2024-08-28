import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/screnns/trips_screen.dart';
import '../generated/l10n.dart';
import '../widgets/bottom_sheet_page.dart';
import '../widgets/custme_drop_down.dart';
import '../widgets/mini_jet_banner.dart';
bool isErrorFrom=false;
bool isErrorTo=false;


class MiniJetScreen extends StatefulWidget {
  const MiniJetScreen({super.key});



  @override
  State<MiniJetScreen> createState() => _MiniJetScreenState();

}
class _MiniJetScreenState extends State<MiniJetScreen> {
  int numberOfSet = 1;
  DateTime? selectedDate;
  String fromCity = S.current.Select_travel_city;
  String toCity = S.current.Select_travel_arrive;
  bool fromCitySelected = false;
  DateTime now = DateTime.now();
  TextEditingController nameCon=TextEditingController();
  TextEditingController numberCon=TextEditingController();
  final _formKey = GlobalKey<FormState>();


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
              toCity = S.current.Select_travel_arrive; // Reset the toCity selection
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
    toCity = S.of(context).Select_travel_arrive;
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

            delegate: MiniJetAppBar(
                expandedHeight: 200.h,
                collapsedHeight: 150.h,
            ),
          ),
          SliverToBoxAdapter(
            child: Form(
              key: _formKey,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30,vertical: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      S.of(context).mini_jet_title,
                      style: GoogleFonts.cairo(
                        color: headTitleColor,
                        fontSize: 26.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 10 ),
                      child: TextFormField(
                        cursorColor: headTitleColor,

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).error_form_filed_name;
                          }
                          return null;  // Return null if input is valid
                        },
                        controller: nameCon,
                        decoration: InputDecoration(

                          hintText: S.of(context).user_name,
                          hintStyle: GoogleFonts.cairo(
                            color:  Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, // Adjust the color to match the image
                              width: 1.0, // Adjust the width to match the image
                            ),

                            borderRadius: BorderRadius.zero
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey, // Adjust the color to match the image
                                width: 1.0, // Adjust the width to match the image
                              ),

                              borderRadius: BorderRadius.zero
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: headTitleColor, // Adjust the color to match the image
                                width: 1.0, // Adjust the width to match the image
                              ),

                              borderRadius: BorderRadius.zero
                          ),

                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 15 ),
                      child: TextFormField(
                        cursorColor: headTitleColor,
                        controller: numberCon,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return S.of(context).error_form_filed_phone_number;
                          }
                          return null;  // Return null if input is valid
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(


                          hintText: S.of(context).phone_number,
                          hintStyle: GoogleFonts.cairo(
                            color: Colors.grey,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          contentPadding: EdgeInsets.symmetric(vertical: 15.0, horizontal: 12.0),
                          border: OutlineInputBorder(
                            borderSide: BorderSide(
                              color: Colors.grey, // Adjust the color to match the image
                              width: 1.0, // Adjust the width to match the image
                            ),

                            borderRadius: BorderRadius.zero
                          ),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.grey, // Adjust the color to match the image
                                width: 1.0, // Adjust the width to match the image
                              ),

                              borderRadius: BorderRadius.zero
                          ),
                          focusedBorder:OutlineInputBorder(
                              borderSide: BorderSide(
                                color: headTitleColor, // Adjust the color to match the image
                                width: 1.0, // Adjust the width to match the image
                              ),

                              borderRadius: BorderRadius.zero
                          ),

                        ),
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
                    Text(
                      S.of(context).chose_car,
                      style: GoogleFonts.cairo(
                        color: SecondTitleColor,
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal:5.0,vertical: 15 ),
                      child: DropdownExample(),
                    ),
                    SizedBox(height: 20.h),
                    GestureDetector(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (fromCity != S
                              .of(context)
                              .Select_travel_city && toCity != S
                              .of(context)
                              .Select_travel_arrive) {
                            isErrorFrom = false;
                            isErrorTo = false;
                            setState(() {

                            });

                            Navigator.push(
                                context, MaterialPageRoute(builder: (context) =>
                                TripsScreen(
                                  fromCity: fromCity,
                                  toCity: toCity,
                                ),));

                            // Navigator.push(context, MaterialPageRoute(builder: (context) => ErrorSearch(),));
                          }
                          else {
                            isErrorFrom = false;
                            isErrorTo = false;
                            if (fromCity == S
                                .of(context)
                                .Select_travel_city) {
                              isErrorFrom = true;
                            }

                            if (toCity == S
                                .of(context)
                                .Select_travel_arrive) {
                              isErrorTo = true;
                            }
                            setState(() {

                            });
                          }
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
                              S.of(context).search_for_private_trip,
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
                    SizedBox(height: 10.h),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
