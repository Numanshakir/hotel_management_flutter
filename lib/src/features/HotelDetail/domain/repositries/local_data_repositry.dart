
import '../models/hotel_model.dart';

abstract class LocalDataRepository {
  Future<HotelModel> fetchData();
}