import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/data/models/user_model.dart';
import 'package:glow_switch/data/models/user_response_model.dart';
import 'package:glow_switch/data/repositories/data_repository/data_repository.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  final DataRepository dataRepository;
  UserBloc({required this.dataRepository}) : super(UserInitial());

  @override
  Stream<UserState> mapEventToState(UserEvent event) async* {
    // ignore: avoid_print
    print("in data bloc");

    if (event is CreateUserEvent) {
      yield UserLoadingState();
      try {
        // ignore: avoid_print
        print("in user bloc");
        UserResponseModel userResponse =
            await dataRepository.createUser(event.userModel);
        log(userResponse.toString());
        yield UserLoadedState(userResponseModel: userResponse);
      } catch (e) {
        yield UserErrorState(errorMessage: e.toString());
      }
    }
  }
}
