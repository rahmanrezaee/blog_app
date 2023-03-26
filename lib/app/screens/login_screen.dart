import 'package:flutter/material.dart';

import '../../theme/colors.dart';
import '../routes/app_pages.dart';
import "../services/auth_methods.dart";
import '../util/const.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  void loginUser() async {
    setState(() {
      _isLoading = true;
    });
    String res = await AuthMethods().loginUser(
        email: _emailController.text, password: _passwordController.text);
    if (res == 'success') {
      setState(() {
        _isLoading = false;
      });

      Navigator.pushNamed(context, Routes.HOME);
    } else {
      setState(() {
        _isLoading = false;
      });
      showAlert(res);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Flexible(
                child: Container(),
                flex: 2,
              ),
             
              const SizedBox(
                height: 64,
              ),
              TextField(
                decoration: InputDecoration(
                  hintText: 'Enter your email',
                ),
                keyboardType:  TextInputType.emailAddress,
                controller: _emailController,
              ),
              const SizedBox(
                height: 24,
              ),
              TextField(
                  decoration: InputDecoration(
                  hintText: 'Enter your password',
                ),
              
                keyboardType: TextInputType.visiblePassword,
                controller: _passwordController,
                
              ),
              const SizedBox(
                height: 24,
              ),
              InkWell(
                onTap: loginUser,
                child: Container(
                  child: !_isLoading
                      ? const Text(
                          'Log in',
                        )
                      :  CircularProgressIndicator(
                          color: AppColors.brandColor,
                        ),
                  width: double.infinity,
                  alignment: Alignment.center,
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  decoration:  ShapeDecoration(
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                    ),
                    color: AppColors.blueColor,
                  ),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              Flexible(
                child: Container(),
                flex: 2,
              ),
             
            ],
          ),
        ),
      ),
    );
  }
}
