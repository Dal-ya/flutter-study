import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';

class UserView extends StatefulWidget {
  const UserView({super.key});

  @override
  State<UserView> createState() => _UserViewState();
}

class _UserViewState extends State<UserView> {
  @override
  Widget build(BuildContext context) {
    var vm = MyInherited1.of(context).vm;
    vm.getUserList(() {
      setState(() {});
    });

    return Scaffold(
        body: Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            for (int i = 0; i < vm.userList.length; i++)
              GestureDetector(
                onTap: () async {
                  await vm.getUserById(vm.userList[i].id);

                  setState(() {});
                },
                child: Container(
                    color: Colors.amber,
                    padding: const EdgeInsets.only(bottom: 14),
                    child: Text(vm.userList[i].email)),
              ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(vm.user?.email ?? ''),
            Text(vm.user?.name ?? ''),
          ],
        ),
      ],
    ));
  }
}
