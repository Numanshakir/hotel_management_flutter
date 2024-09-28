


import '../../domain/models/hotel_model.dart';

import '../../domain/repositries/local_data_repositry.dart';
import '../datasources/local_data_source.dart';

class LocalRepositoryImpl implements LocalDataRepository {
  final LocalDataSource localDataSource;

  LocalRepositoryImpl({required this.localDataSource});

  @override
  Future<HotelModel> fetchData() async {
    return await localDataSource.fetchDataFromLocal();
  }
}
