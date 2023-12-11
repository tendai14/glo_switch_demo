part of 'data_bloc.dart';

sealed class DataState extends Equatable {
  const DataState();

  @override
  List<Object> get props => [];
}

final class DataInitial extends DataState {}

final class DataLoadingState extends DataState {}

final class DataLoadedState extends DataState {
  final List<DataModel> dataModel;

  const DataLoadedState({required this.dataModel});

  @override
  List<Object> get props => [dataModel];
}

final class ErrorState extends DataState {
  final String errorMessage;

  const ErrorState({required this.errorMessage});

   @override
  List<Object> get props => [errorMessage];
}
