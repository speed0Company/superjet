import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:superjet/screnns/show_details_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import 'account_screen.dart';
import 'home_screen.dart';
import 'my_trips_screen.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.changeLanguage, super.key});
  final Function(Locale) changeLanguage;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  Widget _currentScreen = HomeWidgetScreen(); // Default screen is HomeWidgetScreen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),
      floatingActionButton: GestureDetector(
        onTap: ()async {
          String contact = "+201220840565";
          String text = '';
          String androidUrl = "https://api.whatsapp.com/send/?phone=${contact}&text=${text}";
          String iosUrl = "https://api.whatsapp.com/send/?phone=${contact}&text=${text}";
          String webUrl = 'https://api.whatsapp.com/send/?phone=${contact}&text=${text}';

          try {
            if (Platform.isIOS) {
              if (await canLaunchUrl(Uri.parse(iosUrl))) {
          await launchUrl(Uri.parse(iosUrl));
          }
          } else {
          if (await canLaunchUrl(Uri.parse(androidUrl))) {
          await launchUrl(Uri.parse(androidUrl));
          }
          }
          } catch(e) {
          print(e.toString());
          await launchUrl(Uri.parse(webUrl), mode: LaunchMode.externalApplication);
          }
        },
        child: Image.asset("assets/images/whatsapp_icon.png", width: 50, height: 50),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
              color: Colors.grey,
              blurRadius: 10,
              spreadRadius: 3.5,
              offset: Offset(0, 7),
            ),
          ],
        ),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (index) {
            setState(() {
              selectedIndex = index;

              // Change the current screen based on selected index
              if (index == 0) {
                _currentScreen = HomeWidgetScreen(); // Home screen
              }else if(index==1)
                {
                  _currentScreen=ShowDetailsScreen(
                    pageTitle:S.of(context).fav,
                  );
                }else if(index==2)
                {
                  _currentScreen=MyTripsScreen();
                }
              else if (index == 3) {
                _currentScreen = AccountScreen(changeLanguage: widget.changeLanguage,); // Account screen
              } else {
                _currentScreen = HomeWidgetScreen(); // Default to home if other screens are not ready
              }
            });
          },
          selectedItemColor: thirdTripColor,
          selectedLabelStyle: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
          unselectedLabelStyle: GoogleFonts.cairo(
            color: Colors.white,
            fontSize: 10.sp,
            fontWeight: FontWeight.bold,
          ),
          items: [
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home mob-23.png", width: 25, height: 25, color: Colors.grey),
              label: S.of(context).home,
              activeIcon: Image.asset("assets/images/home mob-23.png", width: 25, height: 25),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home mob-22.png", width: 25, height: 25, color: Colors.grey),
              label: S.of(context).fav,
              activeIcon: Image.asset("assets/images/home mob-22.png", width: 25, height: 25),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home mob-21.png", width: 25, height: 25, color: Colors.grey),
              label: S.of(context).my_trip,
              activeIcon: Image.asset("assets/images/home mob-21.png", width: 25, height: 25),
            ),
            BottomNavigationBarItem(
              icon: Image.asset("assets/images/home mob-20.png", width: 25, height: 25, color: Colors.grey),
              label: S.of(context).account,
              activeIcon: Image.asset("assets/images/home mob-20.png", width: 25, height: 25),
            ),
          ],
        ),
      ),
      body: _currentScreen, // Display the selected screen
    );
  }
}
