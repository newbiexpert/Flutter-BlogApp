import 'package:flutter/material.dart';
import 'package:flutter_blog_app/provider/login_page_provider.dart';
import 'package:flutter_blog_app/shared/theme.dart';
import 'package:flutter_blog_app/ui/widgets/login/form_login_widget.dart';
import 'package:flutter_blog_app/ui/widgets/login/header_login_widget.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  late String email;
  late String password;

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: 24,
          vertical: 65,
        ),
        children: [
          HeaderLogin(
            back: () {
              Navigator.of(context).pop();
            },
          ),
          Form(
            key: formKey,
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                FormLoginWidget(
                  hintText: "Masukan Email",
                  labelText: "Email",
                  maxLength: 33,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Email/Username is Required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    email = value!;
                  },
                ),
                FormLoginWidget(
                  inputType: TextInputType.text,
                  hintText: "Masukan Password",
                  labelText: "Password",
                  maxLength: 33,
                  needObscure: true,
                  validator: (String? value) {
                    if (value!.isEmpty) {
                      return 'Password is Required';
                    }
                    return null;
                  },
                  onSaved: (String? value) {
                    password = value!;
                  },
                ),
                const SizedBox(
                  height: 15.0,
                ),
                Column(
                  children: [
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45.0,
                      child: ElevatedButton(
                        onPressed: () async {},
                        style: ElevatedButton.styleFrom(
                          primary: blueColor,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: context.watch<LoginProvider>().isCompleted
                            ? Text(
                                "Login",
                                style: whiteTextFont,
                              )
                            : const CircularProgressIndicator(
                                color: whiteColor,
                                strokeWidth: 3.0,
                                semanticsLabel: "Loading...",
                              ),
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    Text(
                      "or",
                      style: greyTextFont.copyWith(
                        fontSize: 15.0,
                        fontWeight: regular,
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 45.0,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        style: ElevatedButton.styleFrom(
                          primary: whiteColor,
                          shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: blueColor,
                              width: 1.0,
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                        ),
                        child: Text(
                          "Continue Without Login",
                          style: blueTextFont,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
