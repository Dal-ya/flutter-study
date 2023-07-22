import 'package:hello_world/domain/model/user_model.dart';
import 'package:hello_world/util/result.dart';

abstract class UserRepository {
  Future<Result<List<UserModel>>> getUserList();
  Future<Result<UserModel>> getUserById(int id);
}