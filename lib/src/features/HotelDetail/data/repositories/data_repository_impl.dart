

import '../../domain/models/data_entity.dart';
import '../../domain/repositries/listing_repositry.dart';
import '../datasources/remote_data_source.dart';

class DataRepositoryImpl implements DataRepository {
  final RemoteDataSource remoteDataSource;

  DataRepositoryImpl({required this.remoteDataSource});

  @override
  Future<DataEntity> fetchData() async {
    return await remoteDataSource.fetchDataFromApi();
  }
}
