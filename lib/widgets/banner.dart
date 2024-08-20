
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/colors/style_color.dart';

import '../generated/l10n.dart';
import '../screnns/account_screen.dart';
import '../screnns/error_search.dart';
import '../screnns/mini_jet.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;
  final Function(Locale) changeLanguage;
  List<IconData> icons = [
    Icons.directions_car, // Icon for 'to_private_trip'
    Icons.settings,       // Icon for 'to_setting'
  ];


  MySliverAppBar({required this.expandedHeight, required this.collapsedHeight,required this.changeLanguage});

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double size = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);
    final double opacity = 1 - (shrinkOffset / (maxExtent - minExtent));

    return Stack(
      children: [
        Container(
          height: size,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/banner.png'),
              fit: BoxFit.cover,
            ),
            borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(70),
              bottomLeft: Radius.circular(70),
            ),
          ),
        ),
        Align(
            alignment: Alignment.topRight,
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Container(
                    width: 100,
                    height: size/2.3.h,
                    decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(Localizations.localeOf(context).languageCode=="ar"?'assets/images/superjet_logo.png':"assets/images/logo_english.png"),
                      fit: BoxFit.contain
                    )
                    ),
                  ),
                ),
                Spacer(),
                // Padding(
                //   padding: const EdgeInsets.only(top: 30.0,left: 10,right: 10),
                //   child: IconButton(onPressed: (){
                //     Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(
                //       changeLanguage: changeLanguage,
                //     ),));
                //   }, icon: Container(
                //     decoration: BoxDecoration(
                //       color: Colors.white,
                //       borderRadius: BorderRadius.circular(50.r)
                //     ),
                //  child: Icon(Icons.account_circle_rounded,color: Color(0xffCF9A2C),size: 35,))),
                // ),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0, left: 10, right: 10),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(7.r),
                    ),
                    child: PopupMenuButton<String>(
                      icon: Icon(Icons.menu, color: typeTripColor),
                      onSelected: (value) {
                        // Handle selection
                        print(value);
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r), // Customize the border radius here
                      ),
                      itemBuilder: (BuildContext context) {
                        return <String>[S.of(context).to_private_trip, S.of(context).to_setting]
                            .asMap()
                            .entries
                            .map((entry) {
                          int index = entry.key;
                          String choice = entry.value;
                          return PopupMenuItem<String>(
                            value: choice,
                            onTap: (){
                              index==1?Navigator.push(context, MaterialPageRoute(builder: (context) => AccountScreen(
                                        changeLanguage: changeLanguage,
                                      ),)):Navigator.push(context, MaterialPageRoute(builder: (context) => MiniJetScreen(),));
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 10.0, horizontal: 5),
                              child: Row(
                                children: [
                                  Text(
                                    choice,
                                    style: GoogleFonts.cairo(
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Spacer(),
                                  Icon(icons[index]), // Use the icon based on the index
                                ],
                              ),
                            ),
                          );
                        }).toList();
                      },
                    ),
                  ),
                )


              ],
            ))
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}