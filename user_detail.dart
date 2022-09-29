import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/usersdetailcubit.dart';
import 'package:users_app_with_realdatabase_firebase/entity/users.dart';

class UserDetail extends StatefulWidget {
  Users user;

  UserDetail({required this.user});

  @override
  State<UserDetail> createState() => _UserDetailState();
}

class _UserDetailState extends State<UserDetail> {
  var tfUserName = TextEditingController();
  var tfUserTel = TextEditingController();

  @override
  void initState() {
    super.initState();
    var user = widget.user;
    tfUserName.text = user.user_name;
    tfUserTel.text = user.user_tel;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users Detail'),
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
                    context.read<UserDetailCubit>().edit(
                        widget.user.user_id, tfUserName.text, tfUserTel.text);
                  },
                  child: const Text('Edit')),
            ],
          ),
        ),
      ),
    );
  }
}
