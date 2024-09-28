


import '../models/data_entity.dart';

abstract class DataRepository {
  Future<DataEntity> fetchData();
}



