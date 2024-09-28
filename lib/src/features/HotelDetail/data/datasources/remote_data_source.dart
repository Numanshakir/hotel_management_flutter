import '../../../../core/network/network.dart';
import '../../domain/models/data_entity.dart';

class RemoteDataSource {
  final DioHelper dioHelper;

  RemoteDataSource({required this.dioHelper});

  Future<DataEntity> fetchDataFromApi() async {
    try {
      final response = await dioHelper.sendRequest(
        '/data', // API endpoint
        method: 'GET',
        requiresAuth: false, // Set true if the endpoint requires authorization
      );

      // Parse the response to a list of DataModel
      DataEntity data = DataEntity.fromJson(response as Map<String, dynamic>);

      // Convert DataModel to DataEntity
      return data;
    } catch (e) {
      throw Exception('Failed to fetch data: $e');
    }
  }
}
