

class HotelModel {
  List<String> banners;
  String ratings;
  bool isFav;
  String area;
  int sleeps;
  int bedrooms;
  int bathrooms;
  String title;
  String type;
  String about;
  String tripCheckin;
  String tripCheckout;
  Guests guests;
  BedRoom bedRoom;
  BathRoom bathRoom;
  HowToAccess howToAccess;
  Cancellation cancellation;
  List<Features> features;
  Location location;
  HouseRules houseRules;
  List<Things> allowedThings;
  List<Things> notAllowedThings;
  List<String> additionalRules;
  List<Safety> safety;
  Host host;
  Rating rating;
  List<Reviews> reviews;
  double subtotal;
  double total;

  HotelModel(
      {required this.reviews,
        required this.rating,
        required this.houseRules,
        required this.location,
        required this.cancellation,
        required this.howToAccess,
        required this.bathRoom,
        required this.bedRoom,
        required this.title,
        required this.guests,
        required this.type,
        required this.total,
        required this.about,
        required this.additionalRules,
        required this.allowedThings,
        required this.area,
        required this.banners,
        required this.bathrooms,
        required this.bedrooms,
        required this.features,
        required this.host,
        required this.isFav,
        required this.notAllowedThings,
        required this.safety,
        required this.sleeps,
        required this.subtotal,
        required this.tripCheckin,
        required this.tripCheckout,
        required this.ratings});
}

class Guests {
  int totalGuests;
  int adults;
  int childerns;
  int infants;
  int pets;

  Guests({
    required this.adults,
    required this.childerns,
    required this.infants,
    required this.totalGuests,
    required this.pets,
  });
}

class BedRoom {
  String title;
  int kingBed;
  int singleBed;
  int bunkBed;
  int babyCrib;

  BedRoom({
    required this.title,
    required this.kingBed,
    required this.singleBed,
    required this.bunkBed,
    required this.babyCrib,
  });
}

class BathRoom {
  String title;
  bool toilet;
  bool sink;
  bool shower;
  bool bathtub;

  BathRoom({
    required this.title,
    required this.toilet,
    required this.bathtub,
    required this.shower,
    required this.sink,
  });
}

class HowToAccess {
  List<String> instructions;

  HowToAccess({
    required this.instructions,
  });
}

class Cancellation {
  DateTime cancelTill;

  Cancellation({required this.cancelTill});
}

class Features {
  String title;
  String image;

  Features({
    required this.title,
    required this.image,
  });
}

class Location {
  String address;
  double latitude;
  double longitude;

  Location({
    required this.address,
    required this.latitude,
    required this.longitude,
  });
}

class HouseRules {
  String checkin;
  String checkout;

  HouseRules({
    required this.checkin,
    required this.checkout,
  });
}

class Things {
  String title;
  String image;
  bool isAllowed;

  Things({
    required this.title,
    required this.image,
    required this.isAllowed,
  });
}

class Safety {
  String image;
  String title;

  Safety({
    required this.title,
    required this.image,
  });
}

class Host {
  String name;
  DateTime joined;
  bool isVerified;
  double rating;
  String reviews;

  Host({
    required this.name,
    required this.joined,
    required this.isVerified,
    required this.rating,
    required this.reviews,
  });
}

class Rating {
  double one;
  double two;
  double three;
  double four;
  double five;

  Rating({
    required this.one,
    required this.three,
    required this.two,
    required this.four,
    required this.five,
  });
}

class Reviews {
  String review;
  Host user;

  Reviews({
    required this.review,
    required this.user,
  });
}
