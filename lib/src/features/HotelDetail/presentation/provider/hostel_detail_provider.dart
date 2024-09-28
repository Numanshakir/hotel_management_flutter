

import 'package:cleancode/src/features/HotelDetail/presentation/provider/state/data_notifier.dart';
import 'package:cleancode/src/features/HotelDetail/presentation/provider/state/data_state.dart';
import 'package:riverpod/riverpod.dart';
import '../../../../core/network/network.dart';

import '../../data/datasources/local_data_source.dart';
import '../../data/datasources/remote_data_source.dart';
import '../../data/repositories/data_repository_impl.dart';
import '../../data/repositories/local_data_impl.dart';
import '../../domain/repositries/local_data_repositry.dart';


final dioProvider = Provider<Dio>((ref) {
  return Dio();
});

// DioHelper provider
final dioHelperProvider = Provider<DioHelper>((ref) {
  final dio = ref.read(dioProvider);
  return DioHelper(dio: dio);
});

final localDataSourceProvider = Provider<LocalDataSource>((ref) {
  final dioHelper = ref.read(dioHelperProvider);
  return LocalDataSource(dioHelper: dioHelper);
});

final localRepositoryProvider = Provider<LocalRepositoryImpl>((ref) {
  final localDataSource = ref.read(localDataSourceProvider);
  return LocalRepositoryImpl(localDataSource: localDataSource);
});


// DataNotifier provider
final dataNotifierProvider =
StateNotifierProvider<DataNotifier, DataState>((ref) {
  final dataRepository = ref.read(localRepositoryProvider);
  return DataNotifier(dataRepository);
});






