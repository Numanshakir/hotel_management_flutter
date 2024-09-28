
import '../../../domain/repositries/listing_repositry.dart';
import '../../../domain/repositries/local_data_repositry.dart';
import 'data_state.dart';
import 'package:riverpod/riverpod.dart';

class DataNotifier extends StateNotifier<DataState> {
  final LocalDataRepository dataRepository;

  DataNotifier(this.dataRepository) : super(DataLoading());

  Future<void> fetchData() async {
    state = DataLoading();
    try {
     await Future.delayed(Duration(seconds: 3));
      final data = await dataRepository.fetchData();
      state = DataLoaded(data: data);
    } catch (e) {
      state = DataError(message: 'Failed to fetch data');
    }
  }
}
