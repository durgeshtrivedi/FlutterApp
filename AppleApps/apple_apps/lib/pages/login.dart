import 'package:apple_apps/constants/images_path.dart';
import 'package:apple_apps/constants/string_constants.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: Constants.title,
      home: Scaffold(
        appBar: AppBar(title: const Text(Constants.title)),
        // body: Container(
        //   decoration: const BoxDecoration(color: Colors.white),
        body: Center(
          child: Column(
            children: [
              Image.asset(AppImages.loginImage, fit: BoxFit.cover),
              const TextField(),
              const TextField(),
              const ElevatedButton(
                  onPressed: null, child: Text(Constants.login))
            ],
          ),
        ),
      ),
      //   ),
    );
  }
}
