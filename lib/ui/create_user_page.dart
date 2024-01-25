import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:glow_switch/blocs/user/bloc/user_bloc.dart';
import 'package:glow_switch/data/models/user_model.dart';

class CreateUserPage extends StatefulWidget {
  const CreateUserPage({super.key});

  @override
  State<CreateUserPage> createState() => _CreateUserPageState();
}

class _CreateUserPageState extends State<CreateUserPage> {
  final userController = TextEditingController();
  final balanceController = TextEditingController();
  final nameController = TextEditingController();
  final symbolController = TextEditingController();
  final typeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'Create User',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: Container(
        color: Colors.blue,
        child: ListView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SizedBox(
              // height: 45,
              child: TextField(
                controller: userController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: "User",
                  fillColor: Colors.white,
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SizedBox(
              // height: 45,
              child: TextField(
                controller: balanceController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: "Balance",
                  fillColor: Colors.white,
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SizedBox(
              // height: 45,
              child: TextField(
                controller: nameController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: "Name",
                  fillColor: Colors.white,
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SizedBox(
              // height: 45,
              child: TextField(
                controller: symbolController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: "Symbol",
                  fillColor: Colors.white,
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 70, left: 20, right: 20),
            child: SizedBox(
              // height: 45,
              child: TextField(
                controller: typeController,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.all(10),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 15)),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(width: 2)),
                  filled: true,
                  hintStyle: const TextStyle(fontSize: 13),
                  hintText: "Type",
                  fillColor: Colors.white,
                  // errorText: _validate ? 'Username Can\'t Be Empty' : null
                ),
                style: const TextStyle(color: Colors.grey),
              ),
            ),
          ),
          BlocConsumer<UserBloc, UserState>(
            listener: (context, state) {
              if (state is UserErrorState) {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Text('Add User failed ${state.errorMessage}')));
              }
              if (state is UserLoadedState) {
                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text(
                    'User Added Successfully',
                    style: TextStyle(color: Colors.black),
                  ),
                  backgroundColor: Colors.grey,
                ));
              }
            },
            builder: (context, state) {
              if (state is UserLoadingState) {
                return Column(
                  children: [
                    CircularProgressIndicator(
                      color: Colors.purple,
                      key: widget.key,
                    ),
                    const Text(
                      'Adding User',
                      style: TextStyle(color: Colors.black),
                    )
                  ],
                );
              }

              return SizedBox(
                height: 70,
                width: 150,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, right: 30),
                  child: ElevatedButton(
                    onPressed: () {
                      BlocProvider.of<UserBloc>(context).add(CreateUserEvent(
                        userModel: UserModel(
                            user: userController.text,
                            balance: balanceController.text,
                            name: nameController.text,
                            symbol: symbolController.text,
                            type: typeController.text),
                      ));
                    },
                    style: ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor:
                            MaterialStateProperty.all<Color>(Colors.purple),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          // side: const BorderSide(color: black,width: 2),
                        ))),
                    child: const Text('Create User',
                        style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        )),
                  ),
                ),
              );
            },
          )
        ]),
      ),
    );
  }
}
