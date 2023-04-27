import 'package:flutter/material.dart';
import 'package:village/model/test/test_repository.dart';
import 'package:village/model/test/user_test.dart';

class JsonParse extends StatefulWidget {
  const JsonParse({Key? key}) : super(key: key);

  @override
  State<JsonParse> createState() => _JsonParseState();
}

class _JsonParseState extends State<JsonParse> {
  List<UserTest> _user = <UserTest>[];
  bool loading = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Services.getInfo().then((value) {
      // Services.getUserInfo();
      // Services.getJusoInfo();
      setState(() {
        _user = value;
        loading = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(loading ? 'UserTest' : 'Loading...'),
      ),
      body: ListView.builder(
        itemCount: _user.length,
        itemBuilder: (context, index) {
          UserTest user = _user[index];
          return ListTile(
            leading: const Icon(
              Icons.account_circle_rounded,
              color: Colors.blue,
            ),
            trailing: IconButton(
              onPressed: () {
                showDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog(
                      title: Text(user.name),
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(user.phone),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text('Close'),
                          ),
                        ],
                      ),
                    );
                  },
                );
              },
              icon: const Icon(
                Icons.phone_android_outlined,
                color: Colors.red,
              ),
            ),
            title: Text(user.name),
            subtitle: Text(user.email),
          );
        },
      ),
    );
  }
}
