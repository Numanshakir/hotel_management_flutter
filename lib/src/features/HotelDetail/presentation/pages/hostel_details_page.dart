import 'package:cleancode/src/features/HotelDetail/presentation/provider/state/data_state.dart';
import 'package:cleancode/src/features/HotelDetail/presentation/widgets/pricing_tile.dart';
import 'package:cleancode/src/features/SimilarHotels/presentation/similar_hotels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/theme/app_colors.dart';
import '../../../../shared/presentation/widgets/appText/app_text.dart';
import '../../domain/models/hotel_model.dart';
import '../components/top_bar.dart';
import '../provider/hostel_detail_provider.dart';
import '../widgets/bathroom_details.dart';
import '../widgets/bedroom_details.dart';
import '../widgets/cancellation_policy.dart';
import '../widgets/featues.dart';
import '../widgets/hosted_by.dart';
import '../widgets/how_to_access.dart';
import '../widgets/location_details.dart';
import '../widgets/rating_reviews.dart';
import '../widgets/rules.dart';
import '../widgets/safety.dart';
import '../widgets/trip_dates.dart';


class HotelDetailPage extends ConsumerStatefulWidget {

  const HotelDetailPage({Key? key}) : super(key: key);

  @override
  ConsumerState<HotelDetailPage> createState() => _HotelDetailPageState();
}

class _HotelDetailPageState extends ConsumerState<HotelDetailPage> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.microtask(() async {
      await ref.read(dataNotifierProvider.notifier).fetchData();
    });
  }

  @override
  Widget build(BuildContext context) {
    final dataState = ref.watch(dataNotifierProvider);
    print("dataState ${dataState}");
    if (dataState is DataLoading) {
      return Container(
        color: Colors.white,
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    final HotelModel hotelModel = (dataState as DataLoaded).data;
    return Scaffold(
      body: Container(
        height: MediaQuery
            .of(context)
            .size
            .height,
        width: MediaQuery
            .of(context)
            .size
            .width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              TopBar(hotelModel: hotelModel,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: "${dataState.data.title}",
                      color: AppColors.darkText,
                      size: 20,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        CustomText(
                          title: "${hotelModel.type}  ",
                          color: AppColors.darkText,
                          size: 13,
                          fontWeight: FontWeight.w700,
                        ),
                        CustomText(
                          title: "${hotelModel.bedrooms} bedrooms ",
                          color: AppColors.darkText,
                          size: 12,
                          fontWeight: FontWeight.w500,
                        ),
                        CustomText(
                          title: "${hotelModel.guests.totalGuests} guests",
                          color: AppColors.darkText,
                          size: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    TripDates(hotelModel: hotelModel,),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: "About this place",
                      color: AppColors.darkText,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      title:
                      "${hotelModel.about}",
                      color: AppColors.darkText,
                      size: 14,
                      fontWeight: FontWeight.w400,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    CustomText(
                      title: "Rooms Details",
                      color: AppColors.darkText,
                      size: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        BedroomDetails(bedRoom:hotelModel.bedRoom),
                        SizedBox(
                          width: 10,
                        ),
                        BathRoomDetails(bathRoom:hotelModel.bathRoom),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    HowToAccessView(howToAccess: hotelModel.howToAccess,),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    CancellatioPolicy(cancellation:hotelModel.cancellation),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    RoomFeatures(features:hotelModel.features),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    LocationDetails(),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    Rules(allowedThings:hotelModel.allowedThings,notAllowedThings: hotelModel.notAllowedThings,additionalRules: hotelModel.additionalRules),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SafetyView(safety: hotelModel.safety,),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    HostedBy(host: hotelModel.host,),
                    SizedBox(
                      height: 30,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    RatingsReviews(rating: hotelModel.rating,reviews: hotelModel.reviews,),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SimilarHotels(),
                    SizedBox(
                      height: 10,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TextButton(
                          onPressed: () {},
                          child: CustomText(
                            title: "Report listing",
                            color: AppColors.primaryColor,
                            size: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Divider(
                      height: 1,
                      color: AppColors.divider,
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    PricingTile(hotelModel:hotelModel),
                    SizedBox(
                      height: 50,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
