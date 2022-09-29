import 'package:users_app_with_realdatabase_firebase/entity/users.dart';
import 'package:users_app_with_realdatabase_firebase/sqlite/databasehelper.dart';

class UsersDaoRepository {
  Future<void> userSave(String userName, String user_tel) async {
    var database = await DatabaseHelper.accessDatabase();
    var infos = Map<String, dynamic>();
    infos['user_name'] = userName;
    infos['user_tel'] = user_tel;
    await database.insert('Contacts', infos);
  }

  Future<void> userEdit(int user_id, String userName, String user_tel) async {
    var database = await DatabaseHelper.accessDatabase();
    var infos = Map<String, dynamic>();
    infos['user_name'] = userName;
    infos['user_tel'] = user_tel;
    await database
        .update('Contacts', infos, where: 'user_id=?', whereArgs: [user_id]);
  }

  Future<List<Users>> getAndShowAllUsers() async {
    var database = await DatabaseHelper.accessDatabase();
    List<Map<String, dynamic>> mapsShowAllUsers =
        await database.rawQuery('SELECT * FROM Contacts');
    return List.generate(mapsShowAllUsers.length, (index) {
      var rowMapsShowAllUsers = mapsShowAllUsers[index];
      return Users(
          user_id: rowMapsShowAllUsers['user_id'],
          user_name: rowMapsShowAllUsers['user_name'],
          user_tel: rowMapsShowAllUsers['user_tel']);
    });
  }

  Future<List<Users>> searchUser(String searchName) async {
    var database = await DatabaseHelper.accessDatabase();
    List<Map<String, dynamic>> mapsShowAllUsers = await database.rawQuery(
        "SELECT * FROM Contacts WHERE user_name like '%$searchName%' ");
    return List.generate(mapsShowAllUsers.length, (index) {
      var rowMapsShowAllUsers = mapsShowAllUsers[index];
      return Users(
          user_id: rowMapsShowAllUsers['user_id'],
          user_name: rowMapsShowAllUsers['user_name'],
          user_tel: rowMapsShowAllUsers['user_tel']);
    });
  }

  Future<void> deleteUser(int user_id) async {
    var database = await DatabaseHelper.accessDatabase();
    await database.delete('Contacts', where: 'user_id=?', whereArgs: [user_id]);
  }
}
