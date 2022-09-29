import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/entity/users.dart';
import 'package:users_app_with_realdatabase_firebase/repository/usersdao_repository.dart';

class MainPageCubit extends Cubit<List<Users>> {
  MainPageCubit() : super(<Users>[]);

  var mainPageRepository = UsersDaoRepository();

  Future<void> loadUsers() async {
    var list = await mainPageRepository.getAndShowAllUsers();
    emit(list);
  }

  Future<void> searchUsers(String searchName) async {
    var list = await mainPageRepository.searchUser(searchName);
    emit(list);
  }

  Future<void> deleteUsers(int user_id) async {
    await mainPageRepository.deleteUser(user_id);
    await loadUsers();
  }
}
