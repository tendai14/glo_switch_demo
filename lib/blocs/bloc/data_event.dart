part of 'data_bloc.dart';

sealed class DataEvent extends Equatable {
  const DataEvent();

  @override
  List<Object> get props => [];
}

class FetchDataEvent extends DataEvent {
  @override
  List<Object> get props => [];
}
