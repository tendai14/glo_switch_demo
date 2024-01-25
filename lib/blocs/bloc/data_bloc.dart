import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/data/models/data_model.dart';
import 'package:glow_switch/data/repositories/data_repository/data_repository.dart';

part 'data_event.dart';
part 'data_state.dart';

class DataBloc extends Bloc<DataEvent, DataState> {
  final DataRepository dataRepository;
  DataBloc({required this.dataRepository}) : super(DataInitial()) {
    on<DataEvent>((event, emit) async {
      if (event is FetchDataEvent) {
        emit(DataLoadingState());
        try {
          List<DataModel> data = await dataRepository.getPosts();
          // ignore: avoid_print
          print('in loaded state');
          emit(DataLoadedState(dataModel: data));
        } catch (e) {
          emit(ErrorState(errorMessage: e.toString()));
        }
      }
    });
  }
}
