


import '../../../domain/models/data_entity.dart';
import '../../../domain/models/hotel_model.dart';

abstract class DataState {}

class DataInitial extends DataState {}

class DataLoading extends DataState {}

class DataLoaded extends DataState {
  final HotelModel data;

  DataLoaded({required this.data});
}

class DataError extends DataState {
  final String message;

  DataError({required this.message});
}
