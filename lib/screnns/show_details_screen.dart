import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart'; // Import SharedPreferences

import '../colors/style_color.dart';
import '../generated/l10n.dart';
import '../models/details_model.dart';
import 'book_screen.dart';

class ShowDetailsScreen extends StatefulWidget {
  ShowDetailsScreen({ this.data, required this.pageTitle});
  List<DetailsModel>? data;
  String pageTitle;

  @override
  _ShowDetailsScreenState createState() => _ShowDetailsScreenState();
}

class _ShowDetailsScreenState extends State<ShowDetailsScreen> {
  List<DetailsModel> favorites = [];

  @override
  void initState() {
    super.initState();
    loadFavorites();
  }

  // Save favorite items to SharedPreferences
  Future<void> saveToFavorites(DetailsModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString('favorites');
    List<DetailsModel> favList = savedFavorites != null
        ? (json.decode(savedFavorites) as List)
        .map((item) => DetailsModel.fromJson(item))
        .toList()
        : [];

    if (!favList.any((item) => item.cityAr == model.cityAr)) {
      favList.add(model);
      await prefs.setString('favorites', json.encode(favList.map((e) => e.toJson()).toList()));
    }
  }

  // Remove from favorites
  Future<void> removeFromFavorites(DetailsModel model) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString('favorites');
    if (savedFavorites != null) {
      List<DetailsModel> favList = (json.decode(savedFavorites) as List)
          .map((item) => DetailsModel.fromJson(item))
          .toList();
      favList.removeWhere((item) => item.cityAr == model.cityAr);
      await prefs.setString('favorites', json.encode(favList.map((e) => e.toJson()).toList()));
    }
  }

  // Load favorite items from SharedPreferences
  Future<void> loadFavorites() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? savedFavorites = prefs.getString('favorites');
    if (savedFavorites != null) {
      setState(() {
        favorites = (json.decode(savedFavorites) as List)
            .map((item) => DetailsModel.fromJson(item))
            .toList();
      });
    }
  }

  // Check if an item is in favorites
  bool isFavorite(DetailsModel model) {
    return favorites.any((item) => item.cityAr == model.cityAr);
  }

  @override
  Widget build(BuildContext context) {
    bool isFav = widget.pageTitle == 'Favorites' || widget.pageTitle == "المفضلة";
    List<DetailsModel> displayedData = isFav ? favorites : widget.data!;

    // Get the current locale
    Locale locale = Localizations.localeOf(context);
    bool isArabic = locale.languageCode == 'ar';

    return Scaffold(
      backgroundColor: Color(0xffFCF3E8),
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        backgroundColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 4,
        leading: isFav
            ? null
            : IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(CupertinoIcons.back),
        ),
        title: Image.asset(
          isArabic
              ? "assets/images/superjet_logo.png"
              : "assets/images/logo_english.png",
          width: 90,
          height: 90,
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 13, right: 13, top:  20),
              child: Text(
                widget.pageTitle,
                style: GoogleFonts.cairo(
                  fontSize: 14.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 13.0, vertical: 8),
                child: ListView.separated(
                  padding: EdgeInsets.only(bottom: 20),
                  separatorBuilder: (context, index) => SizedBox(
                    height: 20,
                  ),
                  itemCount: displayedData.length,
                  itemBuilder: (context, index) {
                    DetailsModel model = displayedData[index];
                    bool isFav = isFavorite(model);

                    return Container(
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
                          crossAxisAlignment: CrossAxisAlignment.stretch,
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
                                      onTap: () {
                                        setState(() {
                                          if (isFav) {
                                            removeFromFavorites(model);
                                          } else {
                                            saveToFavorites(model);
                                          }
                                          loadFavorites();
                                        });
                                      },
                                      child: Icon(
                                        isFav
                                            ? Icons.favorite
                                            : Icons.favorite_border,
                                        color: thirdTripColor,
                                      ),
                                    ),
                                    Text(
                                      isArabic ? model.cityAr : model.cityEn,
                                      style: GoogleFonts.cairo(
                                          fontSize: 12.sp,
                                          height: 1.5,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Flexible(
                                      child: Text(
                                        isArabic ? model.discAr : model.discEn,
                                        style: GoogleFonts.cairo(
                                          fontSize: 8.sp,
                                          height: 1.5,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 30,
                                        child: ElevatedButton(
                                          style: ElevatedButton.styleFrom(
                                              backgroundColor: thirdTripColor,
                                              shape: RoundedRectangleBorder(
                                                  borderRadius: BorderRadius.circular(10))),
                                          onPressed: () {
                                            Navigator.push(
                                                context,
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      BookScreen(
                                                        fromCategoryTo: isArabic ? model.cityAr : model.cityEn,
                                                      ),
                                                ));
                                          },
                                          child: Text(
                                            S.of(context).book_now,
                                            style: GoogleFonts.cairo(
                                              color: Colors.white,
                                              fontSize: 8.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
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
                                  topLeft: isArabic
                                      ? Radius.circular(7)
                                      : Radius.circular(0),
                                  bottomLeft: isArabic
                                      ? Radius.circular(7)
                                      : Radius.circular(0),
                                  topRight: isArabic
                                      ? Radius.circular(0)
                                      : Radius.circular(7),
                                  bottomRight: isArabic
                                      ? Radius.circular(0)
                                      : Radius.circular(7),
                                ),
                                child: Image.asset(
                                  model.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
