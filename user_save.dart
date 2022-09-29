import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/userssavecubit.dart';

class UserSave extends StatefulWidget {
  const UserSave({Key? key}) : super(key: key);

  @override
  State<UserSave> createState() => _UserSaveState();
}

class _UserSaveState extends State<UserSave> {
  var tfUserName = TextEditingController();
  var tfUserTel = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Save'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextField(
                controller: tfUserName,
                decoration: const InputDecoration(hintText: 'UserName'),
              ),
              TextField(
                controller: tfUserTel,
                decoration: const InputDecoration(hintText: 'UserTel'),
              ),
              ElevatedButton(
                  onPressed: () {
                    context
                        .read<UsersSaveCubit>()
                        .save(tfUserName.text, tfUserTel.text);
                  },
                  child: const Text('Save')),
            ],
          ),
        ),
      ),
    );
  }
}
