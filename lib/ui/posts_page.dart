import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/blocs/bloc/data_bloc.dart';
import 'package:glow_switch/data/models/data_model.dart';
import 'package:glow_switch/widgets/loader.dart';

class Posts extends StatefulWidget {
  const Posts({super.key});

  @override
  State<Posts> createState() => _PostsState();
}

class _PostsState extends State<Posts> {

  @override
  void initState() {
    BlocProvider.of<DataBloc>(context).add(FetchDataEvent());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        // iconTheme: const IconThemeData(
        //   color: Colors.black, //change your color here
        // ),
        title: const Text(
          'Posts',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: BlocConsumer<DataBloc, DataState>(
        listener: (context, state) {
          if (state is ErrorState) {
            // ignore: avoid_print
            print('state************** Error');
            Center(
                child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.black),
            ));
          }
        },
        builder: (context, state) {
          // ignore: avoid_print
          print('state**************');
          // ignore: avoid_print
          print(state);
          if (state is ErrorState) {
            return Center(
                child: Text(
              state.errorMessage,
              style: const TextStyle(color: Colors.black),
            ));
          }
          if (state is DataLoadingState) {
            return Loader(
              key: widget.key,
            );
          }
          if (state is DataLoadedState) {
            return _myListView(context, state.dataModel);
          }
          return Container(
            padding: const EdgeInsets.only(top: 5, left: 7, right: 7),
          );
        },
      ),
    );
  }

  Widget _myListView(BuildContext context, List<DataModel> dataModel) {
    return ListView.builder(
      itemCount: dataModel.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('Id:'),
                  Text(dataModel[index].id.toString())
                ],
              ),
            ),
            // Row(
            //   children: [
            //     const Text('Body:'),
            //     Text(dataModel[index].body.toString())
            //   ],
            // ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('Title:'),
                  Expanded(
                    child: Text(
                      dataModel[index].title.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 3,
                      softWrap: true,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  const Text('User Id:'),
                  Text(dataModel[index].userId.toString())
                ],
              ),
            ),

            const Divider(
              color: Colors.grey,
            )
          ],
        );
      },
    );
  }
}
