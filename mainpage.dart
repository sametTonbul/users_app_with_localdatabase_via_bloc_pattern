import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/cubit/mainpagecubit.dart';
import 'package:users_app_with_realdatabase_firebase/entity/users.dart';
import 'package:users_app_with_realdatabase_firebase/views/user_detail.dart';
import 'package:users_app_with_realdatabase_firebase/views/user_save.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool isSearchDo = false;

  @override
  void initState() {
    super.initState();
    context.read<MainPageCubit>().loadUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          isSearchDo
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchDo = false;
                      context.read<MainPageCubit>().loadUsers();
                    });
                  },
                  icon: Icon(Icons.cancel_outlined))
              : IconButton(
                  onPressed: () {
                    setState(() {
                      isSearchDo = true;
                    });
                  },
                  icon: Icon(Icons.search_sharp))
        ],
        title: isSearchDo
            ? TextField(
                decoration: const InputDecoration(hintText: 'Search'),
                onChanged: (searchresult) {
                  context.read<MainPageCubit>().searchUsers(searchresult);
                },
              )
            : const Text('Users'),
      ),
      body: BlocBuilder<MainPageCubit, List<Users>>(
          builder: (context, usersList) {
        if (usersList.isNotEmpty) {
          return ListView.builder(
            itemCount: usersList.length,
            itemBuilder: (context, index) {
              var user = usersList[index];
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => UserDetail(user: user)))
                      .then((value) {
                    context.read<MainPageCubit>().loadUsers();
                  });
                },
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      children: [
                        Text('${user.user_name}'),
                        const Spacer(),
                        IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context)
                                  .showSnackBar(SnackBar(
                                content:
                                    Text('${user.user_name} want to Delete?'),
                                action: SnackBarAction(
                                  label: 'Yes',
                                  onPressed: () {
                                    context
                                        .read<MainPageCubit>()
                                        .deleteUsers(user.user_id);
                                  },
                                ),
                              ));
                            },
                            icon: const Icon(Icons.delete_forever_sharp)),
                      ],
                    ),
                  ),
                ),
              );
            },
          );
        } else {
          return const SizedBox.shrink();
        }
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const UserSave()))
              .then((value) {
            context.read<MainPageCubit>().loadUsers();
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
