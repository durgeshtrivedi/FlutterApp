import 'package:apple_apps/constants/dime_constants.dart';
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
        body: Scrollbar(
          child: SingleChildScrollView(
            restorationId: RestorationIdTextField.scrollView,
            child: Column(
              children: [
                Image.asset(AppImages.loginImage, fit: BoxFit.fill),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  Constants.welcome,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: Dimensions.dim_16,
                      horizontal: Dimensions.dim_32),
                  child: Column(
                    children: [
                      TextFormField(
                        restorationId: RestorationIdTextField.name,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: false,
                            icon: Icon(Icons.person),
                            hintText: RestorationIdTextField.hintName,
                            labelText: TextFieldLabel.name),
                        onSaved: (value) {},
                      ),
                      TextFormField(
                        obscureText: true,
                        restorationId: RestorationIdTextField.password,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            filled: false,
                            icon: Icon(Icons.password),
                            hintText: RestorationIdTextField.hintPassword,
                            labelText: TextFieldLabel.password),
                      ),
                      const SizedBox(height: 20),
                      const ElevatedButton(
                          onPressed: null, child: Text(Constants.login))
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      //   ),
    );
  }
}
