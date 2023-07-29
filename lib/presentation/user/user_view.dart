import 'package:flutter/material.dart';
import 'package:hello_world/main.dart';
import 'package:hello_world/widgets/email_button.dart';
import 'package:hello_world/widgets/user_detail.dart';

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
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < vm.userList.length; i++)
                      EmailButton(
                        title: vm.userList[i].email,
                        idx: i,
                        onPressed: () async {
                          await vm.getUserById(vm.userList[i].id);
                          setState(() {});
                        },
                      )
                  ],
                ),
              ),
            ),
            Expanded(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    for (int i = 0; i < vm.userList.length; i++)
                      EmailButton(
                        title: vm.userList[i].email,
                        idx: i,
                        onPressed: () async {
                          await vm.getUserById(vm.userList[i].id);
                          setState(() {});
                        },
                      )
                  ],
                ),
              ),
            ),
          ],
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [UserDetail(user: vm.user)],
        ),
      ],
    ));
  }
}
