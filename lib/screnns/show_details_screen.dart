import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/screnns/book_screen.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import '../models/details_model.dart';

class ShowDetailsScreen extends StatelessWidget {
   ShowDetailsScreen({required this.data,required this.pageTitle});
  List<DetailsModel> data;
  String pageTitle;
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
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Image.asset(
          Localizations.localeOf(context).languageCode=="ar"?"assets/images/superjet_logo.png":"assets/images/logo_english.png",
          width: 90,
          height: 90,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 13,right: 13,top: 20),
              child: Text(
                pageTitle,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 20),
                  separatorBuilder: (context, index) => SizedBox(height: 20,),
                  itemCount: data.length,
                  itemBuilder: (context, index) => Container(
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
                  child: IntrinsicHeight(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment
                          .stretch, // Ensure both children take full height
                      children: [
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                GestureDetector(
                                  onTap: (){

                                  },
                                  child: Icon(
                                    Icons.favorite_border,
                                    color: thirdTripColor,
                                  ),
                                ),
                                Text(
                                  data[index].city,
                                  style: GoogleFonts.cairo(
                                      fontSize:
                                      12.sp, // Adjust the size as needed
                                      height: 1.5,
                                      fontWeight: FontWeight
                                          .bold // Line height for better readability
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Flexible(
                                  child: Text(
                                    data[index].disc,
                                    style: GoogleFonts.cairo(
                                      fontSize: 8.sp, // Adjust the size as needed
                                      height:
                                      1.5, // Line height for better readability
                                    ),
                                  ),
                                ),
                                SizedBox(height: 5,),
                                Center(
                                  child: SizedBox(
                                    height: 30,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: thirdTripColor,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                BorderRadius.circular(10))),
                                        onPressed: () {
                                          Navigator.push(context, MaterialPageRoute(builder: (context) => BookScreen(fromCategoryTo: data[index].city,),));
                                        },
                                        child: Text(
                                          S.of(context).book_now,
                                          style: GoogleFonts.cairo(
                                            color: Colors.white,
                                            fontSize: 8.sp,
                                            fontWeight: FontWeight
                                                .bold, // Adjust the size as needed

                                          ),
                                        )),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Localizations.localeOf(context).languageCode=="ar"?Radius.circular(7):Radius.circular(0),
                              bottomLeft: Localizations.localeOf(context).languageCode=="ar"?Radius.circular(7):Radius.circular(0),
                              topRight: Localizations.localeOf(context).languageCode=="ar"?Radius.circular(0):Radius.circular(7),
                              bottomRight: Localizations.localeOf(context).languageCode=="ar"?Radius.circular(0):Radius.circular(7)

                            ), // Match container's border radius
                            child: Image.asset(
                              data[index].image,
                              fit: BoxFit
                                  .cover, // Fill to match the column's height
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
