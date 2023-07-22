import 'package:hello_world/domain/usecase/user_usecase.dart';
import 'package:hello_world/domain/model/user_model.dart';

class UserViewModel {
  final UserUseCase _useCase;

  List<UserModel> userList = [];
  UserModel? user;

  UserViewModel(this._useCase);

// view 에서 userList 를 가져 오는 기능 호출
  Future getUserList(Function() callback) async {
    var result = await _useCase.getUserList();
    result.when(success: (userList) {
      this.userList = userList;
      callback();
    }, error: (message) {
      // 예외처리
      print('error: $message');
    });
  }

// view 에서 특정 user 의 정보를 가져 오는 기능 호출
  Future getUserById(int id) async {
    var result = await _useCase.getUserById(id);
    result.when(success: (user) {
      this.user = user;
    }, error: (message) {
      // 예외처리
      print('error: $message');
    });
  }
}
