import '../../../../core/constant/assets.dart';
import '../../../../core/network/network.dart';
import '../../domain/models/hotel_model.dart';
import '../../domain/models/data_entity.dart';

class LocalDataSource {
  final DioHelper dioHelper;

  LocalDataSource({required this.dioHelper});

  Future<HotelModel> fetchDataFromLocal() async {
    try {
      HotelModel hotelModel = HotelModel(
          reviews: [
            Reviews(
                review:
                    "Lorem Ipsum is simply dummythe printing and typesetting Lorem Ipsum Ipsum is simply Ipsum.....",
                user: Host(
                    name: "Luis",
                    joined: DateTime(
                      2013,
                    ),
                    isVerified: true,
                    rating: 5,
                    reviews: ""))
          ],
          rating: Rating(one: 0.5, three: 0.2, two: 0.4, four: 0.2, five: 0.3),
          houseRules: HouseRules(
            checkin: "4:oo PM",
            checkout: "10:00 AM",
          ),
          location: Location(
              address: "This is the exact address that is shared§",
              latitude: 0.0,
              longitude: 0.0),
          cancellation: Cancellation(cancelTill: DateTime(2025)),
          howToAccess:
              HowToAccess(instructions: ["Self Check-in with smart lock"]),
          bathRoom: BathRoom(
              title: "Bathroom 1",
              toilet: true,
              bathtub: true,
              shower: true,
              sink: true),
          bedRoom: BedRoom(
              title: "Bedroom 1",
              kingBed: 1,
              singleBed: 2,
              bunkBed: 3,
              babyCrib: 1),
          title: "Modern, waterfront vacation home in Miami    Sleeps 12! ",
          guests: Guests(
              adults: 7, childerns: 4, infants: 1, totalGuests: 11, pets: 1),
          type: "Mansion",
          total: 6,
          about:
              "If history is your thing, you might like to know that this apartment is within a stone's throw of where the shot heard 'round the world occurred and began the Revolutionary War. This historic district is a highly sought-after Battle Greens Apartments community just thirteen miles from Downtown Boston employers, shopping, and eateries.",
          additionalRules: [
            "You'll be staying in someone's home, so please treat it with care and respect.",
            "Checking in and out",
            "Flexible check-in",
            "Checkout before 4:00 PM"
          ],
          allowedThings: [
            Things(title: "Infants under 2 years", image: Assets.kids, isAllowed: true),
            Things(title: "Pets", image:Assets.pet_flat, isAllowed: true),
            Things(title: "Late checkout", image: Assets.checkout, isAllowed: true),
          ],
          area: "1200",
          banners: [
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQe91lmkQ2L86B_0m3dPKjzK3lt13pD_BHxwg&s",
            "https://images.bubbleup.com/width1920/quality35/mville2017/1-brand/1-margaritaville.com/gallery-media/220803-compasshotel-medford-pool-73868-1677873697-78625-1694019828.jpg"
          ],
          bathrooms: 2,
          bedrooms: 2,
          features: [
            Features(title: 'Pool', image: Assets.pool),
            Features(title: 'Hot tube', image: Assets.hot_tube),
            Features(title: 'Indoor fireplace', image: Assets.indor_fireplace),
            Features(title: 'Air Condition', image: Assets.aircondition),
            Features(title: 'Gym', image: Assets.gym),
            Features(title: 'Heating', image: Assets.heat),
          ],
          host: Host(
              name: "Luis",
              joined: DateTime(
                2013,
              ),
              isVerified: true,
              rating: 5,
              reviews: ""),
          isFav: false,
          notAllowedThings: [
            Things(title: "Smoking", image: Assets.smoking, isAllowed: true),
            Things(title: "Parties or events", image: Assets.parties, isAllowed: true),
            Things(title: "Early Check in", image:Assets.early, isAllowed: true),
            Things(title: "Shoes inside the house", image:Assets.shoes, isAllowed: true),
          ],
          safety: [
            Safety(title: "Security cameras", image:Assets.security_cam_flat),
            Safety(title: "Fire exitinguisher", image: Assets.fire_extinguishers_flat),
            Safety(title: "Smoke detector", image:Assets.smoke_detector),
            Safety(title: "First Aid Kit", image: Assets.frist_aid_kit),
          ],
          sleeps: 12,
          subtotal: 138,
          tripCheckin: "Fri, Oct 08",
          tripCheckout: "Mon, Oct 08",
          ratings: "5.0");
      // Convert DataModel to DataEntity
      return hotelModel;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
