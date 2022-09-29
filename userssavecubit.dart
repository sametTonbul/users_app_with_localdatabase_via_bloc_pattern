import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/repository/usersdao_repository.dart';

class UsersSaveCubit extends Cubit<void> {
  UsersSaveCubit() : super(0);

  var usersRepo = UsersDaoRepository();

  Future<void> save(String userName, String user_tel) async {
    await usersRepo.userSave(userName, user_tel);
  }
}
