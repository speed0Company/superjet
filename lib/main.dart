import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:splashify/splashify.dart';
import 'package:superjet/colors/style_color.dart';
import 'package:superjet/screnns/book_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:superjet/screnns/home_container.dart';

import 'generated/l10n.dart';

void main()async {

  WidgetsFlutterBinding.ensureInitialized();
  final prefs = await SharedPreferences.getInstance();
  final localeCode = prefs.getString('locale') ?? 'ar';
  runApp(MyApp(initialLocale: Locale(localeCode),));
}

class MyApp extends StatefulWidget {
   MyApp({super.key,required this.initialLocale});
  final Locale initialLocale;


  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
 late  Locale _locale;

  void _changeLanguage(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }
  @override
  void initState() {
    _locale=widget.initialLocale;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, child) => MaterialApp(
        locale: _locale,
        localizationsDelegates: [
          S.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        theme: ThemeData(
          colorScheme:ColorScheme.light(primary: Colors.white)
        ),
        supportedLocales: S.delegate.supportedLocales,
        debugShowCheckedModeBanner: false,
        home: Splashify(
          imagePath:_locale.languageCode=="ar"?'assets/images/superjet_logo.png':"assets/images/logo_english.png",
          imageFadeIn: true,
          // colorBlendAnimation: headTitleColor,
          navigateDuration: 5,
          imageSize: MediaQuery.of(context).size.height/4,
          titleColor: headTitleColor,
          colorizeTileAnimationColors: [
            headTitleColor,
            Color(0xffCF9A2C),
          ],
          titleBold: true,
          child: HomeScreen(
            changeLanguage:_changeLanguage,
          ),
        ),
      ),
    );
  }
}

