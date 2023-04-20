import 'package:flutter/material.dart';
import 'package:village/core/constants/style.dart';
import 'package:village/view/pages/user/host_apply_page/widgets/host_apply_form.dart';

class UserApplyHostPage extends StatelessWidget {
  final _formfield = GlobalKey<FormState>();
  final _hostNameController = TextEditingController();
  final _addressController = TextEditingController();
  final _businessNumController = TextEditingController();


  UserApplyHostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(color: Colors.black),
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 30),
                HostApplyForm(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
