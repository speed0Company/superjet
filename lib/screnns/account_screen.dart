import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superjet/colors/style_color.dart';
import '../generated/l10n.dart';
import 'auth/login_screen.dart';
import 'edit_account_info.dart';

class AccountScreen extends StatefulWidget {
  AccountScreen({required this.changeLanguage, super.key});
  final Function(Locale) changeLanguage;

  @override
  State<AccountScreen> createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  bool? isLogin;
  bool isLoading = true; // Add a loading state
  Map<String,dynamic>? userData;

  void checkLoginStatus() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    String? userString = prefs.getString('user');
    print(userString);
    if (userString != null) {
      userData  = jsonDecode(userString);
      // Now you can use the user object as needed
    }

    // Set isLogin based on whether the token is null
    isLogin = token != null;

    // Update loading state
    setState(() {
      isLoading = false; // Set loading to false once the check is done
    });
  }

  @override
  void initState() {
    super.initState();
    checkLoginStatus(); // Call the checkLoginStatus method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(55),
        child: Container(
          decoration:  BoxDecoration(
            color: Colors.white, // Background color of the AppBar
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.25), // Shadow color
                offset: Offset(0, 4), // X and Y offset of the shadow
                blurRadius: 10, // Blur radius for the shadow
              ),
            ],
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: AppBar(
            notificationPredicate: (_) => false,

            surfaceTintColor: Colors.transparent,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight:  Radius.circular(20))
            ),
            backgroundColor: Colors.white,
            shadowColor: Colors.black,
            // elevation: 4,
            title: Image.asset(
              Localizations.localeOf(context).languageCode=="ar"?"assets/images/superjet_logo.png":"assets/images/logo_english.png",
              width: 90,
              height: 90,
            ),
            centerTitle: true,
          ),
        ),
      ),
      body: SafeArea(
        child: isLoading // Check if loading is true
            ? Center(child: CircularProgressIndicator()) // Show loading indicator
            : SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLogin == true
                      ? Column(
                        children: [
                          Padding(
                            padding:
                            const EdgeInsets.symmetric(
                                horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment:
                              MainAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Color(0xffcf9a2b),
                                    borderRadius:
                                    BorderRadius.circular(100),
                                  ),
                                  child: Padding(
                                    padding:
                                    const EdgeInsets.all(20.0),
                                    child: Image.asset(
                                        'assets/images/profile_icon.png',
                                        width: 40,
                                        height: 40),
                                  ),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      userData?['user']['name'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                          fontSize: 17.sp,
                                          fontWeight:
                                          FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      userData?['user']['email'],
                                      textAlign: TextAlign.center,
                                      style: GoogleFonts.cairo(
                                          fontSize: 14.sp,
                                          fontWeight:
                                          FontWeight.w500,
                                          color: Colors.grey),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          Divider(color: Colors.grey),
                        ],
                      )
                      : GestureDetector(
                    onTap: ()async {
                      userData= await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginScreen(),
                        ),
                      );
                      if (userData !=null)
                        {
                          isLogin=true;
                        }

                     setState(() {

                     });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffcf9a2b),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Center(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  S.of(context).login_account,
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.cairo(
                                      fontSize: 15.sp,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                                Padding(
                                  padding:
                                  const EdgeInsets.symmetric(
                                      horizontal: 8.0),
                                  child: Icon(
                                    Icons.lock,
                                    color: Colors.white,
                                    size: 28,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: isLogin == true ? 20 : 50.h),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).about_us,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).private_trips,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).Cities_Stations,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).contact_us,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).privacy_policy,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).terms_conditions,
                            textAlign: TextAlign.center,
                            style: aboutTextStyle(),
                          ),
                        ),
                        if (isLogin == true)
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: GestureDetector(
                              onTap: () async {
                                // Clear the token from SharedPreferences
                                SharedPreferences prefs = await SharedPreferences.getInstance();
                                await prefs.remove('token');

                                // Update isLogin to false and refresh the UI
                                setState(() {
                                  isLogin = false; // Set isLogin to false
                                });
                              },
                              child: Text(
                                S.of(context).logout,
                                textAlign: TextAlign.center,
                                style: GoogleFonts.cairo(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.bold,
                                    color: headTitleColor),
                              ),
                            ),
                          ),
                        SizedBox(height: 15),
                        GestureDetector(
                          onTap: () async {
                            Locale newLocale =
                            Localizations.localeOf(context)
                                .languageCode ==
                                'ar'
                                ? Locale('en')
                                : Locale('ar');
                            await widget.changeLanguage(newLocale);
                            print(Localizations.localeOf(context)
                                .languageCode);
                            final SharedPreferences prefs =
                            await SharedPreferences.getInstance();
                            await prefs.setString(
                                'locale',
                                Localizations.localeOf(context)
                                    .languageCode ==
                                    "ar"
                                    ? "en"
                                    : "ar");
                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: headTitleColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                Localizations.localeOf(context)
                                    .languageCode ==
                                    "ar"
                                    ? "English"
                                    : "اللغة العربية",
                                style: GoogleFonts.cairo(
                                  color: Colors.white,
                                  fontSize: 11.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

TextStyle? aboutTextStyle() {
  return GoogleFonts.cairo(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black);
}