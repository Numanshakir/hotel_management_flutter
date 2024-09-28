import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../core/constant/assets.dart';

class SliderView extends StatefulWidget {
  final List<String> banners; SliderView({super.key,required this.banners});

  @override
  State<SliderView> createState() => _SliderViewState();
}

class _SliderViewState extends State<SliderView> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 337,
        initialPage: selectedIndex,
        enableInfiniteScroll: true,
        reverse: false,
        autoPlay: false,
        autoPlayInterval: const Duration(seconds: 2),
        autoPlayAnimationDuration:
        const Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,
        onPageChanged: (index, reason) {
          setState(() {
            selectedIndex = index;
          });
        },
        aspectRatio: 2.0,
        disableCenter: true,
        viewportFraction: 1,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
      items:widget.banners.map((image) {
        return Builder(
          builder: (BuildContext context) {
            return Container(
              // height: 300,width: 300,color: Colors.orange,
              child: Image.asset(Assets.hotel,fit: BoxFit.cover,),
            );
          },
        );
      }).toList(),
    );
  }
}
