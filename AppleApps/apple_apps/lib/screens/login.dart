import 'package:apple_apps/constants/dime_constants.dart';
import 'package:apple_apps/constants/images_path.dart';
import 'package:apple_apps/constants/string_constants.dart';
import 'package:apple_apps/routes/Routes.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  String name = "";
  late String password = "";

  final GlobalKey<FormFieldState<String>> _passwordFieldKey =
      GlobalKey<FormFieldState<String>>();

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  void _handleSubmitted() {
    if (_validatePassword()) {
      Navigator.pushNamed(context, Routes.home.route);
    } else {
      showInSnackBar(
        "Name or Password might be empty",
      );
    }
  }

  bool _validatePassword() {
    // final passwordField = _passwordFieldKey.currentState!;
    // if (passwordField.value == null || passwordField.value!.isEmpty) {
    //   return false;
    // }
    // if (passwordField.value!.length == 8) {
    //   return true;
    // }
    // return false;
    return name.length > 1 && password.length == 8;
  }

  void showInSnackBar(String value) {
    //ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(_scaffoldKey.currentState!.context)
        .showSnackBar(SnackBar(
      content: Text(value),
    ));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      color: Colors.white,
      title: Constants.title,

      home: Scaffold(
        appBar: AppBar(title: const Text(Constants.title)),
        key: _scaffoldKey,
        // body: Container(
        //   decoration: const BoxDecoration(color: Colors.white),
        body: buildScrollbar(context),
      ),
      //   ),
    );
  }

  Scrollbar buildScrollbar(BuildContext context) {
    return Scrollbar(
      child: SingleChildScrollView(
        restorationId: RestorationIdTextField.scrollView,
        child: Column(
          children: [
            Image.asset(AppImages.loginImage, fit: BoxFit.fill),
            const SizedBox(
              height: 20,
            ),
            Text(
              "${Constants.welcome} $name",
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: Dimensions.dim_16, horizontal: Dimensions.dim_32),
              child: Column(
                children: [
                  TextFormField(
                    restorationId: RestorationIdTextField.name,
                    textInputAction: TextInputAction.next,
                    onChanged: (value) {
                      name = value;
                      setState(() {});
                    },
                    decoration: const InputDecoration(
                        filled: false,
                        icon: Icon(Icons.person),
                        hintText: RestorationIdTextField.hintName,
                        labelText: TextFieldLabel.name),
                    onSaved: (value) {},
                  ),
                  PasswordField(
                    restorationId: 'password_field',
                    textInputAction: TextInputAction.next,
                    fieldKey: _passwordFieldKey,
                    helperText: RestorationIdTextField.helperTextPassword,
                    labelText: TextFieldLabel.password,
                    onFieldSubmitted: (value) {
                      setState(() {
                        password = value;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                    style:
                        TextButton.styleFrom(minimumSize: const Size(120, 40)),
                    onPressed: () {
                      _handleSubmitted();
                    },
                    child: const Text(Constants.login),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordField extends StatefulWidget {
  const PasswordField(
      {Key? key,
      this.restorationId,
      this.fieldKey,
      this.hintText,
      this.labelText,
      this.helperText,
      this.onSaved,
      this.validator,
      this.onFieldSubmitted,
      this.focusNode,
      this.textInputAction})
      : super(key: key);

  final String? restorationId;
  final Key? fieldKey;
  final String? hintText;
  final String? labelText;
  final String? helperText;
  final FormFieldSetter<String>? onSaved;
  final FormFieldValidator<String>? validator;
  final ValueChanged<String>? onFieldSubmitted;
  final FocusNode? focusNode;
  final TextInputAction? textInputAction;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> with RestorationMixin {
  final RestorableBool _obscureText = RestorableBool(true);

  @override
  String? get restorationId => widget.restorationId;

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_obscureText, "obscure_text");
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      key: widget.fieldKey,
      restorationId: 'password_text_field',
      obscureText: _obscureText.value,
      maxLength: 8,
      onSaved: widget.onSaved,
      validator: widget.validator,
      onFieldSubmitted: widget.onFieldSubmitted,
      decoration: InputDecoration(
        filled: false,
        icon: const Icon(Icons.person),
        hintText: widget.hintText,
        helperText: widget.helperText,
        labelText: widget.labelText,
        suffixIcon: IconButton(
          onPressed: () {
            setState(() {
              _obscureText.value = !_obscureText.value;
            });
          },
          hoverColor: Colors.transparent,
          icon: Icon(
            _obscureText.value ? Icons.visibility : Icons.visibility_off,
            semanticLabel: _obscureText.value ? "No more" : "No more",
          ),
        ),
      ),
    );
  }
}
