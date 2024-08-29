import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:superjet/colors/style_color.dart';
import '../generated/l10n.dart';
import 'auth/login_screen.dart';
import 'edit_account_info.dart';

class AccountScreen extends StatelessWidget {
  AccountScreen({required this.changeLanguage,super.key});
  final Function(Locale) changeLanguage;
  final bool isLogin=false;

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
        title: Image.asset(
          Localizations.localeOf(context).languageCode=="ar"?"assets/images/superjet_logo.png":"assets/images/logo_english.png",
          width: 90,
          height: 90,
        ),
        centerTitle: true,
      ),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(top: 20.0),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  isLogin?Stack(
                    children: [
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 30.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                             children: [
                               Container(
                                 decoration: BoxDecoration(
                                   color: Color(0xffcf9a2b),
                                   borderRadius: BorderRadius.circular(100),

                                 ),
                                 child: Padding(
                                   padding: const EdgeInsets.all(20.0),
                                   child: Image.asset('assets/images/profile_icon.png',width: 40,height: 40,),
                                 ),
                               ),
                               SizedBox(width: 20,),
                               Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Text(
                                     "الاسم",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.cairo(
                                         fontSize: 17.sp,
                                         fontWeight: FontWeight.bold,
                                         color: Colors.black
                                     ),
                                   ),Text(
                                     "test@test.com",
                                     textAlign: TextAlign.center,
                                     style: GoogleFonts.cairo(
                                         fontSize: 14.sp,
                                         fontWeight: FontWeight.w500,
                                         color: Colors.grey
                                     ),
                                   ),
                                 ],
                               )
                             ],
                            ),
                          ),
                          SizedBox(height: 30,),
                          Divider(
                            color: Colors.grey,
                          ),
                        ],
                      ),
                      Positioned(
                          bottom: 40,
                          left: Localizations.localeOf(context).languageCode == 'en'?17*4.4:null,
                          right: Localizations.localeOf(context).languageCode == 'ar'?17:null,
                          child:IconButton(
                            onPressed: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context) => EditAccountInfo(
                                name: "Name",
                                email: "test@test.com",
                              ),));
                            },
                            icon:  Image.asset("assets/images/edit_profile.png",width: 25,height: 25,)),
                          )
                    ],
                  )
                      :GestureDetector(
                    onTap: (){
                      Navigator.push(context,MaterialPageRoute(builder: (context) => LoginScreen(),) );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 50.0),
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xffcf9a2b),
                          borderRadius: BorderRadius.circular(25),
                        ),

                        child:Padding(
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
                                    color: Colors.white
                                  ),
                                ),

                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                  child: Icon(Icons.lock,color: Colors.white,size: 28,),
                                ),

                              ],
                            ),
                          ),
                        ),

                      ),
                    ),
                  ),
                  SizedBox(height: isLogin?20:50.h,),
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
                        isLogin?Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            S.of(context).logout,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.cairo(
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: headTitleColor
                            ),
                          ),
                        ):Container(),
                        SizedBox(height: 15,),

                        GestureDetector(
                          onTap: ()async{
                            Locale newLocale = Localizations.localeOf(context).languageCode == 'ar'
                                ? Locale('en')
                                : Locale('ar');
                            await changeLanguage(newLocale);
                            print(Localizations.localeOf(context).languageCode);
                            final SharedPreferences prefs = await SharedPreferences.getInstance();
                            await prefs.setString('locale',Localizations.localeOf(context).languageCode=="ar"?"en":"ar" );


                          },
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.r),
                              color: headTitleColor,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(13.0),
                              child: Text(
                                Localizations.localeOf(context).languageCode=="ar"?"English":"اللغة العربية",
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
TextStyle? aboutTextStyle()
{
  return GoogleFonts.cairo(
      fontSize: 14.sp,
      fontWeight: FontWeight.bold,
      color: Colors.black
  );
}
