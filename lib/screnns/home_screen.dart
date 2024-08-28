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
                                      cityAr: 'الإسكندرية',
                                      cityEn: 'Alexandria',
                                      discAr: 'عروس البحر المتوسط وأشهر المدن الساحلية في مصر، تمتلك من المزارات الخلابة ما يجعلها الوجهة المناسبة لقضاء وقت ممتع مثل: عمود السواري، المتحف اليوناني والروماني، حدائق المنتزه، حدائق أنطونيادس، قلعة قايتباي، الكاتدرائية المرقسية، حدائق الشلالات.',
                                      discEn: 'The bride of the Mediterranean and the most famous coastal city in Egypt, it has charming sightseeing that make it the most suitable destination for spending an enjoyable time, such as the Serapeum of Alexandria, the Greco-Roman Museum, Elmontaza Garden, Antoniades Gardens, Qaitbay Citadel, St. Mark\'s Cathedral in Alexandria, and Al Shalalat Park.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/matroh.png",
                                      cityAr: 'مرسى مطروح',
                                      cityEn: 'Marsa Matruh',
                                      discAr: 'تعرف بمدينة الشواطئ الساحرة لجمال المياه والشواطئ المختلفة وتنوع المزارات مثل: حمامات كليوباترا، معبد رمسيس الثاني، كهف ملح سلمان، محمية العُميد كما يمكنك زيارة السيرك الصيفي، والسوق الصيني السوري.',
                                      discEn: 'It’s known as the city of endearing beaches due to the beauty of its water, the variety of beaches, and its sightseeing diversity, such as Cleopatra Bath, Ramesses II Temple, Salt Cave Salman, Omayed. You can also visit the summer circus and the Chinese-Surian market.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/sahal.png",
                                      cityAr: 'الساحل الشمالي',
                                      cityEn: 'North Coast',
                                      discAr: 'يتميز الساحل الشمالي بالمياه الصافية والشواطئ الرملية، بالإضافة للأنشطة المتنوعة مثل: الأكوا بارك، والحفلات الغنائية، وحفلات الشواء، والعديد من الرياضات المائية.',
                                      discEn: 'The North Coast is famous for its clear water and its sandy beaches, in addition to various activities such as aqua parks, singing parties, barbeque parties, and many water sports.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/alamin.png",
                                      cityAr: 'العلمين الجديدة',
                                      cityEn: 'New Alamein',
                                      discAr: 'هي مزيج يجمع بين المتعة والاسترخاء، فهي تطل على البحر المتوسط ويوجد بها العديد من الأماكن التي يمكنك زيارتها مثل: الممشى السياحي، المسرح الروماني، وأبراج العلميين.',
                                      discEn: 'It’s a combination between enjoyment and relaxation, as it overlooks the Mediterranean Sea and has many places that you can visit, such as the tourist walkway, Roman Theater, and Al Alamein Towers.',
                                    ),
                                  ],
                                )
                                ,
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
                                      cityAr: 'بورسعيد',
                                      cityEn: 'Port Said',
                                      discAr: 'بورسعيد (المدينة الباسلة) تتميز بورسعيد بأطعمتها المختلفة متل المدفونة والبكلويز، بالإضافة للعديد من الأماكن المميزة مثل جبل الملح، وكنيسة سانت اوجيني، ومحمية وشاطئ بورفؤاد.',
                                      discEn: "Port Said (the valiant city) is characterized by its variety in food such as El Madfona and El Baklwiz, as well as many distinctive places such as Mount Salt, St Eugenie's Church, Purfod Reserve and Beach.",
                                    ),
                                    DetailsModel(
                                      image: "assets/images/suze.png",
                                      cityAr: 'السويس',
                                      cityEn: 'Suez',
                                      discAr: 'يطلق عليها اسم بلد الغريب وتتميز ببيئتها المختلفة حيث يوجد جبل عتاقة وخليج السويس وعيون موسى بالإضافة للمزارات الدينية مثل دير الأنبا انطونيوس والأنبا بولا.',
                                      discEn: "It's known as Balad Alghareeb - named after a great Soldier- and is characterized by its different environment where there is Mount Ataqa, Gulf of Suez, Ayun Musa, as well as religious ministries such as Monastery of Anba Antonius and Ebba Bula",
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
                                      cityAr: 'قنا',
                                      cityEn: 'Qena',
                                      discAr: 'مدينة السكر، تحتوي على معالم متنوعة وجميلة مثل مسجد سيدي عبد الرحمن ومعبد دندرة وقصر البرنس يوسف كمال.',
                                      discEn: 'Sugar city has a lot of tourist attractions such as Sedei Abdelrahman Mosque, Dandara Temple and Prince Youssef Kamal Palace.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/luxur.png",
                                      cityAr: 'الأقصر',
                                      cityEn: 'Luxor',
                                      discAr: 'مدينة الآثار وجمال الطبيعة، تشتهر بتنوع المناطق مثل مدينة قرنه ومعبد الدير البحري والأنشطة السياحية مثل التحليق بالمنطاد الهوائي في البر الغربي.',
                                      discEn: 'With the adorable nature and great monuments, Luxor became the city of beauty and history. Some of its great places are: Qurna city, Dir Al-Bahari, and some activities like air balloon rides at the West Bank.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/almnia.png",
                                      cityAr: 'المنيا',
                                      cityEn: 'Minya',
                                      discAr: 'يطلق عليها "عروس الصعيد" فقد شهدت على مختلف العصور منها العصر البطلمي، والروماني والعصر القبطي ثم الإسلامي. بالإضافة لشهرتها الأثرية والحضارية والعديد من الأماكن التي يمكنك زيارتها منها المسجد العتيق، وتل العمرانية، وجبل الطير.',
                                      discEn: 'It’s called the bride of Upper Egypt as it has been witnessed for many ages, including the Ptolemaic, Roman, and Coptic eras, then the Islamic era. There are many places to visit, such as the Atiq Mosque, Amarna, and Jabal al Tayr.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/sohag.png",
                                      cityAr: 'سوهاج',
                                      cityEn: 'Suhag',
                                      discAr: 'بلد المواويل، ارتبط اسمها بالفن منذ عصر الفراعنة، تضم العديد من المعالم العريقة مثل معبد سيتي أمون ومقابر الحواويش ومعبد ميريت أمون.',
                                      discEn: 'A well-known city for arts and songs since the ancient Egyptians. Temple of Seti Amun, Hawaweesh tombs, and the temple of Meritt Amun.',
                                    ),
                                    DetailsModel(
                                      image: "assets/images/asut.png",
                                      cityAr: 'أسيوط',
                                      cityEn: 'Asyut',
                                      discAr: 'تتميز أسيوط بأحيائها القديمة وأضرحتها، بالإضافة للمعالم الفرعونية، والقبطية، والإسلامية، والحديثة مثل دير العذراء، ومسجد العوامر، ومحمية وادي الأسيوطي.',
                                      discEn: 'It’s distinguished by its old neighborhoods and shrines in addition to the ancient Egyptian, Coptic, Islamic, and modern landmarks such as the Monastery of the Virgin, Al-Awamer Mosque, and Al-Wady El-Assiuty Reserve.',
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
                                  pageTitle: S.of(context).international,
                                  data: [
                                    DetailsModel(
                                      image: "assets/images/jurdan.png",
                                      cityAr: 'الأردن',
                                      cityEn: 'Jordan',
                                      discAr: 'يوفر سوبر جيت رحلات اللي الأردن، بلد يمزج بين الحضارات الماضي المهيبة والمدينة الصاخبة، أيًا كانت ميولك ستجد ما يناسبك في الأردن بلد المغامرة، والتاريخ، والفن، والطعام المميز.',
                                      discEn: "A country that blends the majestic past civilizations and a bustling city, whatever your tendencies you will find in Jordan is a country of adventure, history, art, and distinctive food.",
                                    ),
                                    DetailsModel(
                                      image: "assets/images/lypia_img.png",
                                      cityAr: 'ليبيا',
                                      cityEn: 'Libya',
                                      discAr: 'مزيج بين الصحاري والخضار يمكنك التمتع بأجواء الطبيعة الساحرة على الجبل الأخضر المليء بالأشجار والمحاصيل الزراعية المختلفة، بالإضافة لطبيعة المناخ المميزة',
                                      discEn: "A smooth combination of deserts and grass. you can enjoy nature`s glamorous atmosphere on the green mountain full of trees and various crops, as well as the distinctive nature of the climate.",
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
                                  cityAr: "شرم الشيخ",
                                  cityEn: "Sharm El-Sheikh",
                                  discAr: " تعتبر وجهة جذب سياحية عالمية لما تحتويه من بيئة طبيعية وسياحية مميزة، وتتميز بالشعاب المرجانية، والأسماك، والأنشطة المختلفة مثل الغوص، والإبحار بالقوارب الشراعية، بالإضافة للأماكن ذات الطبيعة الخلابة مثل محمية رأس محمد، ومحمية نبق.",
                                  discEn: "Considered to be an international tourists hotspot as you can enjoy sightseeing & discover coral reef& different kinds of fish besides activities like diving, boat sailing & stunning nature as Ras Muhamad& Nanq natural Reserves.",
                                ),
                                DetailsModel(
                                  image: "assets/images/nwabea.png",
                                  cityAr: "نويبع",
                                  cityEn: "Nuweiba",
                                  discAr: "من أهم مدن المثلث الذهبي في سيناء، بها أهم المزارات السياحية كواحة عين خضرة وقلعة نويبع والمناطق الجبلية المناسبة للتنزه.",
                                  discEn: "One of the golden triangle cities, in Sinai, and it has the most attractive sightseeings as the green eye oasis, Nuweiba castle and many mountainous areas.",
                                ),
                                DetailsModel(
                                  image: "assets/images/gardga.png",
                                  cityAr: "الغردقة",
                                  cityEn: "Hurghada",
                                  discAr: " مدينة الشعب المرجانية والبحر الهادئ تتشابه مياهها في النقاء مع مياه جزر المالديف، تعتبر مشتى رائع وتشتهر بـ رياضة الغوص والسفارى.",
                                  discEn: "A big and open winter resort, known for its colorful Coral reef , very clear &smooth sea like Maldives, diving and Safari.",
                                ),
                                DetailsModel(
                                  image: "assets/images/safaga.png",
                                  cityAr: "سفاجا",
                                  cityEn: "Safaga",
                                  discAr: "مقصد سياحي خلاب يتيح فرصة الاستمتاع بطبيعة البحر الأحمر وتمتاز بالهدوء وسهولة الرياضات المائية ومن أهم الوجهات بها جزيرة يوتوبيا.",
                                  discEn: "Tourists’ good destination to enjoy the RedSea as it’s a low-noise city, water sports are the basic activities there, Also there is a unique Island.. Utobia.",
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
