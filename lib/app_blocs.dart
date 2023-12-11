import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/blocs/bloc/data_bloc.dart';
import 'package:glow_switch/blocs/user/bloc/user_bloc.dart';
import 'package:glow_switch/data/repositories/data_repository/data_repository.dart';

class AppBlocs extends StatelessWidget {
  final Widget app;
  const AppBlocs({Key? key, required this.app}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(providers: [
      BlocProvider(
        create: (context) => UserBloc(
          dataRepository: RepositoryProvider.of<DataRepository>(context),
        ),
      ),
      BlocProvider(
        create: (context) => DataBloc(
          dataRepository: RepositoryProvider.of<DataRepository>(context),
        ),
      ),
    ], child: app);
  }
}
