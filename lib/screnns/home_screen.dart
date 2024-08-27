import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/screnns/show_details_screen.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import '../models/details_model.dart';
import '../widgets/home_banner.dart';

class HomeWidgetScreen extends StatelessWidget {
  const HomeWidgetScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        HomeBanner(),
        Expanded(
          child: SingleChildScrollView(
            padding: EdgeInsets.only(bottom: 70),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                flex: 1,
                                child: Image.asset(
                                  width: 70.w,
                                  height: 70.h,
                                  Localizations.localeOf(context)
                                      .languageCode ==
                                      "ar" ?"assets/images/flyer_ar.png":"assets/images/flyer_en.png",
                                  fit: BoxFit.cover,


                                ),
                              ),
                              SizedBox(
                                  width: 10.w), // Space between text and image
                              Expanded(
                                flex: 2,
                                child: Text(
                                  S.of(context).flyer_txt,
                                  style: GoogleFonts.cairo(
                                    fontSize: 9.sp, // Adjust the size as needed
                                    height:
                                        1.5, // Line height for better readability
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 10,
                    crossAxisSpacing: 30,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 2,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowDetailsScreen(
                                  pageTitle: S.of(context).bahary_citys,
                                  data: [
                                    DetailsModel(
                                      image: "assets/images/alex.png",
                                      city: S.of(context).alex_city,
                                      disc: S.of(context).alex_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/matroh.png",
                                      city: S.of(context).matroh_city,
                                      disc: S.of(context).matroh_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/sahal.png",
                                      city: S.of(context).sahal_city,
                                      disc: S.of(context).sahal_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/alamin.png",
                                      city: S.of(context).alamin_city,
                                      disc: S.of(context).alamin_disc,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/bahary_banner.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    S.of(context).bahary_citys,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowDetailsScreen(
                                  pageTitle: S.of(context).qana_citys,
                                  data: [
                                    DetailsModel(
                                      image: "assets/images/borsaid.png",
                                      city: S.of(context).borsaid_city,
                                      disc: S.of(context).borsaid_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/suze.png",
                                      city: S.of(context).suez_city,
                                      disc: S.of(context).suez_disc,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/qana_img.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    S.of(context).qana_citys,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowDetailsScreen(
                                  pageTitle: S.of(context).eqbli_citys,
                                  data: [
                                    DetailsModel(
                                      image: "assets/images/qana.png",
                                      city: S.of(context).qena_city,
                                      disc: S.of(context).qena_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/luxur.png",
                                      city: S.of(context).luxor_city,
                                      disc: S.of(context).luxor_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/almnia.png",
                                      city: S.of(context).minya_city,
                                      disc: S.of(context).minya_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/sohag.png",
                                      city: S.of(context).sohag_city,
                                      disc: S.of(context).sohag_disc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/asut.png",
                                      city: S.of(context).asiut_city,
                                      disc: S.of(context).asiut_disc,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/eqbli_img.png",
                                  fit: BoxFit.fill,
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    S.of(context).eqbli_citys,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 12,
                                      fontWeight: FontWeight.bold,
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
                  SizedBox(
                    height: 10,
                  ),
                  StaggeredGrid.count(
                    crossAxisCount: 4,
                    mainAxisSpacing: 2,
                    crossAxisSpacing: 30,
                    children: [
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: Stack(
                          fit: StackFit.expand,
                          children: [
                            Container(
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(5),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.grey.withOpacity(0.5),
                                      spreadRadius: 2,
                                      blurRadius: 5,
                                      offset: Offset(0, 3), // Shadow position
                                    ),
                                  ],
                                ),
                                child: Image.asset(
                                  "assets/images/discover_img.png",
                                  fit: BoxFit.fill,
                                )),
                            Align(
                                alignment: Alignment.bottomRight,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(
                                    S.of(context).discovey_egypt,
                                    style: GoogleFonts.cairo(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )),
                          ],
                        ),
                      ),
                      StaggeredGridTile.count(
                        crossAxisCellCount: 2,
                        mainAxisCellCount: 1,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ShowDetailsScreen(
                                  pageTitle: S.of(context).bahary_citys,
                                  data: [
                                    DetailsModel(
                                      image: "assets/images/jurdan.png",
                                      city: S.of(context).jordan_country,
                                      disc: S.of(context).jourdan_desc,
                                    ),
                                    DetailsModel(
                                      image: "assets/images/lypia_img.png",
                                      city: S.of(context).libya_country,
                                      disc: S.of(context).lipya_desc,
                                    ),

                                  ],
                                ),
                              ),
                            );

                          },
                          child: Stack(
                            fit: StackFit.expand,
                            children: [
                              Container(
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(0, 3), // Shadow position
                                      ),
                                    ],
                                  ),
                                  child: Image.asset(
                                    "assets/images/dawaly_img.png",
                                    fit: BoxFit.fill,
                                  )),
                              Align(
                                  alignment: Alignment.bottomRight,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text(
                                      S.of(context).international,
                                      style: GoogleFonts.cairo(
                                        color: Colors.white,
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: 150,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => ShowDetailsScreen(
                              pageTitle: S.of(context).syahia,
                              data: [
                                DetailsModel(
                                  image: "assets/images/sharm.png",
                                  city: S.of(context).sharm_city,
                                  disc: S.of(context).sharm_desc,
                                ),
                                DetailsModel(
                                  image: "assets/images/nwabea.png",
                                  city: S.of(context).nwabea_city,
                                  disc: S.of(context).nwabea_desc,
                                ),
                                DetailsModel(
                                  image: "assets/images/gardga.png",
                                  city: S.of(context).gardga_city,
                                  disc: S.of(context).gardga_desc,
                                ),
                                DetailsModel(
                                  image: "assets/images/safaga.png",
                                  city: S.of(context).safaga_city,
                                  disc: S.of(context).safaga_desc,
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.5),
                                  spreadRadius: 2,
                                  blurRadius: 5,
                                  offset: Offset(0, 3),
                                ),
                              ],
                            ),
                            child: Image.asset(
                              "assets/images/sayhya_img.png",
                              fit: BoxFit.fill,
                            ),
                          ),
                          Align(
                            alignment: Alignment.bottomRight,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                S.of(context).syahia,
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
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
                                  Text(
                                    S.of(context).why_chosse_us,
                                    style: GoogleFonts.cairo(
                                      fontSize:
                                          12.sp, // Adjust the size as needed
                                      fontWeight: FontWeight.bold,
                                      color: headTitleColor,
                                      height:
                                          1.5, // Line height for better readability
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Flexible(
                                    child: Text(
                                      S.of(context).flyer_txt,
                                      style: GoogleFonts.cairo(
                                        fontSize:
                                            8.sp, // Adjust the size as needed
                                        height:
                                            1.5, // Line height for better readability
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 2,
                            child: ClipRRect(
                              borderRadius: BorderRadius.only(
                                  topLeft: Localizations.localeOf(context)
                                              .languageCode ==
                                          "ar"
                                      ? Radius.circular(7)
                                      : Radius.circular(0),
                                  bottomLeft: Localizations.localeOf(context)
                                              .languageCode ==
                                          "ar"
                                      ? Radius.circular(7)
                                      : Radius.circular(0),
                                  topRight: Localizations.localeOf(context)
                                              .languageCode ==
                                          "ar"
                                      ? Radius.circular(0)
                                      : Radius.circular(7),
                                  bottomRight: Localizations.localeOf(context)
                                              .languageCode ==
                                          "ar"
                                      ? Radius.circular(0)
                                      : Radius.circular(
                                          7)), // Match container's border radius
                              child: Image.asset(
                                "assets/images/why_super_jet.png",
                                fit: BoxFit
                                    .cover, // Fill to match the column's height
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Text(
                    S.of(context).super_jet_categories,
                    style: GoogleFonts.cairo(
                      fontSize: 17.sp, // Adjust the size as needed
                      fontWeight: FontWeight.bold,
                      color: headTitleColor,
                      height: 1.5, // Line height for better readability
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
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
                          child: Image.asset(
                            "assets/images/econmy_img.png",
                            width: MediaQuery.of(context).size.width / 3.5,
                          )),
                      Container(
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
                          child: Image.asset("assets/images/Majestic_img.png",
                              width: MediaQuery.of(context).size.width / 3.5)),
                      Container(
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
                          child: Image.asset("assets/images/vip_img.png",
                              width: MediaQuery.of(context).size.width / 3.5)),
                    ],
                  )
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}
