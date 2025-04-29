import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:gaphy_mobile_app/core/constant/app_colors.dart';
import 'package:gaphy_mobile_app/presentation/common/primary_button.dart';
import 'package:gaphy_mobile_app/presentation/theme/app_input_decoration_theme.dart';
class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 80.h,),
                Align(
                    alignment: Alignment.center,
                    child: Text("Log in", style: titleLarge,)
                ),
                SizedBox(height: 50.h,),
                Text(
                  "Email*",
                  style: bodyMedium!.copyWith(
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(height: 6.h,),
                TextFormField(
                 decoration: InputDecoration(
                   hintText: "Enter your email"
                 ),
                ),
                SizedBox(height: 12.h,),
                Text("Password*",
                    style:bodyMedium!.copyWith(fontWeight: FontWeight.w500)),
                SizedBox(height: 6.h,),
                TextFormField(
                  decoration: InputDecoration(hintText: "******"),
                ),
                SizedBox(height: 12.h,),
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: (){},
                    child: Text(
                      "Forget Password?",
                      style: bodyMedium!.copyWith(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          color: AppColors.red,
                          decorationColor: AppColors.red),
                    ),
                  ),
                ),
                SizedBox(height: 44.h,),
                SizedBox(
                  height: 50.h,
                  width: double.infinity,
                  child: PrimaryButton(
                    title: "Log in",
                    onTap: () {}
                  ),
                ),
                SizedBox(height: 80.h,),
                Align(
                  alignment: Alignment.center,
                  child: RichText(
                    text: TextSpan(
                        children: <TextSpan>[
                          TextSpan(text:  "Don't have account?  ",
                            style:bodyLarge!.copyWith(fontWeight: FontWeight.w500),),
                          TextSpan(text: "Sign up",
                              style: bodyLarge!
                                  .copyWith(color: AppColors.red),
                              recognizer: TapGestureRecognizer()
                                ..onTap = (){
                                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("on tap detected")));
                                }
                          ),
                        ]
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}