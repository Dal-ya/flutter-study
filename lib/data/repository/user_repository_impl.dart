import 'package:hello_world/domain/model/user_model.dart';
import 'package:hello_world/util/result.dart';
import 'package:hello_world/domain/repository/user_repository.dart';
import 'package:hello_world/data/source/source.dart';

class UserRepositoryImpl implements UserRepository {
  final Source api;

  UserRepositoryImpl(this.api);

  @override
  Future<Result<UserModel>> getUserById(int id) async {
    var result = await api.getUserById(id);
    return result.when(success: (json) {
      UserModel userModel = UserModel.fromJson(json);
      return Result.success(userModel);
    }, error: (message) {
      return Result.error(message);
    });
  }

  @override
  Future<Result<List<UserModel>>> getUserList() async {
    var result = await api.getUserList();
    return result.when(success: (s) {
      var userList = s.map((e) => UserModel.fromJson(e)).toList();
      return Result.success(userList);
    }, error: (message) {
      return Result.error(message);
    });
  }
}