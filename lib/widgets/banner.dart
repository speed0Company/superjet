
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MySliverAppBar extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final double collapsedHeight;

  List<IconData> icons = [
    Icons.directions_car, // Icon for 'to_private_trip'
    Icons.settings,       // Icon for 'to_setting'
  ];


  MySliverAppBar({required this.expandedHeight, required this.collapsedHeight});

  @override
  double get minExtent => collapsedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final double size = (maxExtent - shrinkOffset).clamp(minExtent, maxExtent);

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
            alignment: Localizations.localeOf(context)
                .languageCode ==
                "ar" ? Alignment.topRight:Alignment.topLeft,
            child:   Padding(
              padding:  EdgeInsets.only(top: MediaQuery.of(context).size.height/30, left: 10, right: 10),
              child: IconButton(
                icon: Icon(
                  CupertinoIcons.back,
                  color: Colors.white,
                ),
                onPressed: (){
                  Navigator.pop(context);
                },
              ),
            )
        )
      ],
    );
  }

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}