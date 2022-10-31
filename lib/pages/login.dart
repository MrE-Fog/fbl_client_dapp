import 'package:fbl_client_dapp/pages/home.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class LogIn extends HookWidget {
  const LogIn({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final employeeAddress =
        useTextEditingController.fromValue(TextEditingValue.empty);

    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Form(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 100.0),
                  child: Image.asset(
                    'assets/logo.png',
                    width: 100,
                  ),
                ),
                const Text('Pleas enter you wallet public key'),
                TextFormField(
                  controller: employeeAddress,
                  decoration: const InputDecoration(labelText: 'Pub Key'),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter you pub key';
                    }
                    bool addressValid =
                        RegExp(r"^0x[a-fA-F0-9]{40}$").hasMatch(value);
                    if (!addressValid) {
                      print('Faild the regex');
                      return 'Please enter a valid email';
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    print(employeeAddress.text);

                    // if (formKey.currentState?.validate() ?? false) {
                    //   formKey.currentState?.save();
                    //   //TODO: call a contract func
                    // }
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Home(),
                      ),
                    );
                  },
                  child: const Text('Send'),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
