import 'package:hello_world/domain/model/user_model.dart';
import 'package:hello_world/util/result.dart';
import 'package:hello_world/domain/repository/user_repository.dart';

class UserUseCase {
  final UserRepository _userRepository;

  UserUseCase(this._userRepository);

  Future<Result<List<UserModel>>> getUserList() async {
    return await _userRepository.getUserList();
  }

  Future<Result<UserModel>> getUserById(int id) async {
    return await _userRepository.getUserById(id);
  }
}
