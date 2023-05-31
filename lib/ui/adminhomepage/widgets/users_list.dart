import 'package:clubpro/models/user_account/user_account.dart';
import 'package:clubpro/service/utils.dart';
import 'package:flutter/material.dart';

class UsersList extends StatefulWidget {
  const UsersList({super.key});

  @override
  State<UsersList> createState() => _UsersListState();
}

class _UsersListState extends State<UsersList> {
  bool forceRefresh = false;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        FutureBuilder<List<UserAccount>>(
          future: UserAccount.getUsers(forceRefresh: forceRefresh),
          builder: (context, snapshot) {
            forceRefresh = false;
            if (snapshot.connectionState != ConnectionState.done) return Utils.circularProgressIndicator();
            return RefreshIndicator(
              onRefresh: () async {
                setState(() {
                  forceRefresh = true;
                });
              },
              child: ListView(
                children: [
                  if (snapshot.data != null)
                    ...snapshot.data!
                        .map((e) => ListTile(
                              title: Text(e.fullname),
                              subtitle: Text(e.runtimeType.toString()),
                            ))
                        .toList(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
