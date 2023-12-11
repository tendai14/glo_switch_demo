import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/data/repositories/data_repository/data_provider.dart';
import 'package:glow_switch/data/repositories/data_repository/data_repository.dart';

class AppRepositories extends StatelessWidget {
  final Widget appBlocs;

  const AppRepositories({Key? key, required this.appBlocs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider(
            create: (context) => DataRepository(dataProvider: DataProvider())),
      ],
      child: appBlocs,
    );
  }
}
