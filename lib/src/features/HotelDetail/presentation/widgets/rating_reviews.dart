import 'package:cleancode/src/core/constant/assets.dart';
import 'package:cleancode/src/shared/presentation/widgets/SliverGridDelegateWithFixedCrossAxisCountAndFixedHeight.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../domain/models/hotel_model.dart';

class RatingsReviews extends StatelessWidget {
  Rating rating;
  List<Reviews> reviews; RatingsReviews({super.key,required this.reviews,required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 20,
        ),
        CustomText(
          title: "Ratings & reviews",
          color: AppColors.darkText,
          size: 16,
          fontWeight: FontWeight.w600,
        ),
        SizedBox(
          height: 18,
        ),
        RatingsTile(rating:rating),
        SizedBox(
          height: 10,
        ),
        ReviewsCarousel(reviews: reviews,),
        SizedBox(
          height: 18,
        ),
        TextButton(
          onPressed: () {},
          child: CustomText(
            title: "Show more",
            color: AppColors.primaryColor,
            size: 14,
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}

class RatingsTile extends StatelessWidget {
  Rating rating; RatingsTile({super.key,required this.rating});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "5",
              color: AppColors.darkText,
              size: 20,
              fontWeight: FontWeight.w500,
            ),
            SizedBox(width: 10,),
            SizedBox(
                width: 140,
                height: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child
                    : LinearProgressIndicator(value: rating.five,backgroundColor:Colors.grey.withOpacity(0.5
                    )))),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "4",
              color: AppColors.darkText,
              size: 20,
              fontWeight: FontWeight.w500,
            ),            SizedBox(width: 10,),
            SizedBox(
                width: 140,
                height: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child
                        : LinearProgressIndicator(value: rating.four,backgroundColor:Colors.grey.withOpacity(0.5
                    )))),

          ],
        ),
        Row(          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "3",
              color: AppColors.darkText,
              size: 20,
              fontWeight: FontWeight.w500,
            ),            SizedBox(width: 10,),
            SizedBox(
                width: 140,
                height: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child
                        : LinearProgressIndicator(value: rating.three,backgroundColor:Colors.grey.withOpacity(0.5
                    )))),

          ],
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomText(
              title: "2",
              color: AppColors.darkText,
              size: 20,
              fontWeight: FontWeight.w500,
            ),            SizedBox(width: 10,),
            SizedBox(
                width: 140,
                height: 10,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child
                        : LinearProgressIndicator(value:rating.two,backgroundColor:Colors.grey.withOpacity(0.5
                    )))),

          ],
        ),

      ],
    );
  }
}


class ReviewsCarousel extends StatefulWidget {
  List<Reviews> reviews; ReviewsCarousel({super.key,required this.reviews});

  @override
  State<ReviewsCarousel> createState() => _ReviewsCarouselState();
}

class _ReviewsCarouselState extends State<ReviewsCarousel> {
  int selectedIndex=0;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
        height: 179,
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
        viewportFraction: 0.6,
        enlargeCenterPage: false,
        scrollDirection: Axis.horizontal,
      ),
      items:widget.reviews.map((review) {
        return Builder(
          builder: (BuildContext context) {
            return ReviewTile(review:review);
          },
        );
      }).toList(),
    );
  }
}

class ReviewTile extends StatelessWidget {
  final Reviews review ;ReviewTile({super.key,required this.review});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width/2,
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),

      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              // height: 110,
              // width: 200,
              decoration: BoxDecoration(
                color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: AppColors.grey.withOpacity(0.5),
                  blurRadius: 1,
                  spreadRadius: 1,
                  offset: Offset(0, 1))
            ],
                borderRadius: BorderRadius.circular(26),
              ),
              child:   Center(
                child: Padding(
                  padding: const EdgeInsets.all(15.0),
                  child: CustomText(
                    title: "${review.review}",
                    color: AppColors.darkText,
                    size: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(
                  image: AssetImage(Assets.PhotoProfile),
                  height: 39,
                ),
                SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      title: "${review.user.name}",
                      color: AppColors.darkText,
                      size: 12,
                      fontWeight: FontWeight.w600,
                    ),
                    CustomText(
                      title: "Joined Apr ${review.user.joined.day}-${review.user.joined.month}-${review.user.joined.year}",
                      color: AppColors.darkText,
                      size: 10,
                      fontWeight: FontWeight.w500,
                    ),    SizedBox(
                      height: 5,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Icon(
                          CupertinoIcons.star_fill,
                          color: AppColors.primaryColor,
                          size: 10,
                        ),
                      ],
                    ),
                  ],
                ),

              ],
            ),


          ],
        ),
      ),
    );
  }
}
