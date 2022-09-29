import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:users_app_with_realdatabase_firebase/repository/usersdao_repository.dart';

class UserDetailCubit extends Cubit<void> {
  UserDetailCubit() : super(0);

  var userDetailRepository = UsersDaoRepository();

  Future<void> edit(int user_id, String userName, String user_tel) async {
    await userDetailRepository.userEdit(user_id, userName, user_tel);
  }
}
