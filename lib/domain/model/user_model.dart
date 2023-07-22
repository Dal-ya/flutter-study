import 'package:freezed_annotation/freezed_annotation.dart';
part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    required int id,
    String? name,
    String? username,
    required String email,
    required DateTime createdAt,
    DateTime? updatedAt,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

// final int id;
// final String? name;
// final String? username;
// final String email;
// final DateTime createdAt;
// final DateTime? updatedAt;
//
// UserModel({
//   required this.id,
//   this.name,
//   this.username,
//   required this.email,
//   required this.createdAt,
//   this.updatedAt,
// });
//
// factory UserModel.fromJson(Map<String, dynamic> json) {
//   return UserModel(
//     id: json['id'],
//     name: json['name'],
//     username: json['username'],
//     email: json['email'],
//     createdAt: DateTime.parse(json['created_at']),
//     updatedAt: json['updated_at'] != null
//         ? DateTime.parse(json['updated_at'])
//         : null,
//   );
// }
//

void main() {
  // final user = UserModel(
  //     id: 1,
  //     name: 'sherlock',
  //     username: 'sherlock holmes',
  //     email: '',
  //     createdAt: DateTime.now());

  // var user = UserModel(id: 1, email: 'sherlock@abc.com', createdAt: DateTime.now().toUtc());
  // print('user: ${user.id} ${user.email} ${user.createdAt }');

  Map<String, dynamic> json = {
    "id": 1,
    "name": "Leanne Graham",
    "username": "Bret",
    "email": "sherlock@abc.com",
    "createdAt": "2023-07-10T12:00:00.000Z",
  };

  var user = UserModel.fromJson(json);
  print('user: ${user.id} ${user.email} ${user.createdAt }');
}
