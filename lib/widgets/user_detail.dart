import 'package:flutter/cupertino.dart';
import 'package:hello_world/domain/model/user_model.dart';

class UserDetail extends StatelessWidget {
  const UserDetail({
    Key? key,
    this.user,
  }) : super(key: key);

  final UserModel? user;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(user?.email ?? 'no data'),
        Text(user?.name ?? 'no data'),
      ],
    );
  }
}
