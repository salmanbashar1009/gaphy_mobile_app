import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaphy_mobile_app/core/constant/app_colors.dart';
import 'package:gaphy_mobile_app/presentation/common/primary_button.dart';
import 'package:gaphy_mobile_app/presentation/features/login/view_model/login_provider.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    /// text theme
    final bodyMedium = Theme.of(context).textTheme.bodyMedium;
    final titleLarge = Theme.of(context).textTheme.titleLarge;
    final bodyLarge = Theme.of(context).textTheme.bodyLarge;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.w),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 80.h,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text(
                        "Welcome Back",
                        style: titleLarge,
                      )),
                  SizedBox(
                    height: 50.h,
                  ),
                  Text(
                    "Email*",
                    style: bodyMedium!.copyWith(
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  SizedBox(
                    height: 6.h,
                  ),
                  TextFormField(
                    controller: _emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(hintText: "Enter your email"),
                    validator: (String? value) {
                      if (value?.isEmpty ?? true) {
                        return "Enter a valid email";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Text("Password*",
                      style: bodyMedium.copyWith(fontWeight: FontWeight.w500)),
                  SizedBox(
                    height: 6.h,
                  ),
                  Consumer<LoginProvider>(
                      builder: (context, loginProvider, child) {
                    return TextFormField(
                      controller: _passwordController,
                      obscureText: !loginProvider.isVisible,
                      decoration: InputDecoration(
                          hintText: "******",
                          suffixIcon: GestureDetector(
                              onTap: () {
                                loginProvider.toggleVisibility();
                              },
                              child: Icon(loginProvider.isVisible
                                  ? Icons.visibility_outlined
                                  : Icons.visibility_off_outlined))),
                      validator: (String? value) {
                        if ((value?.isEmpty ?? true) || (value!.length <= 5)) {
                          return "Wrong Password";
                        }
                        return null;
                      },
                    );
                  }),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {},
                      child: Text(
                        "Forget Password?",
                        style: bodyMedium.copyWith(
                            decoration: TextDecoration.underline,
                            fontWeight: FontWeight.w500,
                            color: AppColors.red,
                            decorationColor: AppColors.red),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 44.h,
                  ),
                  SizedBox(
                    height: 50.h,
                    width: double.infinity,
                    child: Consumer<LoginProvider>(
                        builder: (context, loginProvider, child) {
                      return Visibility(
                          visible: loginProvider.isLoginInProgress == false,
                          replacement: const Center(
                            child: CircularProgressIndicator(
                              color: AppColors.primaryColor,
                            ),
                          ),
                          child: PrimaryButton(
                              title: "Log in",
                              onTap: () async {
                                FocusScope.of(context).unfocus();
                                if (!_formKey.currentState!.validate()) {
                                  return;
                                }
                                await loginProvider.userLogin(
                                    email: _emailController.text.trim(),
                                    password: _passwordController.text);

                                _emailController.clear();
                                _passwordController.clear();

                              }));

                    }),
                  ),
                  SizedBox(
                    height: 80.h,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: RichText(
                      text: TextSpan(children: <TextSpan>[
                        TextSpan(
                          text: "Don't have account?  ",
                          style:
                              bodyLarge!.copyWith(fontWeight: FontWeight.w500),
                        ),
                        TextSpan(
                            text: "Sign up",
                            style: bodyLarge.copyWith(color: AppColors.red),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(content: Text("on tap detected")));
                              }),
                      ]),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
